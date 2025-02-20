module WasteSorting_tb;


    reg clk;
    reg rst;
    reg [7:0] in_waste;


    wire [7:0] out_plastic;
    wire [7:0] out_glass;
    wire [7:0] out_paper;
    wire [7:0] out_metal;
    wire [7:0] out_textile;
    wire [7:0] out_compost;
    wire [7:0] out_landfill;
    wire [7:0] weight;

    WasteSorting uut (
        .clk(clk),
        .rst(rst),
        .in_waste(in_waste),
        .out_plastic(out_plastic),
        .out_glass(out_glass),
        .out_paper(out_paper),
        .out_metal(out_metal),
        .out_textile(out_textile),
        .out_compost(out_compost),
        .out_landfill(out_landfill),
        .weight(weight)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
       
        rst = 1;
        in_waste = 8'b00000000;
        
   
        #10;
        rst = 0;

        // Test case 1: Plastic waste, weight 2
        in_waste = 8'b00000010; // 2'b00 (Recycled) 2'b00 (Plastic) 4'd2 (weight 2)
        #10;
        $display("Test Case 1: Plastic waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);
        
        // Test case 2: Glass waste, weight 1
        in_waste = 8'b00010001; // 2'b00 (Recycled) 2'b01 (Glass) 4'd1 (weight 1)
        #10;
        $display("Test Case 2: Glass waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);

        // Test case 3: Paper waste, weight 3
        in_waste = 8'b00100011; // 2'b00 (Recycled) 2'b10 (Paper) 4'd3 (weight 3)
        #10;
        $display("Test Case 3: Paper waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);

        // Test case 4: Metal waste,weight 7
        in_waste = 8'b00110111; // 2'b00 (Recycled) 2'b11 (Metal) 4'd7 (weight 7)
        #10;
        $display("Test Case 4: Metal waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);

        // Test case 5: Compost waste, weight 2
        in_waste = 8'b01000010; // 2'b01 (Organic) 4'd2 (weight 2)
        #10;
        $display("Test Case 5: Compost waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);

        // Test case 6: Electronic waste,weight 2
        in_waste = 8'b10000010; // 2'b10 (Hazardous) 2'b00 (Electronic) 4'd2 (weight 2)
        #10;
        $display("Test Case 6: Electronic waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);

        // Test case 7: Medical waste,weight 1
        in_waste = 8'b10100001;
        #10;
        $display("Test Case 7: Medical waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);

        // Test case 8: Other waste, weight 3
        in_waste = 8'b11110011; 
        #10;
        $display("Test Case 8: Other waste, weight = %d", in_waste[3:0]);
        $display("Outputs: out_plastic=%d, out_glass=%d, out_paper=%d, out_metal=%d, out_textile=%d, out_compost=%d, out_landfill=%d, weight=%d\n", out_plastic, out_glass, out_paper, out_metal, out_textile, out_compost, out_landfill, weight);
        $finish;
    end
      
endmodule

