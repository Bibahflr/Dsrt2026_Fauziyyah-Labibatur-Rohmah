#==============================================================================
# build_route1.tcl -- placement + STAGE 1 routing for the 2-bit DAC (dac2bitrapi)
#   Places devices (PMOS flipped so bulk faces the Vref rail), then routes on
#   met1: transmission-gate S/D merges, all bulk taps, and the Vref/VSS switch
#   sides up/down to the rails. net1/net2 across-column, ladder, and gates are
#   later stages. Run: source build_route1.tcl
#==============================================================================
set CELL_PFET  sky130_fd_pr__pfet_01v8_N5VJYY
set CELL_NFET  sky130_fd_pr__nfet_01v8_HYREKM
set CELL_R     sky130_fd_pr__res_high_po_0p35_N4AVSQ
set CELL_R2    sky130_fd_pr__res_high_po_0p35_S5RWJ9

# bulletproof reset
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

# NMOS row y=9 (normal), PMOS row y=29 (flipped: bulk up toward Vref)
foreach cx {4 14 24 34} { placecell $CELL_NFET $cx 9 }
foreach cx {4 14 24 34} { placeflip $CELL_PFET $cx 29 }

# R-2R ladder: R4,R5 = R ; R1,R2,R6 = 2R
placecell $CELL_R  45 19
placecell $CELL_R  49 19
placecell $CELL_R2 53 19
placecell $CELL_R2 57 19
placecell $CELL_R2 61 19

# power rails
box -6um 37um 66um 38um ; paint m1 ; label Vref c m1 ; port make
box -6um 0um 66um 1um   ; paint m1 ; label VSS  c m1 ; port make

# gate/output pads
proc pad {name x y} {
    box ${x}um ${y}um [expr {$x + 1.0}]um [expr {$y + 1.0}]um
    paint m1 ; label $name c m1 ; port make ; select clear
}
pad b1 -5 30 ; pad b1_bar -5 26 ; pad b0 -5 10 ; pad b0_bar -5 6 ; pad Vout 63 18

#--- STAGE 1 met1 wires -------------------------------------------------------
box 3.665um 11.500um 3.895um 26.500um ; paint m1
box 4.105um 11.500um 4.335um 26.500um ; paint m1
box 3.855um 0.000um 4.145um 6.340um ; paint m1
box 3.855um 31.660um 4.145um 38.000um ; paint m1
box 3.665um 31.500um 3.895um 38.000um ; paint m1
box 13.665um 11.500um 13.895um 26.500um ; paint m1
box 14.105um 11.500um 14.335um 26.500um ; paint m1
box 13.855um 0.000um 14.145um 6.340um ; paint m1
box 13.855um 31.660um 14.145um 38.000um ; paint m1
box 13.665um 0.000um 13.895um 11.500um ; paint m1
box 23.665um 11.500um 23.895um 26.500um ; paint m1
box 24.105um 11.500um 24.335um 26.500um ; paint m1
box 23.855um 0.000um 24.145um 6.340um ; paint m1
box 23.855um 31.660um 24.145um 38.000um ; paint m1
box 23.665um 31.500um 23.895um 38.000um ; paint m1
box 33.665um 11.500um 33.895um 26.500um ; paint m1
box 34.105um 11.500um 34.335um 26.500um ; paint m1
box 33.855um 0.000um 34.145um 6.340um ; paint m1
box 33.855um 31.660um 34.145um 38.000um ; paint m1
box 33.665um 0.000um 33.895um 11.500um ; paint m1

# label the two partial switched nets (S-side merges)
box 4.105um 18.0um 4.335um 18.0um  ; label net1 c m1
box 24.105um 18.0um 24.335um 18.0um ; label net2 c m1

select clear
box 0 0 0 0
save dac_2bit
gds write dac_2bit.gds
puts "=== build_route1 done: 13 devices + stage-1 met1 routing ==="
