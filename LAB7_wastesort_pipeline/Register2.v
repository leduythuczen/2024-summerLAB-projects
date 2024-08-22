module Register2 (
    input wire clk,
    input wire rst,
    input wire endi,
    input wire [3:0] d,
    input wire [7:0] d1,
    output reg [3:0] q,
    output reg [7:0] q1,
    output reg q2
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 4'b0;
        q1 <= 8'b0;
    end else if (endi) begin
        q <= d;
        q1 <= d1;
	q2 <=endi;
    end
end

endmodule
