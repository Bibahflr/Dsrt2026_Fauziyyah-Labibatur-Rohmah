loading history file ... 13 events added
Use openwrapper to create a new GUI-based layout window
Use closewrapper to remove a new GUI-based layout window

Magic 8.3 revision 639 - Compiled on Fri May  8 08:11:12 WIB 2026.
Starting magic under Tcl interpreter
Using Tk console window
WARNING: RLIMIT_NOFILE is above 1024 and Tcl_Version<9 this may cause runtime issues [rlim_cur=10240]
Could not find file 'sky130A.tech' in any of these directories:
         . $CAD_ROOT/magic/sys $CAD_ROOT/magic/sys/current
Failed to load technology "sky130A"
Processing system .magicrc file
Switching to WIRING tool.
Switching to NETLIST tool.
Switching to PICK tool.
Switching to BOX tool.
Sourcing design .magicrc for technology sky130A ...
2 Magic internal units = 1 Lambda
Input style sky130(): scaleFactor=2, multiplier=2
The following types are not handled by extraction and will be treated as non-electrical types:
    ubm 
Scaled tech values by 2 / 1 to match internal grid scaling
Loading sky130A Device Generator Menu ...
New windows will not have a title caption.
New windows will not have scroll bars.
New windows will not have a border.
Using technology "sky130A", version 1.0.583-0-g1e931c9
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   0.010 x 0.010   ( 0.000,  0.000), ( 0.010,  0.010)  0.000     
lambda:     1.00 x 1.00    (  0.00,  0.00 ), (  1.00,  1.00 )  1.00      
internal:      2 x 2       (     0,  0    ), (     2,  2    )  4         
Main console display active (Tcl8.6.14 / Tk8.6.14)
% box -2um 0um 62um 30um
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:  64.000 x 30.000  (-2.000,  0.000), ( 62.000,  30.000)  1920.000  
lambda:   6400.00 x 3000.00  (-200.00,  0.00 ), ( 6200.00,  3000.00)  19200000.00
internal:  12800 x 6000    (  -400,  0    ), ( 12400,  6000 )  76800000  
% findbox zoom
% plot svg dac_2bit.svg
% gds write dac_2bit.gds
Error:  Cell has the default name "(UNNAMED)"!
   Generating output for cell (UNNAMED)
% gds write dac_2bit.gds
Error:  Cell has the default name "(UNNAMED)"!
   Generating output for cell (UNNAMED)
% source gen_dac_2bit.tcl

=== gen_dac_2bit.tcl : building 2-bit R-2R DAC core ===
Cell dac_2bit read from current working directory
You selected one or more subcells that aren't children
    of the edit cell.  Only those in the edit cell were
    deleted.
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )

microns:   0.000 x 0.000   ( 0.000,  0.000), ( 0.000,  0.000)
lambda:     0.00 x 0.00    (  0.00,  0.00 ), (  0.00,  0.00 )
internal:      0 x 0       (     0,  0    ), (     0,  0    )
Warning:  snap setting is also changing units.  This usage is deprecated
and may be removed in the future.  Use "units" to change units, and
change units before setting snap to keep this message from appearing.
Cell sky130_fd_pr__pfet_01v8_7HN6Y2 read from current working directory
WARNING: gencell 'sky130::sky130_fd_pr__pfet_01v8' for M2 failed: invalid command name ".params.title.ient"
Cell sky130_fd_pr__nfet_01v8_34VMYE read from current working directory
Loading DRC CIF style.
Cell sky130_fd_pr__res_high_po_0p35_S5RWJ9 read from current working directory
Cell sky130_fd_pr__res_high_po_0p35_N4AVSQ read from current working directory         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__nfet_01v8' for M1 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__pfet_01v8' for M4 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__nfet_01v8' for M3 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__pfet_01v8' for M5 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__nfet_01v8' for M6 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__pfet_01v8' for M7 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__nfet_01v8' for M8 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__res_high_po_0p35' for R9 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__res_high_po_0p35' for R10 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__res_high_po_0p35' for R7 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__res_high_po_0p35' for R1 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
WARNING: gencell 'sky130::sky130_fd_pr__res_high_po_0p35' for R8 failed: invalid command name ".params.title.ient"
         -> check the GC_* names in the CONFIG block.
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:  61.000 x 1.000   (-1.000,  26.000), ( 60.000,  27.000)  61.000    
lambda:   6100.00 x 100.00  (-100.00,  2600.00), ( 6000.00,  2700.00)  610000.00 
internal:  12200 x 200     (  -200,  5200 ), ( 12000,  5400 )  2440000   
  painted Vref (VDD) raiRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:  61.000 x 1.000   (-1.000,  2.000), ( 60.000,  3.000)  61.000    
