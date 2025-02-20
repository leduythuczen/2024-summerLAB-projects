module testtop;

reg 	clk;
reg 	rst;
reg	buy;
reg	cancel;
reg 	in5, in10;
wire 	out_water;
wire 	out5, out10, out15;

vending_machine vm_inst(
	clk,
	rst,
	buy,
	cancel,
	in5,
	in10,
	out_water,
	out5,
	out10,
	out15);

always begin #5 clk=~clk; end

initial begin
	clk = 0;
	//reset
	buy = 0; in5 = 0; in10 = 0; cancel = 0;
	rst = 0; #10
	rst = 1; #10
	rst = 0; #20
	//mua du 20 xu
	buy = 1; #10;
	buy = 0; in5 = 1; #10
	in5 = 0; in10 = 1; #10
	in10 = 0; in5 = 1; #10
	in5 = 0; #30
	//mua 25 xu
	buy = 1; #10;
	buy = 0; in5 = 1; #10
	in5 = 0; in10 = 1; #10
	in10 = 1; #10
	in10 = 0; #30
	//cancel, tra 10
	buy = 1; #10;
	buy = 0; in10 = 1; #10
	in10 =0; cancel = 1; #10
	cancel = 0; #30
	$finish;	
end

always @(posedge clk) begin
	$display("At %t, state = %d, rst = %b, buy = %b, cancel = %b, in5 = %b, in10 = %b",$time, vm_inst.state, rst, buy, cancel, in5, in10);
	$display ("Water out = %b, out5 = %b, out10 = %b, out15 = %b",out_water, out5, out10, out15);
end

endmodule
