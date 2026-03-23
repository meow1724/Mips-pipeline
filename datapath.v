`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 17:17:14
// Design Name: 
// Module Name: datapath
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


//module datapath (
//    input clk,
//    input [31:0] instruction,
//    input reg_dst,
//    input alu_src,
//    input mem_to_reg,
//    input reg_write,
//    input mem_read,
//    input mem_write,
//    input branch,
//    input [1:0] alu_op,
//    output [31:0] pc,
//    output [31:0] alu_result,
//    output [31:0] read_data_mem,
//    output zero
//);
//    wire [31:0] pc_next;
    
//    // Basic PC adder
//    wire [31:0] pc_plus_4;
//    assign pc_plus_4 = pc + 4;

//    // Branch calculation logic here (skipped for now, you can add it)

//    // PC Register
//    pc_register pc_reg (
//        .clk(clk),
//        .next_pc(pc_plus_4),
//        .pc(pc)
//    );

//    // (Insert rest of datapath logic here: register file, ALU, etc.)
//    assign alu_result = 32'hABCD1234;  // Just a dummy result for testing
//    assign read_data_mem = 32'h0;
//    assign zero = 0;

//endmodule
module datapath (
    input clk,
    input [31:0] instruction,
    input reg_dst,
    input alu_src,
    input mem_to_reg,
    input reg_write,
    input mem_read,
    input mem_write,
    input branch,
    input [1:0] alu_op,
    output [31:0] pc,
    output [31:0] alu_result,
    output [31:0] read_data_mem,
    output zero
);
    wire [31:0] pc_next, pc_plus_4;
    wire [4:0] write_reg;
    wire [31:0] write_data;

    wire [4:0] rs = instruction[25:21];
    wire [4:0] rt = instruction[20:16];
    wire [4:0] rd = instruction[15:11];

    wire [15:0] imm = instruction[15:0];
    wire [31:0] sign_ext_imm = {{16{imm[15]}}, imm}; // Sign extend

    wire [3:0] alu_control_signal;

    wire [31:0] read_data1, read_data2, alu_in2;

    // PC Logic
    assign pc_plus_4 = pc + 4;
    assign pc_next = pc_plus_4; // (No branching yet)

    pc_register pc_reg (
        .clk(clk),
        .next_pc(pc_next),
        .pc(pc)
    );

    // Register File
    register_file reg_file (
        .clk(clk),
        .reg_write(reg_write),
        .read_reg1(rs),
        .read_reg2(rt),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Destination Register MUX
    assign write_reg = reg_dst ? rd : rt;

    // ALU Input MUX
    assign alu_in2 = alu_src ? sign_ext_imm : read_data2;

    // ALU Control
    alu_control alu_ctrl (
        .alu_op(alu_op),
        .funct(instruction[5:0]),
        .alu_control(alu_control_signal)
    );

    // ALU
    alu alu_unit (
        .a(read_data1),
        .b(alu_in2),
        .alu_control(alu_control_signal),
        .result(alu_result),
        .zero(zero)
    );

    // Data Memory
    data_memory dmem (
        .clk(clk),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .addr(alu_result),
        .write_data(read_data2),
        .read_data(read_data_mem)
    );

    // Write-back MUX
    assign write_data = mem_to_reg ? read_data_mem : alu_result;

endmodule
