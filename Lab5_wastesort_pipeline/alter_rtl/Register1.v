module Register1 (
    input wire clk,
    input wire rst,
    input wire [7:0] d,
    output reg [7:0] q,
    output reg q1
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 8'b0;
        q1 <= 1'b0;
    end else begin
        q <= d;
        q1 <= 1'b1;
    end
end

endmodule

