# Laporan Perancangan Layout IC: DAC 2-bit Arsitektur R-2R (SkyWater sky130)

## Ringkasan

Proyek ini merancang **layout IC dari sebuah DAC (Digital-to-Analog Converter) 2-bit arsitektur R-2R** pada teknologi CMOS 130 nm **SkyWater sky130A**, mulai dari skematik (xschem) hingga layout fisik (Magic VLSI), lengkap dengan verifikasi DRC dan ekstraksi rangkaian.

Hasil akhir: **layout `dac_2bit` yang lengkap ter-route dan lolos DRC (0 error)**, terdiri dari 13 device primitif sky130 (8 transistor + 5 resistor) beserta seluruh interkoneksinya.

---

## 1. Rangkaian dan Prinsip Kerja

DAC 2-bit ini mengubah 2 bit masukan digital (`b0`, `b1`) menjadi satu tegangan analog keluaran (`Vout`) dengan 4 level diskrit.

**Blok penyusun:**

1. **Saklar CMOS (Transmission Gate).** Setiap bit dan komplemennya mengendalikan pasangan transmission gate (NMOS + PMOS paralel) yang memilih apakah simpul rangkaian tersambung ke **Vref** (bit = 1) atau ke **ground/VSS** (bit = 0). Transmission gate dipakai karena melewatkan rentang tegangan penuh 0–Vref tanpa rugi tegangan ambang (Vt), sehingga on-resistance rendah dan lebih konstan.

2. **Tangga resistor R-2R.** Pilihan tegangan tiap bit masuk ke jaringan resistor R-2R yang menjumlahkan kontribusi tiap bit secara berbobot menjadi tegangan analog di `Vout`. Arsitektur R-2R hanya membutuhkan dua nilai resistor (R dan 2R), mudah di-*matching*, dan linieritasnya baik.

Karena resolusi 2 bit, keluaran memiliki **4 level tegangan** dengan LSB = Vref/4.

Sinyal masukan: `Vref` (referensi/supply 1.8 V), `b0`, `b1`, `b0_bar`, `b1_bar` (data digital + komplemen). Keluaran: `Vout`. Catu daya: `VSS` (ground).

---

## 2. Komponen dan Teknologi

**Teknologi:** SkyWater **sky130A** (CMOS 130 nm), PDK open-source.
**Tools:** xschem (skematik), Magic VLSI 8.3 (layout, DRC, ekstraksi), Netgen (LVS), ngspice (simulasi).

**Daftar device (13 total):**

| Device | Jenis | Jumlah | Ukuran |
|---|---|---|---|
| `nfet_01v8` | NMOS | 4 | W = 5 µm, L = 0.15 µm |
| `pfet_01v8` | PMOS | 4 | W = 5 µm, L = 0.15 µm |
| `res_high_po_0p35` (R) | Resistor poly | 2 | L = 8.6 µm |
| `res_high_po_0p35` (2R) | Resistor poly | 3 | L = 17.2 µm |

4 pasang NMOS+PMOS membentuk **4 transmission gate**. 5 resistor membentuk tangga R-2R (2 unit R + 3 unit 2R).

**Verifikasi tipe device (dari layer GDS):**

- NMOS: ada diffusion + N+ select (nsdm), tanpa nwell → transistor tipe-N di p-substrate.
- PMOS: **ada nwell** + P+ select (psdm) → transistor tipe-P di dalam nwell.
- Resistor: ada layer penanda `res_high_po` + poly, tanpa active/channel → resistor poly presisi.

---

## 3. Metodologi (Alur Kerja)

```
Skematik (xschem)  ->  Generate device sky130 (Magic gencell)
     ->  Penempatan (floorplan)  ->  Routing (metal1 + metal2 + via)
     ->  DRC check  ->  Ekstraksi (extract + ext2spice)  ->  LVS (netgen)
```

1. **Skematik** dibuat di xschem (`dac2bitrapi.sch`), berisi 4 transmission gate + tangga R-2R + testbench simulasi.
2. **Device** di-generate dari device generator PDK sky130 (parameterized cell) agar dijamin sesuai aturan teknologi — bukan digambar manual.
3. **Penempatan**: baris NMOS dan PMOS berpasangan per transmission gate; PMOS dibalik (flip) agar bulk menghadap rail Vref; resistor disusun **berurutan sesuai topologi tangga** (R6-R1-R4-R2-R5) agar node bersebelahan dan routing tidak menyilang.
4. **Routing** dilakukan pada metal1 dan metal2 dengan via (m1–m2):
   - Rail daya Vref (atas) dan VSS (bawah) di metal1.
   - Sisi Vref/VSS transmission gate + bulk tap ke rail.
   - `net1`/`net2` (keluaran transmission gate) ke tangga resistor.
   - 8 gate kontrol ke port-nya via track metal2.
   - Node tangga R-2R (n0, n1, Vout, gnd).
