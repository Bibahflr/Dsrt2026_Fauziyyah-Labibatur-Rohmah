v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -580 -600 -350 -600 {lab=Vref}
N -470 -640 -470 -600 {lab=Vref}
N -470 -640 60 -640 {lab=Vref}
N 60 -640 60 -610 {lab=Vref}
N -50 -610 60 -610 {lab=Vref}
N 60 -610 180 -610 {lab=Vref}
N -580 -540 -350 -540 {lab=#net1}
N -600 -640 -470 -640 {lab=Vref}
N -580 -360 -350 -360 {lab=0}
N -580 -300 -350 -300 {lab=#net1}
N -510 -400 -510 -360 {lab=0}
N -510 -400 0 -400 {lab=0}
N 0 -400 0 -360 {lab=0}
N -60 -360 0 -360 {lab=0}
N 0 -360 170 -360 {lab=0}
N -60 -300 170 -300 {lab=#net2}
N -50 -550 180 -550 {lab=#net2}
N -610 -400 -510 -400 {lab=0}
N -470 -540 -470 -300 {lab=#net1}
N 60 -550 60 -300 {lab=#net2}
N -580 -330 -540 -330 {lab=Vref}
N -350 -330 -310 -330 {lab=0}
N -310 -400 -310 -330 {lab=0}
N -580 -570 -530 -570 {lab=Vref}
N -530 -640 -530 -570 {lab=Vref}
N -60 -330 -0 -330 {lab=Vref}
N -50 -580 20 -580 {lab=Vref}
N 20 -640 20 -580 {lab=Vref}
N -350 -570 -280 -570 {lab=0}
N 180 -580 260 -580 {lab=0}
N 0 -400 240 -400 {lab=0}
N 240 -400 240 -330 {lab=0}
N 170 -330 240 -330 {lab=0}
N 390 -430 630 -430 {lab=n1}
N 690 -430 780 -430 {lab=Vout}
N 780 -430 840 -430 {lab=Vout}
N -800 -570 -800 -550 {lab=0}
N -1130 -340 -1130 -330 {lab=0}
N -870 -340 -870 -330 {lab=0}
N -1130 -170 -1130 -150 {lab=0}
N -870 -170 -870 -150 {lab=0}
N 310 -430 330 -430 {lab=n0}
N 60 -300 60 -240 {lab=#net2}
N -470 -300 -470 -200 {lab=#net1}
N -470 -200 490 -200 {lab=#net1}
N 490 -330 490 -200 {lab=#net1}
N 490 -430 490 -390 {lab=n1}
N 60 -240 250 -240 {lab=#net2}
N 250 -330 250 -240 {lab=#net2}
N 310 -430 310 -400 {lab=n0}
N 240 -540 240 -520 {lab=0}
N 240 -540 310 -540 {lab=0}
N 310 -480 310 -430 {lab=n0}
N 310 -340 310 -330 {lab=#net2}
N 250 -330 310 -330 {lab=#net2}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -370 -570 0 0 {name=M1
W=5
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -600 -570 0 0 {name=M2
W=5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -370 -330 0 0 {name=M4
W=5
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -600 -330 0 0 {name=M5
W=5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 160 -580 0 0 {name=M6
W=5
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -70 -580 0 0 {name=M7
W=5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 150 -330 0 0 {name=M8
W=5
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -80 -330 0 0 {name=M9
W=5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/res_high_po_0p35.sym} 310 -370 0 0 {name=R1
L=17.2
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/res_high_po_0p35.sym} 490 -360 0 0 {name=R2
L=17.2
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {vsource.sym} -800 -600 0 0 {name=V1 value=1.8 savecurrent=false}
C {vsource.sym} -1130 -370 0 0 {name=Vb1_bar value="pulse(1.8 0 0 1n 1n 10u 20u)" savecurrent=false
}
C {vsource.sym} -870 -370 0 0 {name=Vb1 value="pulse(0 1.8 0 1n 1n 10u 20u)" savecurrent=false
}
C {vsource.sym} -1130 -200 0 0 {name=Vb0_bar value="pulse(1.8 0 0 1n 1n 5u 10u)" savecurrent=false
}
C {vsource.sym} -870 -200 0 0 {name=Vb0 value="pulse(0 1.8 0 1n 1n 5u 10u)" savecurrent=false
}
C {gnd.sym} -800 -550 0 0 {name=l1 lab=0}
C {gnd.sym} -870 -330 0 0 {name=l2 lab=0}
C {gnd.sym} -1130 -330 0 0 {name=l3 lab=0}
C {gnd.sym} -1130 -150 0 0 {name=l4 lab=0}
C {gnd.sym} -870 -150 0 0 {name=l5 lab=0}
C {lab_pin.sym} -600 -640 0 0 {name=p1 sig_type=std_logic lab=Vref}
C {gnd.sym} -610 -400 0 0 {name=l6 lab=0}
C {lab_pin.sym} -540 -330 2 0 {name=p2 sig_type=std_logic lab=Vref}
C {lab_pin.sym} 0 -330 2 0 {name=p3 sig_type=std_logic lab=Vref}
C {gnd.sym} -280 -570 0 0 {name=l7 lab=0}
C {gnd.sym} 260 -580 0 0 {name=l8 lab=0}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/res_high_po_0p35.sym} 360 -430 1 0 {name=R4
L=8.6
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/res_high_po_0p35.sym} 660 -430 1 0 {name=R5
L=8.6
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {lab_pin.sym} -800 -630 0 0 {name=p4 sig_type=std_logic lab=Vref}
C {lab_pin.sym} -620 -570 0 0 {name=p5 sig_type=std_logic lab=b1_bar}
C {lab_pin.sym} -390 -570 0 0 {name=p6 sig_type=std_logic lab=b1}
C {lab_pin.sym} -90 -580 0 0 {name=p7 sig_type=std_logic lab=b0_bar}
C {lab_pin.sym} 140 -580 0 0 {name=p8 sig_type=std_logic lab=b0}
C {lab_pin.sym} -620 -330 0 0 {name=p9 sig_type=std_logic lab=b1}
C {lab_pin.sym} -390 -330 0 0 {name=p10 sig_type=std_logic lab=b1_bar}
C {lab_pin.sym} -100 -330 0 0 {name=p11 sig_type=std_logic lab=b0}
C {lab_pin.sym} 130 -330 0 0 {name=p12 sig_type=std_logic lab=b0_bar}
C {lab_pin.sym} -1130 -400 0 0 {name=p13 sig_type=std_logic lab=b1_bar}
C {lab_pin.sym} -870 -400 0 0 {name=p14 sig_type=std_logic lab=b1}
C {lab_pin.sym} -1130 -230 0 0 {name=p15 sig_type=std_logic lab=b0_bar}
C {lab_pin.sym} -870 -230 0 0 {name=p16 sig_type=std_logic lab=b0}
C {lab_pin.sym} 840 -430 2 0 {name=p17 sig_type=std_logic lab=Vout}
C {code.sym} -120 -820 0 0 {name=s2 only_toplevel=false value="
.lib /foss/pdks/ciel/sky130/versions/7b70722e33c03fcb5dabcf4d479fb0822d9251c9/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.options method=gear
.options gmin=1e-12
.options abstol=1e-12 reltol=1e-3

.ic v(net1)=0 v(net2)=0 v(Vout)=0
.tran 0.1u 80u uic
 
.control
run 
let n1_shift = v(n1) + 1
let n0_shift = v(n0) + 2
plot v(Vout) n1_shift n0_shift
.endc
"}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/res_high_po_0p35.sym} 310 -510 0 0 {name=R6
L=17.2
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {gnd.sym} 240 -520 0 0 {name=l9 lab=0}
C {lab_pin.sym} 310 -430 0 0 {name=p18 sig_type=std_logic lab=n0}
C {lab_pin.sym} 490 -430 1 0 {name=p19 sig_type=std_logic lab=n1}
