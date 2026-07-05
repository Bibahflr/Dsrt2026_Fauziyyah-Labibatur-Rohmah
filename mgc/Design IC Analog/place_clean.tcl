#==============================================================================
# place_clean.tcl -- placement only (no signal routing), for build scripts.
#   NMOS row y=9, PMOS row y=29 (flipped), R-2R ladder, rails, Vout pad.
#==============================================================================
set CELL_PFET sky130_fd_pr__pfet_01v8_N5VJYY
set CELL_NFET sky130_fd_pr__nfet_01v8_HYREKM
set CELL_R    sky130_fd_pr__res_high_po_0p35_N4AVSQ
set CELL_R2   sky130_fd_pr__res_high_po_0p35_S5RWJ9

load _scratch_reset_
catch {cellname delete dac_2bit}
catch {file delete dac_2bit.mag}
load dac_2bit
select clear
box 0 0 0 0

proc placecell {cellname x y} {
    box ${x}um ${y}um [expr {$x + 1.0}]um [expr {$y + 1.0}]um
    getcell $cellname
    select clear
}
proc placeflip {cellname x y} {
    box ${x}um ${y}um [expr {$x + 1.0}]um [expr {$y + 1.0}]um
    getcell $cellname
    upsidedown
    select clear
}

foreach cx {4 14 24 34} { placecell $CELL_NFET $cx 9 }
foreach cx {4 14 24 34} { placeflip $CELL_PFET $cx 29 }
placecell $CELL_R  45 19
placecell $CELL_R  49 19
placecell $CELL_R2 53 19
placecell $CELL_R2 57 19
placecell $CELL_R2 61 19

box -6um 37um 66um 38um ; paint m1 ; label Vref c m1 ; port make
box -6um 0um 66um 1um   ; paint m1 ; label VSS  c m1 ; port make

box 63.0um 18.0um 64.0um 19.0um ; paint m1 ; label Vout c m1 ; port make

select clear
box 0 0 0 0
save dac_2bit
puts "=== place_clean done ==="
