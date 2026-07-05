#==============================================================================
# place_dac_w5.tcl  --  GUI-free builder for the 2-bit R-2R DAC core (W=5um)
#------------------------------------------------------------------------------
# Instances the sky130 device master cells with getcell + micron positioning.
# RUN in your open Magic (sky130A):  source place_dac_w5.tcl
#------------------------------------------------------------------------------

# device master cells (edit if your suffixes differ)
set CELL_PFET  sky130_fd_pr__pfet_01v8_N5VJYY          ;# W=5um L=0.15
set CELL_NFET  sky130_fd_pr__nfet_01v8_HYREKM          ;# W=5um L=0.15
set CELL_R     sky130_fd_pr__res_high_po_0p35_N4AVSQ   ;# L=8.6um  -> R
set CELL_R2    sky130_fd_pr__res_high_po_0p35_S5RWJ9   ;# L=17.2um -> 2R

puts "\n=== place_dac_w5.tcl : building 2-bit DAC (W=5) ==="

# Bulletproof reset: purge memory + delete stale .mag, then load fresh empty cell
load _scratch_reset_
catch {cellname delete dac_2bit}
catch {file delete dac_2bit.mag}
load dac_2bit
select clear
box 0 0 0 0

proc placecell {cellname x y} {
    box ${x}um ${y}um [expr {$x + 1.0}]um [expr {$y + 1.0}]um
    if {[catch {getcell $cellname} err]} {
        puts "ERROR: getcell $cellname failed: $err"
        return
    }
    select clear
    puts "  placed $cellname at ${x},${y} um"
}

# 4 transmission gates: PMOS row y=29, NMOS row y=9 (W=5 devices ~7um tall)
placecell $CELL_PFET  4 29
placecell $CELL_NFET  4  9
placecell $CELL_PFET 14 29
placecell $CELL_NFET 14  9
placecell $CELL_PFET 24 29
placecell $CELL_NFET 24  9
placecell $CELL_PFET 34 29
placecell $CELL_NFET 34  9

# R-2R ladder column
placecell $CELL_R  45 19
placecell $CELL_R  49 19
placecell $CELL_R2 53 19
placecell $CELL_R2 57 19
placecell $CELL_R2 61 19

# power rails (metal1)
box -6um 37um 66um 38um
paint m1
label Vref c m1
port make
box -6um 0um 66um 1um
paint m1
label VSS c m1
port make

# signal port pads
proc pad {name x y} {
    box ${x}um ${y}um [expr {$x + 1.0}]um [expr {$y + 1.0}]um
    paint m1
    label $name c m1
    port make
    select clear
}
pad b1     -5 30
pad b1_bar -5 26
pad b0     -5 10
pad b0_bar -5  6
pad Vout   63 18

select clear
box 0 0 0 0
save dac_2bit
gds write dac_2bit.gds
puts "=== done: dac_2bit saved (.mag + .gds) ==="
