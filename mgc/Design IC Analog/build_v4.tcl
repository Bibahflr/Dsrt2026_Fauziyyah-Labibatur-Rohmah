# build_v4.tcl -- FULL routed DAC: place + power + net1/net2 + gates (all verified)
source route_power.tcl
# --- net1/net2 ---
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
# --- gates (b1 b1_bar b0 b0_bar) ---
box 4.750um 15.085um 4.900um 21.700um ; paint m1
box 4.625um 21.300um 5.025um 21.700um ; paint m1
box 14.750um 28.300um 14.900um 29.530um ; paint m1
box 14.750um 28.300um 18.365um 28.700um ; paint m1
box 18.215um 21.300um 18.365um 28.700um ; paint m1
box 18.090um 21.300um 18.490um 21.700um ; paint m1
box 14.750um 15.085um 14.900um 22.700um ; paint m1
box 14.625um 22.300um 15.025um 22.700um ; paint m1
box 4.750um 28.300um 4.900um 29.530um ; paint m1
box 4.750um 28.300um 8.365um 28.700um ; paint m1
box 8.215um 22.300um 8.365um 28.700um ; paint m1
box 8.090um 22.300um 8.490um 22.700um ; paint m1
box 24.750um 15.085um 24.900um 23.700um ; paint m1
box 24.625um 23.300um 25.025um 23.700um ; paint m1
box 34.750um 28.300um 34.900um 29.530um ; paint m1
box 34.750um 28.300um 38.365um 28.700um ; paint m1
box 38.215um 23.300um 38.365um 28.700um ; paint m1
box 38.090um 23.300um 38.490um 23.700um ; paint m1
box 34.750um 15.085um 34.900um 24.700um ; paint m1
box 34.625um 24.300um 35.025um 24.700um ; paint m1
box 24.750um 28.300um 24.900um 29.530um ; paint m1
box 24.750um 28.300um 28.365um 28.700um ; paint m1
box 28.215um 24.300um 28.365um 28.700um ; paint m1
box 28.090um 24.300um 28.490um 24.700um ; paint m1
box 4.625um 21.300um 5.025um 21.700um ; paint m2
box 18.090um 21.300um 18.490um 21.700um ; paint m2
box -6.250um 21.350um 18.490um 21.650um ; paint m2
box 14.625um 22.300um 15.025um 22.700um ; paint m2
box 8.090um 22.300um 8.490um 22.700um ; paint m2
box -6.250um 22.350um 15.025um 22.650um ; paint m2
box 24.625um 23.300um 25.025um 23.700um ; paint m2
box 38.090um 23.300um 38.490um 23.700um ; paint m2
box -6.250um 23.350um 38.490um 23.650um ; paint m2
box 34.625um 24.300um 35.025um 24.700um ; paint m2
box 28.090um 24.300um 28.490um 24.700um ; paint m2
box -6.250um 24.350um 35.025um 24.650um ; paint m2
box 4.685um 21.360um 4.965um 21.640um ; paint via1
box 18.150um 21.360um 18.430um 21.640um ; paint via1
box 14.685um 22.360um 14.965um 22.640um ; paint via1
box 8.150um 22.360um 8.430um 22.640um ; paint via1
box 24.685um 23.360um 24.965um 23.640um ; paint via1
box 38.150um 23.360um 38.430um 23.640um ; paint via1
box 34.685um 24.360um 34.965um 24.640um ; paint via1
box 28.150um 24.360um 28.430um 24.640um ; paint via1
box -6.250um 21.350um -5.650um 21.650um ; label b1 c m2 ; port make
box -6.250um 22.350um -5.650um 22.650um ; label b1_bar c m2 ; port make
box -6.250um 23.350um -5.650um 23.650um ; label b0 c m2 ; port make
box -6.250um 24.350um -5.650um 24.650um ; label b0_bar c m2 ; port make
select clear ; box 0 0 0 0
save dac_2bit ; gds write dac_2bit.gds
puts "=== build_v4 done: power + net1/net2 + gates routed ==="
