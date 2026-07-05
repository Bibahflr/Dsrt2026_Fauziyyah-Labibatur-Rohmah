#==============================================================================
# place_dac_2bit.tcl  --  GUI-free builder for the 2-bit R-2R DAC core
#------------------------------------------------------------------------------
# Instances the sky130 device master cells (generated earlier via the device
# menu / gencell) using getcell + micron box positioning. Avoids scripted
# gencell (which aborts with a Tk ".params" dialog error on this Magic build).
#
# RUN (in your already-open Magic, sky130A):  source place_dac_2bit.tcl
# Produces: dac_2bit.mag and dac_2bit.gds
#------------------------------------------------------------------------------

# ---- device master cell names (edit if your suffixes differ) -----------------
set CELL_PFET  sky130_fd_pr__pfet_01v8_N5VJYY          ;# W=5um L=0.15
set CELL_NFET  sky130_fd_pr__nfet_01v8_HYREKM          ;# W=5um L=0.15
set CELL_R     sky130_fd_pr__res_high_po_0p35_N4AVSQ   ;# L=8.6um  -> "R"  (R4,R5)
set CELL_R2    sky130_fd_pr__res_high_po_0p35_S5RWJ9   ;# L=17.2um -> "2R" (R1,R2,R6)
#------------------------------------------------------------------------------

puts "\n=== place_dac_2bit.tcl : assembling DAC core ==="

# BULLETPROOF reset so re-running can NEVER stack/contaminate instances:
#   1) switch to throwaway cell  2) purge dac_2bit from memory
#   3) delete stale dac_2bit.mag on disk  4) load a brand-new empty dac_2bit
load _scratch_reset_
catch {cellname delete dac_2bit}
catch {file delete dac_2bit.mag}
load dac_2bit
select clear
box 0 0 0 0

# Place one instance of <cellname> centered near (x,y) in microns.
proc placecell {cellname x y} {
    box ${x}um ${y}um [expr {$x + 1.0}]um [expr {$y + 1.0}]um
    if {[catch {getcell $cellname} err]} {
        puts "ERROR: getcell $cellname failed: $err"
        return
    }
    select clear
    puts "  placed $cellname at ${x},${y} um"
}

#--- 4 CMOS transmission gates : PMOS row (y=29) over NMOS row (y=9) -----------
# W=5 devices are ~7um tall, so rows are spaced well apart vertically.
placecell $CELL_PFET  4 29    ;# pfet TG_A
placecell $CELL_NFET  4  9    ;# nfet TG_A
placecell $CELL_PFET 14 29    ;# pfet TG_B
placecell $CELL_NFET 14  9    ;# nfet TG_B
placecell $CELL_PFET 24 29    ;# pfet TG_C
placecell $CELL_NFET 24  9    ;# nfet TG_C
placecell $CELL_PFET 34 29    ;# pfet TG_D
placecell $CELL_NFET 34  9    ;# nfet TG_D

#--- R-2R ladder column (right) ----------------------------------------------
placecell $CELL_R  45 19      ;# R4  (R)
placecell $CELL_R  49 19      ;# R5  (R)
placecell $CELL_R2 53 19      ;# R1  (2R)
placecell $CELL_R2 57 19      ;# R2  (2R)
placecell $CELL_R2 61 19      ;# R6  (2R)

#--- Power rails (metal1) -----------------------------------------------------
box -6um 37um 66um 38um
paint m1
label Vref c m1
port make
puts "  painted Vref (VDD) rail"

box -6um 0um 66um 1um
paint m1
label VSS c m1
port make
puts "  painted VSS (gnd) rail"

#--- Signal port pads ---------------------------------------------------------
proc pad {name x y} {
    box ${x}um ${y}um [expr {$x + 1.0}]um [expr {$y + 1.0}]um
    paint m1
    label $name c m1
    port make
    select clear
    puts "  port pad $name at ${x},${y} um"
}
pad b1     -5 30
pad b1_bar -5 26
pad b0     -5 10
pad b0_bar -5  6
pad Vout   63 18

#--- Save + export ------------------------------------------------------------
select clear
box 0 0 0 0
save dac_2bit
gds write dac_2bit.gds
puts "=== done: dac_2bit saved to dac_2bit.mag AND dac_2bit.gds ==="
