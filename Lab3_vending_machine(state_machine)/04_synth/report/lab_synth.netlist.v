/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Wed Oct 27 20:47:02 2021
/////////////////////////////////////////////////////////////


module vending_machine ( clk, rst, buy, cancel, in5, in10, out_water, out5, 
        out10, out15 );
  input clk, rst, buy, cancel, in5, in10;
  output out_water, out5, out10, out15;
  wire   N61, N62, N63, N64, N90, N91, N92, N93, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54;
  wire   [3:0] state;

  DFF_X1 \state_reg[0]  ( .D(N61), .CK(clk), .Q(state[0]), .QN(n51) );
  DFF_X1 \state_reg[3]  ( .D(N64), .CK(clk), .Q(state[3]), .QN(n54) );
  DFF_X1 \state_reg[2]  ( .D(N63), .CK(clk), .Q(state[2]), .QN(n52) );
  DFF_X1 \state_reg[1]  ( .D(N62), .CK(clk), .Q(state[1]), .QN(n53) );
  DFF_X1 out5_reg ( .D(N91), .CK(clk), .Q(out5) );
  DFF_X1 out10_reg ( .D(N92), .CK(clk), .Q(out10) );
  DFF_X1 out15_reg ( .D(N93), .CK(clk), .Q(out15) );
  DFF_X1 out_water_reg ( .D(N90), .CK(clk), .Q(out_water) );
  NAND2_X1 U39 ( .A1(state[2]), .A2(n54), .ZN(n29) );
  AOI221_X1 U40 ( .B1(state[0]), .B2(state[1]), .C1(n51), .C2(n53), .A(n29), 
        .ZN(N90) );
  NOR3_X1 U41 ( .A1(state[3]), .A2(n52), .A3(n53), .ZN(N91) );
  NAND2_X1 U42 ( .A1(n52), .A2(n53), .ZN(n41) );
  NOR3_X1 U43 ( .A1(n54), .A2(n51), .A3(n41), .ZN(N93) );
  NOR3_X1 U44 ( .A1(state[0]), .A2(n54), .A3(n41), .ZN(N92) );
  NOR2_X1 U45 ( .A1(cancel), .A2(in5), .ZN(n36) );
  NOR2_X1 U46 ( .A1(state[1]), .A2(state[0]), .ZN(n30) );
  AOI22_X1 U47 ( .A1(state[0]), .A2(n36), .B1(n30), .B2(buy), .ZN(n34) );
  NOR2_X1 U48 ( .A1(rst), .A2(state[3]), .ZN(n44) );
  NAND2_X1 U49 ( .A1(n44), .A2(n52), .ZN(n33) );
  NAND4_X1 U50 ( .A1(n53), .A2(n51), .A3(n44), .A4(state[2]), .ZN(n50) );
  INV_X1 U51 ( .A(n50), .ZN(n37) );
  INV_X1 U52 ( .A(n36), .ZN(n31) );
  NAND2_X1 U53 ( .A1(n37), .A2(n31), .ZN(n32) );
  NAND3_X1 U54 ( .A1(n52), .A2(n44), .A3(state[1]), .ZN(n49) );
  INV_X1 U55 ( .A(n49), .ZN(n38) );
  NAND3_X1 U56 ( .A1(n38), .A2(n51), .A3(n31), .ZN(n39) );
  OAI211_X1 U57 ( .C1(n34), .C2(n33), .A(n32), .B(n39), .ZN(N61) );
  NOR2_X1 U58 ( .A1(cancel), .A2(n51), .ZN(n35) );
  OAI211_X1 U59 ( .C1(in10), .C2(in5), .A(n44), .B(n35), .ZN(n42) );
  INV_X1 U60 ( .A(in10), .ZN(n43) );
  OAI221_X1 U61 ( .B1(in10), .B2(n38), .C1(n43), .C2(n37), .A(n36), .ZN(n40)
         );
  OAI211_X1 U62 ( .C1(n42), .C2(n41), .A(n40), .B(n39), .ZN(N62) );
  INV_X1 U63 ( .A(n42), .ZN(n46) );
  INV_X1 U64 ( .A(cancel), .ZN(n48) );
  AOI221_X1 U65 ( .B1(in5), .B2(n48), .C1(n43), .C2(n48), .A(state[0]), .ZN(
        n45) );
  OAI211_X1 U66 ( .C1(n46), .C2(n45), .A(n44), .B(state[1]), .ZN(n47) );
  OAI22_X1 U67 ( .A1(state[2]), .A2(n47), .B1(cancel), .B2(n50), .ZN(N63) );
  AOI221_X1 U68 ( .B1(n51), .B2(n50), .C1(n49), .C2(n50), .A(n48), .ZN(N64) );
endmodule

