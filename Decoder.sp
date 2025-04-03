*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.unprotect 

*****************************
**   Circuit Description   **
*****************************
.subckt INV in out
    Mp1 out in VDD x pmos_sram m=2
    Mn2 out in GND x nmos_sram m=2
.ends

.subckt BUFFER in out
    X1 in N1  INV
    X2 N1 out INV
.ends

.subckt NAND in1 in2 out
    Mp1 out in1 VDD x pmos_sram m=2
    Mp2 out in2 VDD x pmos_sram m=2

    Mn1 out in1 N1  x nmos_sram m=2
    Mn2 N1  in2 GND x nmos_sram m=2
.ends

.subckt NOR_4in in0 in1 in2 in3 out
    Mp1 N1  in0 VDD x pmos_sram m=2
    Mp2 N2  in1 N1  x pmos_sram m=2
    Mp3 N3  in2 N2  x pmos_sram m=2
    Mp4 out in3 N3  x pmos_sram m=2

    Mn1 out in0 GND x nmos_sram m=2
    Mn2 out in1 GND x nmos_sram m=2
    Mn3 out in2 GND x nmos_sram m=2
    Mn4 out in3 GND x nmos_sram m=2
.ends

.subckt DEC_24 in0 in1 out0 out1 out2 out3
    XINV0 in0 in0_b INV
    XINV1 in1 in1_b INV
    XNAND3 in0   in1   out3 NAND
    XNAND2 in0   in1_b out2 NAND
    XNAND1 in0_b in1   out1 NAND
    XNAND0 in0_b in1_b out0 NAND
.ends

