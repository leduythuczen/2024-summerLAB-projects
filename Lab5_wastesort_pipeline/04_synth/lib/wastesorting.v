module WasteSorting (
    input wire clk,
    input wire rst,
    input wire [7:0] in_waste,
    output reg [7:0] out_plastic,
    output reg [7:0] out_glass,
    output reg [7:0] out_paper,
    output reg [7:0] out_metal,
    output reg [7:0] out_textile,
    output reg [7:0] out_compost,
    output reg [7:0] out_landfill,
    output reg [7:0] weight
);

reg [7:0] plastic_counter;
reg [7:0] glass_counter;
reg [7:0] paper_counter;
reg [7:0] metal_counter;
reg [7:0] textile_counter;
reg [7:0] compost_counter;
reg [7:0] landfill_counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin

        out_plastic <= 8'd0;
        out_glass <= 8'd0;
        out_paper <= 8'd0;
        out_metal <= 8'd0;
        out_textile <= 8'd0;
        out_compost <= 8'd0;
        out_landfill <= 8'd0;
        weight <= 8'd0;

        plastic_counter <= 8'd0;
        glass_counter <= 8'd0;
        paper_counter <= 8'd0;
        metal_counter <= 8'd0;
        textile_counter <= 8'd0;
        compost_counter <= 8'd0;
        landfill_counter <= 8'd0;
    end else begin

        case (in_waste[7:6])
            2'b00: begin 
                case (in_waste[5:4])
                    2'b00: begin 
                        out_plastic <= out_plastic + 8'd1;
                        plastic_counter <= plastic_counter + 8'd1;
                        weight <= weight + in_waste[3:0];
                    end
                    2'b01: begin 
                        out_glass <= out_glass + 8'd1;
                        glass_counter <= glass_counter + 8'd1;
                        weight <= weight + in_waste[3:0];
                    end
                    2'b10: begin 
                        out_paper <= out_paper + 8'd1;
                        paper_counter <= paper_counter + 8'd1;
                        weight <= weight + in_waste[3:0];
                    end
                    2'b11: begin 
                        out_metal <= out_metal + 8'd1;
                        metal_counter <= metal_counter + 8'd1;
                        weight <= weight + in_waste[3:0];
                    end
                endcase
            end
            2'b01: begin 
                out_compost <= out_compost + 8'd1;
                compost_counter <= compost_counter + 8'd1;
                weight <= weight + in_waste[3:0];
            end
            2'b10: begin 
                case (in_waste[5:4])
                    2'b00: begin
                        out_landfill <= out_landfill + 8'd1;
                        landfill_counter <= landfill_counter + 8'd1;
                        weight <= weight + in_waste[3:0];
                    end
                    2'b01: begin
                        out_landfill <= out_landfill + 8'd1;
                        landfill_counter <= landfill_counter + 8'd1;
                        weight <= weight + in_waste[3:0];
                    end
                endcase
            end
            2'b11: begin 
                out_landfill <= out_landfill + 8'd1;
                landfill_counter <= landfill_counter + 8'd1;
                weight <= weight + in_waste[3:0];
            end
        endcase
    end
end

endmodule

