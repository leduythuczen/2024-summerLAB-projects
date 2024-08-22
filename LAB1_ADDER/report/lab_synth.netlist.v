/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Thu Sep 23 07:03:09 2021
/////////////////////////////////////////////////////////////


module adder_4bit ( X, Y, S, Cout );
  input [3:0] X;
  input [3:0] Y;
  output [3:0] S;
  output Cout;
  wire   \A0/N0 , n5, n6, n7, n8;
  assign S[0] = \A0/N0 ;

  NOR2X0P5MA12TH U8 ( .A(Y[0]), .B(X[0]), .Y(n5) );
  AND2X1MA12TH U9 ( .A(Y[0]), .B(X[0]), .Y(n8) );
  NOR2X0P5MA12TH U10 ( .A(n5), .B(n8), .Y(\A0/N0 ) );
  ADDFX1MA12TH U11 ( .A(X[3]), .B(Y[3]), .CI(n6), .CO(Cout), .S(S[3]) );
  ADDFX1MA12TH U12 ( .A(X[2]), .B(Y[2]), .CI(n7), .CO(n6), .S(S[2]) );
  ADDFX1MA12TH U13 ( .A(Y[1]), .B(X[1]), .CI(n8), .CO(n7), .S(S[1]) );
endmodule

