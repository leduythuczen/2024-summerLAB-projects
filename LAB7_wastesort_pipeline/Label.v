module Label (
    input wire clk,
    input wire rst,
    input wire endi,
    input [3:0] label,
    input [7:0] weight,
    output reg [3:0] address,
    output reg [7:0] out1,
output reg q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        address <= 4'd0;
        out1 <= 8'd0;
    end else if (endi) begin
        case (label)
            4'b0000: address <= 4'd0;  // plastic
            4'b0001: address <= 4'd1;  // glass
            4'b0010: address <= 4'd2;  // paper
            4'b0011: address <= 4'd3;  // metal
            4'b0100: address <= 4'd4;  // textile
            4'b0110,
            4'b0111: address <= 4'd5;  // compost
            4'b1000,
            4'b1001,
            4'b1111,
            4'b1100: address <= 4'd6;  // landfill
            default: address <= 4'd7;  // enr
        endcase
        out1 <= weight;
	q<=endi;
    end else begin
        address <= address; // giữ nguyên giá trị
        out1 <= out1;       // giữ nguyên giá trị
    end
end

endmodule

