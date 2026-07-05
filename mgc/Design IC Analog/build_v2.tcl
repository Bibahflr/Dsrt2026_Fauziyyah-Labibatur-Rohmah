# build_v2.tcl -- placement + power + net1/net2 (all pre-verified)
source route_power.tcl
# --- net1 / net2 (met1 + met2 jumpers + via1) ---
box 4.895um 12.085um 5.440um 12.485um ; paint m1
box 5.310um 12.485um 5.440um 20.500um ; paint m1
box 5.245um 20.370um 5.505um 20.630um ; paint m1
box 14.895um 12.085um 15.440um 12.485um ; paint m1
box 15.310um 12.485um 15.440um 20.500um ; paint m1
box 15.245um 20.370um 15.505um 20.630um ; paint m1
box 57.615um 19.655um 57.865um 20.500um ; paint m1
box 57.610um 20.370um 57.870um 20.630um ; paint m1
box 24.895um 12.085um 25.440um 12.485um ; paint m1
box 25.310um 12.485um 25.440um 19.500um ; paint m1
box 25.245um 19.370um 25.505um 19.630um ; paint m1
box 34.895um 12.085um 35.440um 12.485um ; paint m1
box 35.310um 12.485um 35.440um 19.500um ; paint m1
box 35.245um 19.370um 35.505um 19.630um ; paint m1
box 53.615um 19.500um 53.865um 19.655um ; paint m1
box 53.610um 19.370um 53.870um 19.630um ; paint m1
box 5.245um 20.370um 5.505um 20.630um ; paint m2
box 15.245um 20.370um 15.505um 20.630um ; paint m2
box 57.610um 20.370um 57.870um 20.630um ; paint m2
box 5.245um 20.370um 57.870um 20.630um ; paint m2
box 25.245um 19.370um 25.505um 19.630um ; paint m2
box 35.245um 19.370um 35.505um 19.630um ; paint m2
box 53.610um 19.370um 53.870um 19.630um ; paint m2
box 25.245um 19.370um 53.870um 19.630um ; paint m2
box 5.300um 20.425um 5.450um 20.575um ; paint via1
box 15.300um 20.425um 15.450um 20.575um ; paint via1
box 57.665um 20.425um 57.815um 20.575um ; paint via1
box 25.300um 19.425um 25.450um 19.575um ; paint via1
box 35.300um 19.425um 35.450um 19.575um ; paint via1
box 53.665um 19.425um 53.815um 19.575um ; paint via1
select clear ; box 0 0 0 0
save dac_2bit ; gds write dac_2bit.gds
puts "=== build_v2 done: power + net1/net2 ==="
