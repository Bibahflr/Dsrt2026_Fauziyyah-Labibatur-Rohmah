#==============================================================================
# gen_dac_2bit.tcl
#------------------------------------------------------------------------------
# Magic VLSI layout generator for the 2-bit R-2R DAC core
# Source schematic : dac 2 bit_baru.sch  (xschem, sky130A)
# Target PDK       : sky130A  (open_pdks / Magic gencells)
#
# WHAT THIS SCRIPT DOES
#   * Creates a new cell "dac_2bit"
#   * Instantiates the 8 MOSFETs (4 CMOS transmission gates) and the
#     5 res_high_po_0p35 resistors (R-2R ladder) using sky130 gencells
#   * Places them in an organized floorplan:
#         - PMOS row (near VDD/Vref rail) on top
#         - NMOS row (near VSS/gnd rail) on the bottom
#         - R-2R resistor ladder column on the right
#   * Draws the VDD(Vref) and VSS(gnd) power rails in metal1
#   * Adds labelled ports for: Vref b0 b1 b0_bar b1_bar Vout VSS
#   * Saves the cell to dac_2bit.mag
#
# THIS IS A *STARTING* LAYOUT.  Analog layout is not push-button: after
# sourcing this you complete the signal routing interactively, then run
# DRC + LVS (see README_dac_2bit.md).  The device instances, sizes, power
# rails and pins are generated for you so you only draw the interconnect.
#
# HOW TO RUN
#   1. Open Magic with the sky130A tech, e.g.:
#         magic -d XR -T sky130A
#      (or `magic -rcfile $PDK_ROOT/sky130A/libs.tech/magic/sky130A.magicrc`)
#   2. At the Magic "%" / tkcon prompt:
#         source gen_dac_2bit.tcl
#
# NOTE ON PORTABILITY
#   gencell type names and parameter keys can differ slightly between
#   open_pdks versions.  All of them are collected in the CONFIG block
#   below so you can adjust in one place if a "gencell: no such ..." error
#   appears.  Coordinates are in microns (um).
#==============================================================================

#--------------------------- CONFIG -------------------------------------------
# Device sizes taken directly from the schematic
set FET_W   1.0      ;# um   (W=1)
set FET_L   0.15     ;# um   (L=0.15)
set FET_NF  1        ;# fingers
set R_L     8.6      ;# um   res_high_po_0p35 length for "R"  (R9, R10)
set R2_L    17.2     ;# um   res_high_po_0p35 length for "2R" (R7, R1, R8)

# sky130 gencell type names (change here if your PDK uses different ids)
set GC_NFET "sky130::sky130_fd_pr__nfet_01v8"
set GC_PFET "sky130::sky130_fd_pr__pfet_01v8"
set GC_RES  "sky130::sky130_fd_pr__res_high_po_0p35"
# Some open_pdks builds register the short forms instead. If the long names
# above fail, comment them out and use these:
# set GC_NFET "sky130::nfet_01v8"
# set GC_PFET "sky130::pfet_01v8"
# set GC_RES  "sky130::res_high_po_0p35"
#------------------------------------------------------------------------------

puts "\n=== gen_dac_2bit.tcl : building 2-bit R-2R DAC core ==="

# Start (or reset) the edit cell "dac_2bit" so re-running is idempotent.
# load of a non-existent cell creates a new empty one and makes it current.
load dac_2bit
select top cell
delete            ;# clear any geometry/instances from a previous run
select clear
box 0 0 0 0
snap internal

#------------------------------------------------------------------------------
# Helper: create a gencell device and move its lower-left corner to (x,y) um
#------------------------------------------------------------------------------
proc placedev {gctype name x y params} {
    # create the parameterized device instance
    if {[catch {eval gencell $gctype $name $params} err]} {
        puts "WARNING: gencell '$gctype' for $name failed: $err"
        puts "         -> check the GC_* names in the CONFIG block."
        return
    }
    # gencell leaves the new instance selected; drop it at (x,y)
    select cell $name
    move to ${x}um ${y}um
    select clear
    puts "  placed $name ($gctype) at ${x},${y} um"
}

#==============================================================================
# 1) TRANSMISSION-GATE MOSFETs
#------------------------------------------------------------------------------
#   Each CMOS transmission gate = 1 nfet + 1 pfet in parallel.
#   Logical connectivity (S/D are symmetric -> order not significant):
#
#   TG_A  ctrl b1     : switches  Vref <-> net1   M1(nfet G=b1)     M2(pfet G=b1_bar)
#   TG_B  ctrl b0     : switches  Vref <-> net2   M3(nfet G=b0)     M4(pfet G=b0_bar)
#   TG_C  ctrl b1_bar : switches  VSS  <-> net1   M6(nfet G=b1_bar) M5(pfet G=b1)
#   TG_D  ctrl b0_bar : switches  VSS  <-> net2   M8(nfet G=b0_bar) M7(pfet G=b0)
#
#   Floorplan: PMOS row on top (y=20), NMOS row below (y=6); each TG is a
#   vertically-aligned pmos/nmos pair, 4 TGs spaced 10 um apart in x.
#==============================================================================
set NFET_PARAMS "w $FET_W l $FET_L nf $FET_NF m 1"
set PFET_PARAMS "w $FET_W l $FET_L nf $FET_NF m 1"

