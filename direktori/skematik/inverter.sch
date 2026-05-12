v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -140 -340 -140 -290 {lab=#net1}
N -470 -340 -140 -340 {lab=#net1}
N -470 -340 -470 -220 {lab=#net1}
N -220 -260 -180 -260 {lab=in}
N -220 -240 -220 -110 {lab=in}
N -220 -110 -180 -110 {lab=in}
N -140 -190 -140 -140 {lab=out}
N -320 -240 -320 -220 {lab=in}
N -320 -240 -220 -240 {lab=in}
N -220 -260 -220 -240 {lab=in}
N -140 -340 -80 -340 {lab=#net1}
N -80 -340 -80 -260 {lab=#net1}
N -140 -260 -80 -260 {lab=#net1
}
N -470 -160 -470 -60 {lab=GND}
N -320 -60 -140 -60 {lab=GND}
N -140 -80 -140 -60 {lab=GND}
N -320 -160 -320 -60 {lab=GND}
N -400 -60 -320 -60 {lab=GND}
N -140 -110 -80 -110 {lab=GND}
N -80 -110 -80 -60 {lab=GND}
N -140 -60 -80 -60 {lab=GND}
N -140 -190 -30 -190 {lab=out}
N -140 -230 -140 -190 {lab=out}
N -400 -60 -400 -40 {lab=GND}
N -470 -60 -400 -60 {lab=GND}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -160 -110 0 0 {name=M1
W=4
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
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -160 -260 0 0 {name=M2
W=12
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
C {vsource.sym} -470 -190 0 0 {name=V1 value=1.8 savecurrent=false}
C {vsource.sym} -320 -190 0 0 {name=V2 value="pulse(0 1.8 1n 1n 1n 10n 20n)" savecurrent=false
*value=0}
C {lab_pin.sym} -320 -240 0 0 {name=p1 sig_type=std_logic lab=in}
C {gnd.sym} -400 -40 0 0 {name=l1 lab=GND
}
C {code.sym} -320 30 0 0 {name = TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".lib /foss/pdks/ciel/sky130/versions/7b70722e33c03fcb5dabcf4d479fb0822d9251c9/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {lab_pin.sym} -30 -190 2 0 {name=p2 sig_type=std_logic lab=out
}
C {code_shown.sym} 80 -250 0 0 {name=s1 only_toplevel=false value="
*.option wnflag=0
*.option savecurrents
*.control
*save all
*dc V1 0 1.8 0.01
*plot In vOut
*op
*.endc

.option wnflag=0
.option savecurrents
.control
save all
*Simulasi transient selama 50 nanodetik
tran 0.1n 50n
plot v(in) v(out)
.endc
"}
