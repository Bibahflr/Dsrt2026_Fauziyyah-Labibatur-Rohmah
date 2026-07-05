# Layout IC DAC 2-bit (R-2R) — Magic + sky130A

Panduan menjalankan generator layout Magic dari skematik xschem `dac 2 bit_baru.sch`.

## Isi paket

| File | Fungsi |
|------|--------|
| `gen_dac_2bit.tcl` | Skrip generator: membuat sel `dac_2bit`, meng-instansiasi 8 MOSFET (4 transmission gate) + 5 resistor R-2R, menata floorplan, rail power, dan port. |
| `dac_2bit.spice` | Netlist SPICE referensi DAC core (tanpa testbench) untuk pembanding LVS. |
| `README_dac_2bit.md` | Dokumen ini. |

## Rangkaian yang dibuat

DAC 2-bit tipe R-2R dengan saklar CMOS transmission gate:

- **net1** = simpul bit b1 (MSB). Di-drive oleh TG_A (ke Vref saat b1=1) dan TG_C (ke VSS saat b1=0).
- **net2** = simpul bit b0. Di-drive oleh TG_B (ke Vref saat b0=1) dan TG_D (ke VSS saat b0=0).
- Tangga resistor: `R9 (R)` net1–net2, `R10 (R)` net2–Vout, `R7 (2R)` net2–VSS, `R1 (2R)` Vout–net3, `R8 (2R)` net3–VSS.

> Catatan: sumber tegangan (V1, Vb0, Vb1, Vb1_bar, Vb2), gnd, dan blok `.control` di skematik adalah **testbench** — tidak ikut di-layout.

Transmission gate (S/D simetris, urutan tidak penting):

| TG | Kontrol | Sambungan | nfet (G) | pfet (G) |
|----|---------|-----------|----------|----------|
| A | b1 | Vref ↔ net1 | M1 (b1) | M2 (b1_bar) |
| B | b0 | Vref ↔ net2 | M3 (b0) | M4 (b0_bar) |
| C | b1_bar | VSS ↔ net1 | M6 (b1_bar) | M5 (b1) |
| D | b0_bar | VSS ↔ net2 | M8 (b0_bar) | M7 (b0) |

Semua MOSFET: `W=1µm, L=0.15µm, nf=1`. Resistor: `res_high_po_0p35`, L=8.6µm (R) / 17.2µm (2R).

## Prasyarat

- Magic VLSI (≥ 8.3) dengan PDK **sky130A** terpasang (open_pdks).
- Variabel lingkungan `PDK_ROOT` ter-set, atau jalankan dari direktori yang punya `sky130A.magicrc`.

## 1. Jalankan generator

```bash
# dari folder berisi file-file ini
magic -d XR -T sky130A
```

Di prompt Magic / tkcon:

```tcl
source gen_dac_2bit.tcl
```

Hasil: sel `dac_2bit` dengan semua device, rail `Vref`/`VSS`, dan port (`Vref b0 b1 b0_bar b1_bar Vout VSS`), tersimpan ke `dac_2bit.mag`.

> Jika muncul error `gencell: no such ...`, buka blok **CONFIG** di atas `gen_dac_2bit.tcl` dan ganti `GC_NFET/GC_PFET/GC_RES` ke bentuk pendek (`sky130::nfet_01v8`, dst.) sesuai versi PDK Anda. Parameter koordinat dalam satuan µm — boleh digeser sesuai selera.

## 2. Selesaikan routing (interaktif)

Skrip menempatkan device + rail + pad. Routing sinyal diselesaikan manual (analog tidak bisa auto-route sembarangan). Checklist koneksi:

- Gabungkan S/D bersama TG_A & TG_C → **net1** → ujung kiri `R9`.
- Gabungkan S/D bersama TG_B & TG_D → **net2** → kanan `R9` / kiri `R10` / atas `R7`.
- Kanan `R10` & atas `R1` → **Vout** → pad `Vout`.
- Junction `R1`–`R8` → **net3** (internal).
- Sisi "Vref" tiap TG_A/TG_B → rail **Vref**; sisi "VSS" tiap TG_C/TG_D & bawah `R7`/`R8` → rail **VSS**.
- Gate: `b1→M1`, `b1_bar→M2/M6`, `b0→M3`, `b0_bar→M4/M8`, `b1→M5`, `b0→M7` dari pad masing-masing.
- Body/well taps: bulk pfet → Vref, bulk nfet → VSS (pasang substrate/well contact di tiap baris).

Gunakan met1 untuk koneksi lokal, met2 untuk jalur menyilang; pasang via (`m2contact`) seperlunya.

## 3. DRC

```tcl
drc check
drc why          ;# di lokasi box jika ada error
```

Perbaiki sampai `drc count` = 0.

## 4. Ekstraksi + LVS

Ekstrak layout ke SPICE:

```tcl
extract all
ext2spice lvs
ext2spice
```

Menghasilkan `dac_2bit.spice` hasil ekstraksi (beri nama berbeda dari referensi, mis. rename dulu ke `dac_2bit_layout.spice`).

Jalankan LVS dengan netgen membandingkan layout vs referensi schematic:

```bash
netgen -batch lvs \
  "dac_2bit_layout.spice dac_2bit" \
  "dac_2bit.spice dac_2bit" \
  $PDK_ROOT/sky130A/libs.tech/netgen/sky130A_setup.tcl \
  dac_2bit_lvs.out
```

Periksa `dac_2bit_lvs.out` → target: **"Circuits match uniformly."**

> Alternatif (disarankan untuk netlist referensi yang 100% otoritatif): buka skematik di xschem, hapus testbench, lalu **Netlist → SPICE**, dan pakai file itu sebagai sisi schematic LVS.

## Tips matching analog

- R-2R butuh rasio resistor presisi: gunakan unit R yang sama dan susun 2R sebagai dua R seri (dummy + common-centroid) bila ingin akurasi tinggi.
- Buat transmission gate identik (orientasi & sekitar sama) agar on-resistance seragam antar bit.
- Tambahkan guard ring + tap rapat untuk mengurangi latch-up dan noise substrat.