.subckt DEC_664 in0 in1 in2 in3 in4 in5 clk
+ WL[0] WL[1] WL[2] WL[3] WL[4] WL[5] WL[6] WL[7]
+ WL[8] WL[9] WL[10] WL[11] WL[12] WL[13] WL[14] WL[15]
+ WL[16] WL[17] WL[18] WL[19] WL[20] WL[21] WL[22] WL[23]
+ WL[24] WL[25] WL[26] WL[27] WL[28] WL[29] WL[30] WL[31]
+ WL[32] WL[33] WL[34] WL[35] WL[36] WL[37] WL[38] WL[39]
+ WL[40] WL[41] WL[42] WL[43] WL[44] WL[45] WL[46] WL[47]
+ WL[48] WL[49] WL[50] WL[51] WL[52] WL[53] WL[54] WL[55]
+ WL[56] WL[57] WL[58] WL[59] WL[60] WL[61] WL[62] WL[63]

    XDEC24_2 in5 in4 ctrl_20 ctrl_21 ctrl_22 ctrl_23 DEC_24
    XDEC24_1 in3 in2 ctrl_10 ctrl_11 ctrl_12 ctrl_13 DEC_24
    XDEC24_0 in1 in0 ctrl_00 ctrl_01 ctrl_02 ctrl_03 DEC_24
    XINV0 clk clk_b INV 
    
    XNOR0 ctrl_20 ctrl_10 ctrl_00 clk_b WL[0] NOR_4in
    XNOR1 ctrl_20 ctrl_10 ctrl_01 clk_b WL[1] NOR_4in
    XNOR2 ctrl_20 ctrl_10 ctrl_02 clk_b WL[2] NOR_4in
    XNOR3 ctrl_20 ctrl_10 ctrl_03 clk_b WL[3] NOR_4in
    XNOR4 ctrl_20 ctrl_11 ctrl_00 clk_b WL[4] NOR_4in
    XNOR5 ctrl_20 ctrl_11 ctrl_01 clk_b WL[5] NOR_4in
    XNOR6 ctrl_20 ctrl_11 ctrl_02 clk_b WL[6] NOR_4in
    XNOR7 ctrl_20 ctrl_11 ctrl_03 clk_b WL[7] NOR_4in
    XNOR8 ctrl_20 ctrl_12 ctrl_00 clk_b WL[8] NOR_4in
    XNOR9 ctrl_20 ctrl_12 ctrl_01 clk_b WL[9] NOR_4in
    XNOR10 ctrl_20 ctrl_12 ctrl_02 clk_b WL[10] NOR_4in
    XNOR11 ctrl_20 ctrl_12 ctrl_03 clk_b WL[11] NOR_4in
    XNOR12 ctrl_20 ctrl_13 ctrl_00 clk_b WL[12] NOR_4in
    XNOR13 ctrl_20 ctrl_13 ctrl_01 clk_b WL[13] NOR_4in
    XNOR14 ctrl_20 ctrl_13 ctrl_02 clk_b WL[14] NOR_4in
    XNOR15 ctrl_20 ctrl_13 ctrl_03 clk_b WL[15] NOR_4in
    XNOR16 ctrl_21 ctrl_10 ctrl_00 clk_b WL[16] NOR_4in
    XNOR17 ctrl_21 ctrl_10 ctrl_01 clk_b WL[17] NOR_4in
    XNOR18 ctrl_21 ctrl_10 ctrl_02 clk_b WL[18] NOR_4in
    XNOR19 ctrl_21 ctrl_10 ctrl_03 clk_b WL[19] NOR_4in
    XNOR20 ctrl_21 ctrl_11 ctrl_00 clk_b WL[20] NOR_4in
    XNOR21 ctrl_21 ctrl_11 ctrl_01 clk_b WL[21] NOR_4in
    XNOR22 ctrl_21 ctrl_11 ctrl_02 clk_b WL[22] NOR_4in
    XNOR23 ctrl_21 ctrl_11 ctrl_03 clk_b WL[23] NOR_4in
    XNOR24 ctrl_21 ctrl_12 ctrl_00 clk_b WL[24] NOR_4in
    XNOR25 ctrl_21 ctrl_12 ctrl_01 clk_b WL[25] NOR_4in
    XNOR26 ctrl_21 ctrl_12 ctrl_02 clk_b WL[26] NOR_4in
    XNOR27 ctrl_21 ctrl_12 ctrl_03 clk_b WL[27] NOR_4in
    XNOR28 ctrl_21 ctrl_13 ctrl_00 clk_b WL[28] NOR_4in
    XNOR29 ctrl_21 ctrl_13 ctrl_01 clk_b WL[29] NOR_4in
    XNOR30 ctrl_21 ctrl_13 ctrl_02 clk_b WL[30] NOR_4in
    XNOR31 ctrl_21 ctrl_13 ctrl_03 clk_b WL[31] NOR_4in
    XNOR32 ctrl_22 ctrl_10 ctrl_00 clk_b WL[32] NOR_4in
    XNOR33 ctrl_22 ctrl_10 ctrl_01 clk_b WL[33] NOR_4in
    XNOR34 ctrl_22 ctrl_10 ctrl_02 clk_b WL[34] NOR_4in
    XNOR35 ctrl_22 ctrl_10 ctrl_03 clk_b WL[35] NOR_4in
    XNOR36 ctrl_22 ctrl_11 ctrl_00 clk_b WL[36] NOR_4in
    XNOR37 ctrl_22 ctrl_11 ctrl_01 clk_b WL[37] NOR_4in
    XNOR38 ctrl_22 ctrl_11 ctrl_02 clk_b WL[38] NOR_4in
    XNOR39 ctrl_22 ctrl_11 ctrl_03 clk_b WL[39] NOR_4in
    XNOR40 ctrl_22 ctrl_12 ctrl_00 clk_b WL[40] NOR_4in
    XNOR41 ctrl_22 ctrl_12 ctrl_01 clk_b WL[41] NOR_4in
    XNOR42 ctrl_22 ctrl_12 ctrl_02 clk_b WL[42] NOR_4in
    XNOR43 ctrl_22 ctrl_12 ctrl_03 clk_b WL[43] NOR_4in
    XNOR44 ctrl_22 ctrl_13 ctrl_00 clk_b WL[44] NOR_4in
    XNOR45 ctrl_22 ctrl_13 ctrl_01 clk_b WL[45] NOR_4in
    XNOR46 ctrl_22 ctrl_13 ctrl_02 clk_b WL[46] NOR_4in
    XNOR47 ctrl_22 ctrl_13 ctrl_03 clk_b WL[47] NOR_4in
    XNOR48 ctrl_23 ctrl_10 ctrl_00 clk_b WL[48] NOR_4in
    XNOR49 ctrl_23 ctrl_10 ctrl_01 clk_b WL[49] NOR_4in
    XNOR50 ctrl_23 ctrl_10 ctrl_02 clk_b WL[50] NOR_4in
    XNOR51 ctrl_23 ctrl_10 ctrl_03 clk_b WL[51] NOR_4in
    XNOR52 ctrl_23 ctrl_11 ctrl_00 clk_b WL[52] NOR_4in
    XNOR53 ctrl_23 ctrl_11 ctrl_01 clk_b WL[53] NOR_4in
    XNOR54 ctrl_23 ctrl_11 ctrl_02 clk_b WL[54] NOR_4in
    XNOR55 ctrl_23 ctrl_11 ctrl_03 clk_b WL[55] NOR_4in
    XNOR56 ctrl_23 ctrl_12 ctrl_00 clk_b WL[56] NOR_4in
    XNOR57 ctrl_23 ctrl_12 ctrl_01 clk_b WL[57] NOR_4in
    XNOR58 ctrl_23 ctrl_12 ctrl_02 clk_b WL[58] NOR_4in
    XNOR59 ctrl_23 ctrl_12 ctrl_03 clk_b WL[59] NOR_4in
    XNOR60 ctrl_23 ctrl_13 ctrl_00 clk_b WL[60] NOR_4in
    XNOR61 ctrl_23 ctrl_13 ctrl_01 clk_b WL[61] NOR_4in
    XNOR62 ctrl_23 ctrl_13 ctrl_02 clk_b WL[62] NOR_4in
    XNOR63 ctrl_23 ctrl_13 ctrl_03 clk_b WL[63] NOR_4in
    
