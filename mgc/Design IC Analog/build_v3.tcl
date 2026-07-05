# build_v3.tcl -- place + power + net1/net2 (verified: 0 spacing/width/via)
source route_power.tcl
# net1/net2 : met1 stubs + met2 trunks + via1
box 4.895um 11.285um 6.290um 13.285um ; paint m1
box 5.890um 11.285um 6.290um 20.200um ; paint m1
box 5.890um 19.800um 6.290um 20.200um ; paint m1
box 14.895um 11.285um 16.290um 13.285um ; paint m1
box 15.890um 11.285um 16.290um 20.200um ; paint m1
box 15.890um 19.800um 16.290um 20.200um ; paint m1
box 57.585um 19.595um 57.895um 20.200um ; paint m1
box 57.540um 19.800um 57.940um 20.200um ; paint m1
box 24.895um 11.285um 26.290um 13.285um ; paint m1
box 25.890um 11.285um 26.290um 18.200um ; paint m1
box 25.890um 17.800um 26.290um 18.200um ; paint m1
box 34.895um 11.285um 36.290um 13.285um ; paint m1
box 35.890um 11.285um 36.290um 18.200um ; paint m1
box 35.890um 17.800um 36.290um 18.200um ; paint m1
box 53.585um 17.800um 53.895um 19.655um ; paint m1
box 53.540um 17.800um 53.940um 18.200um ; paint m1
box 5.890um 19.800um 6.290um 20.200um ; paint m2
box 15.890um 19.800um 16.290um 20.200um ; paint m2
box 57.540um 19.800um 57.940um 20.200um ; paint m2
box 5.930um 19.840um 57.900um 20.160um ; paint m2
box 25.890um 17.800um 26.290um 18.200um ; paint m2
box 35.890um 17.800um 36.290um 18.200um ; paint m2
box 53.540um 17.800um 53.940um 18.200um ; paint m2
box 25.930um 17.840um 53.900um 18.160um ; paint m2
box 5.950um 19.860um 6.230um 20.140um ; paint via1
box 15.950um 19.860um 16.230um 20.140um ; paint via1
box 57.600um 19.860um 57.880um 20.140um ; paint via1
box 25.950um 17.860um 26.230um 18.140um ; paint via1
box 35.950um 17.860um 36.230um 18.140um ; paint via1
box 53.600um 17.860um 53.880um 18.140um ; paint via1
select clear ; box 0 0 0 0
save dac_2bit ; gds write dac_2bit.gds
puts "=== build_v3 done: power + net1/net2 routed ==="
