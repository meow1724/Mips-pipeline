`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//  // memory[4] = 32'b000100_01000_01011_0000000000000010; // beq $t0, $t3, skip
// Create Date: 21.04.2025 17:19:53
// Design Name: 
// Module Name: instructionmemory
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

module instruction_memory (
    input [31:0] addr,
    output [31:0] instruction
);
    reg [31:0] memory [0:255];

    initial begin
        memory[0] = 32'b001000_00000_00110_0000000000001010; // addi $t0, $zero, 5
        memory[1] = 32'b001000_00000_01000_0000000000000101; // addi $t1, $zero, 3
        memory[2] = 32'b000000_00110_01000_01001_00000_100000; // add $t2, $t0, $t1
      //  memory[3] = 32'b000000_01010_01001_01011_00000_100010; // sub $t3, $t2, $t1
      
      //  memory[4] = 32'b001000_00000_01100_0000000000000001; // addi $t4, $zero, 1 
     //   memory[5] = 32'b001000_00000_01101_0000000000001001; // label: addi $t5, $zero, 9
    end

    assign instruction = memory[addr[9:2]];
endmodule
