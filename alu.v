`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 17:21:27
// Design Name: 
// Module Name: alu
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


module alu (
    input [31:0] a, b,
    input [3:0] alu_control,
    output [31:0] result,
    output zero
);

    wire [31:0] and_res, or_res, add_res, sub_res, slt_res, nor_res;
    
    assign and_res = a & b;
    assign or_res  = a | b;
    assign add_res = a + b;
    assign sub_res = a - b;
    assign slt_res = (a < b) ? 32'b1 : 32'b0;
    assign nor_res = ~(a | b);

    assign result = (alu_control == 4'b0000) ? and_res :
                    (alu_control == 4'b0001) ? or_res  :
                    (alu_control == 4'b0010) ? add_res :
                    (alu_control == 4'b0110) ? sub_res :
                    (alu_control == 4'b0111) ? slt_res :
                    (alu_control == 4'b1100) ? nor_res :
                    32'b0;

    assign zero = (result == 32'b0);
endmodule
