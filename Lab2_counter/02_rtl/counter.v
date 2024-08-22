module counter(clk,out);
input clk;
output [15:0] out;

wire [15:0] cnt_add1;
wire [15:0] cnt;

add_1 add1_inst(cnt,cnt_add1);
DFF ff_inst(cnt_add1,clk,cnt);

assign out = cnt_add1;

endmodule
