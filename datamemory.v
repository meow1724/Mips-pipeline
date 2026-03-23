`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 17:19:24
// Design Name: 
// Module Name: datamemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//module data_memory (
//    input clk, mem_write, mem_read,
//    input [31:0] addr, write_data,
//    output [31:0] read_data
//);
//    reg [31:0] memory[0:255];

//    assign read_data = (mem_read) ? memory[addr[9:2]] : 32'b0;

//    always @(posedge clk) begin
//        if (mem_write)
//            memory[addr[9:2]] <= write_data;
//    end
//endmodule
//module data_memory (
//    input [31:0] addr,
//    input mem_read,
//    output [31:0] read_data
//);
//    wire [7:0] word_addr = addr[9:2];
//    wire [31:0] memory[0:255];

//    genvar i;
//    generate
//        for (i = 0; i < 256; i = i + 1) begin : init_mem
//            assign memory[i] = 32'b0; // Default value, no `initial` block
//        end
//    endgenerate

//    assign read_data = (mem_read) ? memory[word_addr] : 32'b0;
//endmodule
module data_memory (
    input clk, mem_write, mem_read,
    input [31:0] addr, write_data,
    output [31:0] read_data
);
    wire [31:0] memory[0:255];
    genvar i;
      generate
           for (i = 0; i < 256; i = i + 1) begin : init_mem
               assign memory[i] = 32'b0; // Default value, no `initial` block
           end
       endgenerate

    assign read_data = (mem_read) ? memory[addr[9:2]] : 32'b0;

//    always @(posedge clk) begin
//        if (mem_write)
//            memory[addr[9:2]] <= write_data;
//    end
endmodule
//module data_memory (
//    input clk,
//    input mem_write, mem_read,
//    input [31:0] addr,
//    input [31:0] write_data,
//    output [31:0] read_data
//);
//    reg [31:0] memory [0:255];
//    reg [31:0] read_data_reg;

//    // Assign memory read output
//    assign read_data = (mem_read) ? read_data_reg : 32'b0;

//    // Read logic (combinational read)
//    always @(*) begin
//        read_data_reg = memory[addr[9:2]];
//    end

//    // Write logic (sequential write)
//    always @(posedge clk) begin
//        if (mem_write)
//            memory[addr[9:2]] <= write_data;
//    end
//endmodule



