module Waste_Processor (
    input wire clk,
    input wire rst,
input wire endi,
    input [7:0] in_waste,
    output wire [3:0] label,
    output wire [7:0] weight,
   output wire q 	
);

assign label = endi ? in_waste[7:4] : 4'b0000;
assign weight = endi ? {4'b0000, in_waste[3:0]} : 8'b00000000;
assign q=endi;


endmodule

