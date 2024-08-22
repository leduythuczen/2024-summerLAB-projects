module DFF(in,clk,out);
input [15:0] in;
input clk;
output reg [15:0] out;

initial begin out <=0; end

always @(posedge clk) begin
	out <= in;
end

endmodule
