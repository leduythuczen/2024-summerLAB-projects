/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Thu Sep 30 03:33:29 2021
/////////////////////////////////////////////////////////////


module counter ( clk, out );
  output [15:0] out;
  input clk;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [15:0] cnt;

  DFFQX0P5MA12TH \ff_inst/out_reg[4]  ( .D(out[4]), .CK(clk), .Q(cnt[4]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[5]  ( .D(out[5]), .CK(clk), .Q(cnt[5]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[6]  ( .D(out[6]), .CK(clk), .Q(cnt[6]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[7]  ( .D(out[7]), .CK(clk), .Q(cnt[7]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[8]  ( .D(out[8]), .CK(clk), .Q(cnt[8]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[9]  ( .D(out[9]), .CK(clk), .Q(cnt[9]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[10]  ( .D(out[10]), .CK(clk), .Q(cnt[10]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[11]  ( .D(out[11]), .CK(clk), .Q(cnt[11]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[12]  ( .D(out[12]), .CK(clk), .Q(cnt[12]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[13]  ( .D(out[13]), .CK(clk), .Q(cnt[13]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[14]  ( .D(out[14]), .CK(clk), .Q(cnt[14]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[15]  ( .D(out[15]), .CK(clk), .Q(cnt[15]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[1]  ( .D(out[1]), .CK(clk), .Q(cnt[1]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[0]  ( .D(out[0]), .CK(clk), .Q(cnt[0]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[3]  ( .D(out[3]), .CK(clk), .Q(cnt[3]) );
  DFFQX0P5MA12TH \ff_inst/out_reg[2]  ( .D(out[2]), .CK(clk), .Q(cnt[2]) );
  INVX0P5BA12TH U1 ( .A(cnt[0]), .Y(out[0]) );
  INVX0P5BA12TH U2 ( .A(cnt[1]), .Y(n1) );
  NOR2X0P5MA12TH U3 ( .A(out[0]), .B(n1), .Y(n20) );
  AOI21X0P5MA12TH U4 ( .A0(out[0]), .A1(n1), .B0(n20), .Y(out[1]) );
  NAND3X0P5AA12TH U5 ( .A(cnt[0]), .B(cnt[1]), .C(cnt[2]), .Y(n19) );
  INVX0P5BA12TH U6 ( .A(cnt[3]), .Y(n2) );
  NOR2X0P5MA12TH U7 ( .A(n19), .B(n2), .Y(n18) );
  AOI21X0P5MA12TH U8 ( .A0(n19), .A1(n2), .B0(n18), .Y(out[3]) );
  NAND2X0P5BA12TH U9 ( .A(n18), .B(cnt[4]), .Y(n17) );
  INVX0P5BA12TH U10 ( .A(cnt[5]), .Y(n3) );
  NOR2X0P5MA12TH U11 ( .A(n17), .B(n3), .Y(n16) );
  AOI21X0P5MA12TH U12 ( .A0(n17), .A1(n3), .B0(n16), .Y(out[5]) );
  NAND2X0P5BA12TH U13 ( .A(n16), .B(cnt[6]), .Y(n15) );
  INVX0P5BA12TH U14 ( .A(cnt[7]), .Y(n4) );
  NOR2X0P5MA12TH U15 ( .A(n15), .B(n4), .Y(n14) );
  AOI21X0P5MA12TH U16 ( .A0(n15), .A1(n4), .B0(n14), .Y(out[7]) );
  NAND2X0P5BA12TH U17 ( .A(n14), .B(cnt[8]), .Y(n13) );
  INVX0P5BA12TH U18 ( .A(cnt[9]), .Y(n5) );
  NOR2X0P5MA12TH U19 ( .A(n13), .B(n5), .Y(n12) );
  AOI21X0P5MA12TH U20 ( .A0(n13), .A1(n5), .B0(n12), .Y(out[9]) );
  NAND2X0P5BA12TH U21 ( .A(n12), .B(cnt[10]), .Y(n11) );
  INVX0P5BA12TH U22 ( .A(cnt[11]), .Y(n6) );
  NOR2X0P5MA12TH U23 ( .A(n11), .B(n6), .Y(n10) );
  AOI21X0P5MA12TH U24 ( .A0(n11), .A1(n6), .B0(n10), .Y(out[11]) );
  NAND2X0P5BA12TH U25 ( .A(n10), .B(cnt[12]), .Y(n9) );
  INVX0P5BA12TH U26 ( .A(cnt[13]), .Y(n7) );
  NOR2X0P5MA12TH U27 ( .A(n9), .B(n7), .Y(n8) );
  AOI21X0P5MA12TH U28 ( .A0(n9), .A1(n7), .B0(n8), .Y(out[13]) );
  NAND2X0P5BA12TH U29 ( .A(n8), .B(cnt[14]), .Y(n21) );
  OA21X0P5MA12TH U30 ( .A0(n8), .A1(cnt[14]), .B0(n21), .Y(out[14]) );
  OA21X0P5MA12TH U31 ( .A0(n10), .A1(cnt[12]), .B0(n9), .Y(out[12]) );
  OA21X0P5MA12TH U32 ( .A0(n12), .A1(cnt[10]), .B0(n11), .Y(out[10]) );
  OA21X0P5MA12TH U33 ( .A0(n14), .A1(cnt[8]), .B0(n13), .Y(out[8]) );
  OA21X0P5MA12TH U34 ( .A0(n16), .A1(cnt[6]), .B0(n15), .Y(out[6]) );
  OA21X0P5MA12TH U35 ( .A0(n18), .A1(cnt[4]), .B0(n17), .Y(out[4]) );
  OA21X0P5MA12TH U36 ( .A0(n20), .A1(cnt[2]), .B0(n19), .Y(out[2]) );
  XNOR2X0P5MA12TH U37 ( .A(cnt[15]), .B(n21), .Y(out[15]) );
endmodule