lambda:   6100.00 x 100.00  (-100.00,  200.00), ( 6000.00,  300.00)  610000.00 
internal:  12200 x 200     (  -200,  400  ), ( 12000,  600  )  2440000   
  painted VSS (gnd) raiRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 0.000,  13.000), ( 1.000,  14.000)  1.000     
lambda:   100.00 x 100.00  (  0.00,  1300.00), ( 100.00,  1400.00)  10000.00  
internal:    200 x 200     (     0,  2600 ), (   200,  2800 )  40000     
  port pad b1 at 0.0,13.0 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 0.000,  11.000), ( 1.000,  12.000)  1.000     
lambda:   100.00 x 100.00  (  0.00,  1100.00), ( 100.00,  1200.00)  10000.00  
internal:    200 x 200     (     0,  2200 ), (   200,  2400 )  40000     
  port pad b1_bar at 0.0,11.0 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 10.000,  13.000), ( 11.000,  14.000)  1.000     
lambda:   100.00 x 100.00  ( 1000.00,  1300.00), ( 1100.00,  1400.00)  10000.00  
internal:    200 x 200     (  2000,  2600 ), (  2200,  2800 )  40000     
  port pad b0 at 10.0,13.0 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 10.000,  11.000), ( 11.000,  12.000)  1.000     
lambda:   100.00 x 100.00  ( 1000.00,  1100.00), ( 1100.00,  1200.00)  10000.00  
internal:    200 x 200     (  2000,  2200 ), (  2200,  2400 )  40000     
  port pad b0_bar at 10.0,11.0 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 59.000,  16.000), ( 60.000,  17.000)  1.000     
lambda:   100.00 x 100.00  ( 5900.00,  1600.00), ( 6000.00,  1700.00)  10000.00  
internal:    200 x 200     ( 11800,  3200 ), ( 12000,  3400 )  40000     
  port pad Vout at 59.0,16.0 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )

microns:   0.000 x 0.000   ( 0.000,  0.000), ( 0.000,  0.000)
lambda:     0.00 x 0.00    (  0.00,  0.00 ), (  0.00,  0.00 )
internal:      0 x 0       (     0,  0    ), (     0,  0    )
   Generating output for cell sky130_fd_pr__nfet_01v8_34VMYE
   Generating output for cell sky130_fd_pr__pfet_01v8_7HN6Y2
   Generating output for cell sky130_fd_pr__res_high_po_0p35_S5RWJ9
   Generating output for cell sky130_fd_pr__res_high_po_0p35_N4AVSQ
   Generating output for cell dac_2bit
10 problems occurred.  See feedback entries.
=== done: cell 'dac_2bit' saved to dac_2bit.mag AND dac_2bit.gds ===

NEXT STEPS:
  * Route the transmission-gate outputs to the ladder nodes:
      TG_A & TG_C common  -> net1  -> R9 left
      TG_B & TG_D common  -> net2  -> R9 right / R10 left / R7 top
      R10 right / R1 top  -> Vout  -> Vout pad
      R1-R8 junction      -> net3  (internal)
  * Tie pfet bulks to Vref rail, nfet bulks to VSS rail (taps).
  * Connect gate inputs b0/b1/b0_bar/b1_bar from the pads.
  * Then:  drc check ; extract all ; ext2spice lvs ; ext2spice
    and run netgen LVS vs dac_2bit.spice (see README_dac_2bit.md).
m
m
m
m
m
l
l

% source place_dac_2bit.tcl

=== place_dac_2bit.tcl : assembling DAC core from existing device cells ===
You selected one or more subcells that aren't children
    of the edit cell.  Only those in the edit cell were
    deleted.
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )

