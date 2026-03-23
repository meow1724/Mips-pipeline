`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 17:27:35
// Design Name: 
// Module Name: testbench
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






module mips_single_cycle_tb;

  reg clk;
  wire [31:0] pc_out, alu_result_out, instruction_out;
 

  mips_single_cycle uut (
    .clk(clk),
    .pc_out(pc_out),
    .alu_result_out(alu_result_out),
    .instruction_out(instruction_out)

  );

  // Generate clock
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    #200; // run long enough to execute instructions
    $finish;
  end

  initial begin
    $display("Time\tPC\t\tInstruction\t\tALU Result");
    $monitor("%0t\t%h\t%h\t%h\t", $time, pc_out, instruction_out, alu_result_out);
  end

endmodule