.ends

Xmain a0 a1 a2 a3 a4 a5 clk 
+ WL[0] WL[1] WL[2] WL[3] WL[4] WL[5] WL[6] WL[7]
+ WL[8] WL[9] WL[10] WL[11] WL[12] WL[13] WL[14] WL[15]
+ WL[16] WL[17] WL[18] WL[19] WL[20] WL[21] WL[22] WL[23]
+ WL[24] WL[25] WL[26] WL[27] WL[28] WL[29] WL[30] WL[31]
+ WL[32] WL[33] WL[34] WL[35] WL[36] WL[37] WL[38] WL[39]
+ WL[40] WL[41] WL[42] WL[43] WL[44] WL[45] WL[46] WL[47]
+ WL[48] WL[49] WL[50] WL[51] WL[52] WL[53] WL[54] WL[55]
+ WL[56] WL[57] WL[58] WL[59] WL[60] WL[61] WL[62] WL[63] DEC_664

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
.param supply = 0.7V
VVDD VDD GND supply
//clock for 1GHz wuth 50% duty cycle and 0.05ns rise and fall time
Vclk preclk GND PULSE(0 supply 0.45n 0.05n 0.05n 0.45n 1n)
//6bits address input signals
Vaddr0 A[0] GND PULSE(0 supply 0.95n 0.05n 0.05n 0.95n 2n)
Vaddr1 A[1] GND PULSE(0 supply 1.95n 0.05n 0.05n 1.95n 4n)
Vaddr2 A[2] GND PULSE(0 supply 3.95n 0.05n 0.05n 3.95n 8n)
Vaddr3 A[3] GND PULSE(0 supply 7.95n 0.05n 0.05n 7.95n 16n)
Vaddr4 A[4] GND PULSE(0 supply 15.95n 0.05n 0.05n 15.95n 32n)
Vaddr5 A[5] GND PULSE(0 supply 31.95n 0.05n 0.05n 31.95n 64n)

Xclk preclk clk BUFFER 
XB1 A[0] a0 BUFFER
XB2 A[1] a1 BUFFER
XB3 A[2] a2 BUFFER
XB4 A[3] a3 BUFFER
XB5 A[4] a4 BUFFER
XB6 A[5] a5 BUFFER

//load
.param load = 10f

*****************************
**    Simulator setting    **
*****************************
.tran 0.1n 64n
.option post 
.options probe
.op
.probe v(*)

.TEMP 25

*****************************
**      Measurement        **
*****************************
.meas tran avg_power avg power from=0.1ns to=64ns
*.meas tran delay trig v(a[0]) val='supply/2' targ v(WL[1]) val='supply/2' 

.end