set Y_PMOS 20.0
set Y_NMOS  6.0

# TG_A  (x = 2)
placedev $GC_PFET M2  2.0  $Y_PMOS $PFET_PARAMS
placedev $GC_NFET M1  2.0  $Y_NMOS $NFET_PARAMS
# TG_B  (x = 12)
placedev $GC_PFET M4 12.0  $Y_PMOS $PFET_PARAMS
placedev $GC_NFET M3 12.0  $Y_NMOS $NFET_PARAMS
# TG_C  (x = 22)
placedev $GC_PFET M5 22.0  $Y_PMOS $PFET_PARAMS
placedev $GC_NFET M6 22.0  $Y_NMOS $NFET_PARAMS
# TG_D  (x = 32)
placedev $GC_PFET M7 32.0  $Y_PMOS $PFET_PARAMS
placedev $GC_NFET M8 32.0  $Y_NMOS $NFET_PARAMS

#==============================================================================
# 2) R-2R RESISTOR LADDER  (res_high_po_0p35)
#------------------------------------------------------------------------------
#   R9  : net1 -- net2   L=8.6  (R)
#   R10 : net2 -- Vout   L=8.6  (R)
#   R7  : net2 -- VSS    L=17.2 (2R)
#   R1  : Vout -- net3   L=17.2 (2R)
#   R8  : net3 -- VSS    L=17.2 (2R)
#
#   Placed as a column to the right of the transistors (x ~ 46..58).
#==============================================================================
set R_PARAMS  "l $R_L  w 0.35"
set R2_PARAMS "l $R2_L w 0.35"

placedev $GC_RES R9  46.0 22.0 $R_PARAMS    ;# net1 - net2
placedev $GC_RES R10 46.0 16.0 $R_PARAMS    ;# net2 - Vout
placedev $GC_RES R7  46.0  9.0 $R2_PARAMS   ;# net2 - VSS  (2R shunt)
placedev $GC_RES R1  54.0 16.0 $R2_PARAMS   ;# Vout - net3
placedev $GC_RES R8  54.0  9.0 $R2_PARAMS   ;# net3 - VSS

#==============================================================================
# 3) POWER RAILS  (metal1)
#------------------------------------------------------------------------------
#   VDD / Vref rail across the top, VSS / gnd rail across the bottom.
#==============================================================================
set RAIL_X0 -1.0
set RAIL_X1 60.0

# Vref (VDD) rail  near the PMOS row
box ${RAIL_X0}um 26.0um ${RAIL_X1}um 27.0um
paint m1
label Vref c m1
port make
puts "  painted Vref (VDD) rail"

# VSS (gnd) rail near the NMOS row
box ${RAIL_X0}um 2.0um ${RAIL_X1}um 3.0um
paint m1
label VSS c m1
port make
puts "  painted VSS (gnd) rail"

#==============================================================================
# 4) SIGNAL PORT LABELS
#------------------------------------------------------------------------------
#   Drop labelled met1 landing pads for the gate-control and analog I/O nets.
#   Position them roughly where each net enters the device rows; you will
#   route from these pads to the device gates/terminals interactively.
#==============================================================================
proc pad {name x y} {
    box ${x}um ${y}um [expr {$x+1.0}]um [expr {$y+1.0}]um
    paint m1
    label $name c m1
    port make
    select clear
    puts "  port pad $name at ${x},${y} um"
}

# digital control inputs (gates)
pad b1      0.0  13.0
pad b1_bar  0.0  11.0
pad b0     10.0  13.0
pad b0_bar 10.0  11.0
# analog output
pad Vout   59.0  16.0

#==============================================================================
# 5) FINISH
#==============================================================================
select clear
box 0 0 0 0
save dac_2bit
# Also export GDS so it can be viewed in KLayout (no live graphics needed).
gds write dac_2bit.gds
puts "=== done: cell 'dac_2bit' saved to dac_2bit.mag AND dac_2bit.gds ==="
puts ""
puts "NEXT STEPS:"
puts "  * Route the transmission-gate outputs to the ladder nodes:"
puts "      TG_A & TG_C common  -> net1  -> R9 left"
puts "      TG_B & TG_D common  -> net2  -> R9 right / R10 left / R7 top"
puts "      R10 right / R1 top  -> Vout  -> Vout pad"
puts "      R1-R8 junction      -> net3  (internal)"
puts "  * Tie pfet bulks to Vref rail, nfet bulks to VSS rail (taps)."
puts "  * Connect gate inputs b0/b1/b0_bar/b1_bar from the pads."
puts "  * Then:  drc check ; extract all ; ext2spice lvs ; ext2spice"
puts "    and run netgen LVS vs dac_2bit.spice (see README_dac_2bit.md)."
