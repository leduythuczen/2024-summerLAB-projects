module vending_machine(
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
input 	clk;
input 	rst;
input	buy;
input	cancel;
input 	in5, in10;
output reg 	out_water;
output reg 	out5, out10, out15;

reg [3:0] state, next_state;

always @(state or buy or cancel or in5 or in10) begin
	next_state = 4'd0;
	case (state)
		4'd0: begin //start
		if (buy) next_state = 4'd1;
		else if (in5) next_state = 4'd7;
		else if (in10) next_state = 4'd8;
		else next_state = 4'd0;
		end
		4'd1: begin //bat dau nhan xu
		if (cancel) next_state = 4'd0;
		else if (in5) next_state = 4'd2;
		else if (in10) next_state = 4'd3;
		else next_state = 4'd1;
		end
		4'd2: begin //da nhan 5
		if (cancel) next_state = 4'd7;
		else if (in5) next_state = 4'd3;
		else if (in10) next_state = 4'd4;
		else next_state = 4'd2;
		end
		4'd3: begin //da nhan 10
		if (cancel) next_state = 4'd8;
		else if (in5) next_state = 4'd4;
		else if (in10) next_state = 4'd5;
		else next_state = 4'd3;
		end
		4'd4: begin //da nhan 15
		if (cancel) next_state = 4'd9;
		else if (in5) next_state = 4'd5;
		else if (in10) next_state = 4'd6;
		else next_state = 4'd4;
		end
		default: begin
		next_state = 4'd0;
		end
	endcase
end

always @(posedge clk) begin
	if (rst)
		state <= 4'd0;
	else
		state <= next_state;
	case (state)
		4'd5: begin //nhan 20, tra nuoc
		out_water = 1;
		out5 = 0;
		out10 = 0;
		out15 = 0;
		end
		4'd6: begin //nhan 25, tra nuoc va 5 xu
		out_water = 1;
		out5 = 1;
		out10 = 0;
		out15 = 0;
		end
		4'd7: begin //cancel, tra 5 xu
		out_water = 0;
		out5 = 1;
		out10 = 0;
		out15 = 0;
		end
		4'd8: begin //cancel, tra 10 xu
		out_water = 0;
		out5 = 0;
		out10 = 1;
		out15 = 0;
		end
		4'd9: begin //cancel, tra 15 xu
		out_water = 0;
		out5 = 0;
		out10 = 0;
		out15 = 1;
		end
		default: begin
		out_water = 0;
		out5 = 0;
		out10 = 0;
		out15 = 0;
		end
	endcase
end

endmodule