microns:   0.000 x 0.000   ( 0.000,  0.000), ( 0.000,  0.000)
lambda:     0.00 x 0.00    (  0.00,  0.00 ), (  0.00,  0.00 )
internal:      0 x 0       (     0,  0    ), (     0,  0    )
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 2.000,  20.000), ( 3.000,  21.000)  1.000     
lambda:   100.00 x 100.00  ( 200.00,  2000.00), ( 300.00,  2100.00)  10000.00  
internal:    200 x 200     (   400,  4000 ), (   600,  4200 )  40000     
  placed sky130_fd_pr__pfet_01v8_7HN6Y2 at 2,20 umRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 2.000,  6.000), ( 3.000,  7.000)  1.000     
lambda:   100.00 x 100.00  ( 200.00,  600.00), ( 300.00,  700.00)  10000.00  
internal:    200 x 200     (   400,  1200 ), (   600,  1400 )  40000     
  placed sky130_fd_pr__nfet_01v8_34VMYE at 2,6 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 12.000,  20.000), ( 13.000,  21.000)  1.000     
lambda:   100.00 x 100.00  ( 1200.00,  2000.00), ( 1300.00,  2100.00)  10000.00  
internal:    200 x 200     (  2400,  4000 ), (  2600,  4200 )  40000     
  placed sky130_fd_pr__pfet_01v8_7HN6Y2 at 12,20 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 12.000,  6.000), ( 13.000,  7.000)  1.000     
lambda:   100.00 x 100.00  ( 1200.00,  600.00), ( 1300.00,  700.00)  10000.00  
internal:    200 x 200     (  2400,  1200 ), (  2600,  1400 )  40000     
  placed sky130_fd_pr__nfet_01v8_34VMYE at 12,6 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 22.000,  20.000), ( 23.000,  21.000)  1.000     
lambda:   100.00 x 100.00  ( 2200.00,  2000.00), ( 2300.00,  2100.00)  10000.00  
internal:    200 x 200     (  4400,  4000 ), (  4600,  4200 )  40000     
  placed sky130_fd_pr__pfet_01v8_7HN6Y2 at 22,20 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 22.000,  6.000), ( 23.000,  7.000)  1.000     
lambda:   100.00 x 100.00  ( 2200.00,  600.00), ( 2300.00,  700.00)  10000.00  
internal:    200 x 200     (  4400,  1200 ), (  4600,  1400 )  40000     
  placed sky130_fd_pr__nfet_01v8_34VMYE at 22,6 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 32.000,  20.000), ( 33.000,  21.000)  1.000     
lambda:   100.00 x 100.00  ( 3200.00,  2000.00), ( 3300.00,  2100.00)  10000.00  
internal:    200 x 200     (  6400,  4000 ), (  6600,  4200 )  40000     
  placed sky130_fd_pr__pfet_01v8_7HN6Y2 at 32,20 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 32.000,  6.000), ( 33.000,  7.000)  1.000     
lambda:   100.00 x 100.00  ( 3200.00,  600.00), ( 3300.00,  700.00)  10000.00  
internal:    200 x 200     (  6400,  1200 ), (  6600,  1400 )  40000     
  placed sky130_fd_pr__nfet_01v8_34VMYE at 32,6 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 46.000,  22.000), ( 47.000,  23.000)  1.000     
lambda:   100.00 x 100.00  ( 4600.00,  2200.00), ( 4700.00,  2300.00)  10000.00  
internal:    200 x 200     (  9200,  4400 ), (  9400,  4600 )  40000     
  placed sky130_fd_pr__res_high_po_0p35_S5RWJ9 at 46,22 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 46.000,  16.000), ( 47.000,  17.000)  1.000     
lambda:   100.00 x 100.00  ( 4600.00,  1600.00), ( 4700.00,  1700.00)  10000.00  
internal:    200 x 200     (  9200,  3200 ), (  9400,  3400 )  40000     
  placed sky130_fd_pr__res_high_po_0p35_S5RWJ9 at 46,16 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 46.000,  9.000), ( 47.000,  10.000)  1.000     
