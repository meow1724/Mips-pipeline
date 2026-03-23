`timescale 1ns / 1ps
module mips_single_cycle (
    input clk,
    output [31:0] pc_out,
    output [31:0] alu_result_out,
    output [31:0] instruction_out
    //output [4:0] write_reg_out
);
    wire [31:0] instruction, alu_result, read_data;
    wire [4:0] write_reg;
    wire reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch;
    wire [1:0] alu_op;
    wire zero;
    wire [4:0] write_reg_out;
    assign instruction_out = instruction;
    assign alu_result_out = alu_result;
    assign write_reg_out = write_reg;

    instruction_memory imem (
        .addr(pc_out),
        .instruction(instruction)
    );

    main_control control (
        .opcode(instruction[31:26]),
        .reg_dst(reg_dst),
        .branch(branch),
        .mem_read(mem_read),
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_write(reg_write)
    );

    datapath dp (
        .clk(clk),
        .instruction(instruction),
        .reg_dst(reg_dst),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .alu_op(alu_op),
        .pc(pc_out),
        .alu_result(alu_result),
        .read_data_mem(read_data),
        .zero(zero)
    );
endmodule