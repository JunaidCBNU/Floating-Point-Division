`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2020 12:42:34 PM
// Design Name: 
// Module Name: COMP_UNIT
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


module COMP_UNIT(
    input           A,
    input           B,
    input   [1:0]   C,
    output  [1:0]   C_next);

    assign  C_next[1] = C[1] | (~C[0] & A & ~B);
    assign  C_next[0] = C[0] | (~C[1] & ~A & B);
endmodule