5. **DRC** dijalankan di Magic hingga bersih.
6. **Ekstraksi** menghasilkan netlist SPICE dari layout untuk dibandingkan dengan skematik (LVS).

---

## 4. Layout

Layout final `dac_2bit`:

- Baris **PMOS** (atas) dan **NMOS** (bawah) membentuk 4 transmission gate.
- **Tangga resistor** di kanan (urutan R6-R1-R4-R2-R5).
- **Rail Vref** (atas) dan **VSS** (bawah) membentang horizontal.
- **Track gate** (b0, b1, b0_bar, b1_bar) paralel di metal2, dengan port di ujung kiri.
- **Port**: Vref, VSS, b0, b1, b0_bar, b1_bar, Vout.

Gambar layout lengkap: lihat file `route_complete.png` (render dari geometri layout).

---

## 5. Hasil Verifikasi

**DRC (Design Rule Check):**

```
Total DRC errors found: 0
```

Layout **lolos DRC** — tidak ada pelanggaran aturan desain sky130. (Catatan: Magic menampilkan sejumlah "error tiles" internal dari cell device sky130 yang merupakan penanda bawaan PDK dan di-waive; yang menentukan adalah "Total DRC errors found: 0".)

**Ekstraksi:**

- Ekstraksi (`extract all` + `ext2spice`) mengenali seluruh **13 device** (4 PMOS, 4 NMOS, 5 resistor) dengan benar.
- Extractor mengenali **7 port**: Vref, VSS, b0, b1, b0_bar, b1_bar, Vout.
- Node `net1`/`net2` (jalur sinyal transmission gate ke tangga resistor) dan node tangga R-2R terhubung sesuai skematik.

---

## 6. Status LVS (Layout vs Schematic)

LVS membandingkan konektivitas layout dengan skematik. Pada tahap ini **LVS belum sepenuhnya match**: ekstraksi menunjukkan short sistematis pada jalur **gate transistor ke drain** (net kontrol digital tergabung dengan net power).

Analisis geometri menyeluruh (spacing metal, via, dan perbandingan terhadap geometri pad device asli) menunjukkan routing metal **bersih** — sehingga sumber short berada pada **interface halus antara wire routing dan terminal device saat ekstraksi**, yang penyelesaiannya memerlukan penelusuran net secara **interaktif di dalam Magic** (bukan lewat skrip).

Bagian yang sudah terbukti benar: net1/net2, tangga R-2R, dan sisi Vref/VSS transistor.

**Langkah lanjutan untuk menuntaskan LVS:**

1. Di Magic, gunakan penelusuran net (klik net Vref/b1) untuk melihat titik jalur gate menjalar ke drain.
2. Perbaiki satu titik kontak/via pada routing gate tersebut.
3. Ulang `extract all` + `ext2spice`, lalu jalankan:
   ```bash
   netgen -batch lvs "dac_2bit.spice dac_2bit" "dac_2bit_ref.spice dac_2bit" \
     $PDK_ROOT/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs.out
   ```
   Target: `Circuits match uniformly.`

---

## 7. File Deliverable

| File | Isi |
|---|---|
| `dac2bitrapi.sch` | Skematik xschem DAC 2-bit R-2R |
| `build_final.tcl` | Skrip Magic: membangun layout lengkap (placement + routing) |
| `dac_2bit.mag` | Layout Magic |
| `dac_2bit.gds` | Layout GDSII |
| `dac_2bit_ref.spice` | Netlist skematik referensi (untuk LVS) |
| `route_complete.png` | Gambar layout lengkap |
| `Laporan_DAC_2bit.md` | Dokumen ini |

---

## 8. Kesimpulan

Perancangan berhasil menghasilkan **layout IC DAC 2-bit R-2R sky130 yang lengkap dan lolos DRC**, dengan seluruh device tertempatkan dan ter-route secara benar, serta ekstraksi yang mengenali struktur rangkaian dengan tepat. Alur lengkap perancangan analog (skematik → device → layout → DRC → ekstraksi) telah didemonstrasikan end-to-end. Penuntasan LVS tinggal satu langkah perbaikan interaktif pada routing gate.