lambda:   100.00 x 100.00  ( 4600.00,  900.00), ( 4700.00,  1000.00)  10000.00  
internal:    200 x 200     (  9200,  1800 ), (  9400,  2000 )  40000     
  placed sky130_fd_pr__res_high_po_0p35_N4AVSQ at 46,9 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 54.000,  16.000), ( 55.000,  17.000)  1.000     
lambda:   100.00 x 100.00  ( 5400.00,  1600.00), ( 5500.00,  1700.00)  10000.00  
internal:    200 x 200     ( 10800,  3200 ), ( 11000,  3400 )  40000     
  placed sky130_fd_pr__res_high_po_0p35_N4AVSQ at 54,16 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 54.000,  9.000), ( 55.000,  10.000)  1.000     
lambda:   100.00 x 100.00  ( 5400.00,  900.00), ( 5500.00,  1000.00)  10000.00  
internal:    200 x 200     ( 10800,  1800 ), ( 11000,  2000 )  40000     
  placed sky130_fd_pr__res_high_po_0p35_N4AVSQ at 54,9 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:  61.000 x 1.000   (-1.000,  26.000), ( 60.000,  27.000)  61.000    
lambda:   6100.00 x 100.00  (-100.00,  2600.00), ( 6000.00,  2700.00)  610000.00 
internal:  12200 x 200     (  -200,  5200 ), ( 12000,  5400 )  2440000   
  painted Vref (VDD) raiRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:  61.000 x 1.000   (-1.000,  2.000), ( 60.000,  3.000)  61.000    
lambda:   6100.00 x 100.00  (-100.00,  200.00), ( 6000.00,  300.00)  610000.00 
internal:  12200 x 200     (  -200,  400  ), ( 12000,  600  )  2440000   
  painted VSS (gnd) raiRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 0.000,  13.000), ( 1.000,  14.000)  1.000     
lambda:   100.00 x 100.00  (  0.00,  1300.00), ( 100.00,  1400.00)  10000.00  
internal:    200 x 200     (     0,  2600 ), (   200,  2800 )  40000     
  port pad b1 at 0,13 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 0.000,  11.000), ( 1.000,  12.000)  1.000     
lambda:   100.00 x 100.00  (  0.00,  1100.00), ( 100.00,  1200.00)  10000.00  
internal:    200 x 200     (     0,  2200 ), (   200,  2400 )  40000     
  port pad b1_bar at 0,11 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 10.000,  13.000), ( 11.000,  14.000)  1.000     
lambda:   100.00 x 100.00  ( 1000.00,  1300.00), ( 1100.00,  1400.00)  10000.00  
internal:    200 x 200     (  2000,  2600 ), (  2200,  2800 )  40000     
  port pad b0 at 10,13 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 10.000,  11.000), ( 11.000,  12.000)  1.000     
lambda:   100.00 x 100.00  ( 1000.00,  1100.00), ( 1100.00,  1200.00)  10000.00  
internal:    200 x 200     (  2000,  2200 ), (  2200,  2400 )  40000     
  port pad b0_bar at 10,11 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 1.000   ( 59.000,  16.000), ( 60.000,  17.000)  1.000     
lambda:   100.00 x 100.00  ( 5900.00,  1600.00), ( 6000.00,  1700.00)  10000.00  
internal:    200 x 200     ( 11800,  3200 ), ( 12000,  3400 )  40000     
  port pad Vout at 59,16 uRoot cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )

microns:   0.000 x 0.000   ( 0.000,  0.000), ( 0.000,  0.000)
lambda:     0.00 x 0.00    (  0.00,  0.00 ), (  0.00,  0.00 )
internal:      0 x 0       (     0,  0    ), (     0,  0    )
   Generating output for cell sky130_fd_pr__nfet_01v8_34VMYE
   Generating output for cell sky130_fd_pr__pfet_01v8_7HN6Y2
   Generating output for cell sky130_fd_pr__res_high_po_0p35_N4AVSQ
   Generating output for cell sky130_fd_pr__res_high_po_0p35_S5RWJ9
   Generating output for cell dac_2bit
137 problems occurred.  See feedback entries.
=== done: dac_2bit saved to dac_2bit.mag AND dac_2bit.gds ===
Now open dac_2bit.gds in KLayout (press F2 to zoom-fit).
m
m
m
m
m
l
l
m
m
m
m
m
m
m
m
m
m
m
m

% 