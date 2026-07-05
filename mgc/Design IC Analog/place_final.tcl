# place_final.tcl -- placement; resistors in LADDER order (R6 R1 R4 R2 R5)
set P sky130_fd_pr__pfet_01v8_N5VJYY
set N sky130_fd_pr__nfet_01v8_HYREKM
set R  sky130_fd_pr__res_high_po_0p35_N4AVSQ
set R2 sky130_fd_pr__res_high_po_0p35_S5RWJ9
load _scratch_reset_
catch {cellname delete dac_2bit}
catch {file delete dac_2bit.mag}
load dac_2bit
select clear ; box 0 0 0 0
proc pc {c x y} { box ${x}um ${y}um [expr {$x+1.0}]um [expr {$y+1.0}]um ; getcell $c ; select clear }
proc pf {c x y} { box ${x}um ${y}um [expr {$x+1.0}]um [expr {$y+1.0}]um ; getcell $c ; upsidedown ; select clear }
foreach cx {4 14 24 34} { pc $N $cx 9 }
foreach cx {4 14 24 34} { pf $P $cx 29 }
pc $R2 45 19
pc $R2 49 19
pc $R  53 19
pc $R2 57 19
pc $R  61 19
box -6um 37um 66um 38um ; paint m1 ; label Vref c m1 ; port make
box -6um 0um 66um 1um   ; paint m1 ; label VSS  c m1 ; port make
box 63.0um 32.0um 64.0um 33.0um ; paint m1 ; label Vout c m1 ; port make
select clear ; box 0 0 0 0
save dac_2bit
puts "=== place_final (ladder order) done ==="
