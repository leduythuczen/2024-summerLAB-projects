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
    output reg [7:0] out_enr,
    output reg [7:0] weight
	
);  
    reg [7:0] mem_weight [7:0];
    
    wire endi;	
    wire [7:0] reg_in_waste1; 
Register1 reg1 (
        .clk(clk),
        .rst(rst),
        .d(in_waste),
        .q(reg_in_waste1),
	.q1(endi)
);
    wire [3:0] label;
    wire [7:0] weight1;
    wire endi1;
Waste_Processor process(
        .clk(clk),
        .rst(rst),
	.endi(endi),
        .in_waste(reg_in_waste1),
        .label(label),
        .weight(weight1),
	.q(endi1)
);

    wire endi2;
    wire [3:0] reg_in_waste2;	//label
    wire [7:0] reg_in_waste3;	//weight
Register2 reg2 (
        .clk(clk),
        .rst(rst),
	.endi(endi1),
        .d(label),
        .d1(weight1),
        .q(reg_in_waste2),
        .q1(reg_in_waste3),
	.q2(endi2)
    );
wire [3:0] address;
wire [7:0] weight2;
wire endi3;
Label label1 (
        .clk(clk),
        .rst(rst),
	.endi(endi2),
        .label(reg_in_waste2),
        .weight(reg_in_waste3),
        .address(address),
        .out1(weight2),
	.q(endi3)
    );
wire endi4;
wire [3:0] reg_in_waste4;	//address
wire [7:0] reg_in_waste5;	//weight	
Register2 reg3 (
        .clk(clk),
        .rst(rst),
	.endi(endi3),
        .d(address),
        .d1(weight2),
        .q(reg_in_waste4),
        .q1(reg_in_waste5),
	.q2(endi4)
    );

   


    integer i;



    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1) begin
                mem_weight[i] = 8'd0;
                
            end
            weight = 8'd0;
            
        end else if (endi4)
	begin
            
            weight = weight + reg_in_waste5;
            mem_weight[reg_in_waste4] = mem_weight[reg_in_waste4]+reg_in_waste5;
            



            out_plastic = mem_weight[0];
            out_glass = mem_weight[1];
            out_paper = mem_weight[2];
            out_metal = mem_weight[3];
            out_textile = mem_weight[4];
            out_compost = mem_weight[5];
            out_landfill = mem_weight[6];
            out_enr = mem_weight[7];
        end

    end

endmodule

