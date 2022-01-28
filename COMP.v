`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2020 02:50:25 PM
// Design Name: 
// Module Name: COMP
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


module COMP(
    input   [22:0]  A,
    input   [22:0]  B,
    output  [1:0]   C);

    wire    [1:0]   temp_C[44:0];

    COMP_UNIT   unit0(A[22], B[22], 2'b0, temp_C[0]);
    COMP_UNIT   unit1(A[21], B[21], 2'b0, temp_C[1]);
    COMP_UNIT   unit2(A[20], B[20], 2'b0, temp_C[2]);
    COMP_UNIT   unit3(A[19], B[19], 2'b0, temp_C[3]);
    COMP_UNIT   unit4(A[18], B[18], 2'b0, temp_C[4]);
    COMP_UNIT   unit5(A[17], B[17], 2'b0, temp_C[5]);
    COMP_UNIT   unit6(A[16], B[16], 2'b0, temp_C[6]);
    COMP_UNIT   unit7(A[15], B[15], 2'b0, temp_C[7]);
    COMP_UNIT   unit8(A[14], B[14], 2'b0, temp_C[8]);
    COMP_UNIT   unit9(A[13], B[13], 2'b0, temp_C[9]);
    COMP_UNIT   unit10(A[12], B[12], 2'b0, temp_C[10]);
    COMP_UNIT   unit11(A[11], B[11], 2'b0, temp_C[11]);
    COMP_UNIT   unit12(A[10], B[10], 2'b0, temp_C[12]);
    COMP_UNIT   unit13(A[9], B[9], 2'b0, temp_C[13]);
    COMP_UNIT   unit14(A[8], B[8], 2'b0, temp_C[14]);
    COMP_UNIT   unit15(A[7], B[7], 2'b0, temp_C[15]);
    COMP_UNIT   unit16(A[6], B[6], 2'b0, temp_C[16]);
    COMP_UNIT   unit17(A[5], B[5], 2'b0, temp_C[17]);
    COMP_UNIT   unit18(A[4], B[4], 2'b0, temp_C[18]);
    COMP_UNIT   unit19(A[3], B[3], 2'b0, temp_C[19]);
    COMP_UNIT   unit20(A[2], B[2], 2'b0, temp_C[20]);
    COMP_UNIT   unit21(A[1], B[1], 2'b0, temp_C[21]);
    COMP_UNIT   unit22(A[0], B[0], 2'b0, temp_C[22]);

    COMP_UNIT   unit23(temp_C[1][1], temp_C[1][0], temp_C[0], temp_C[23]);
    COMP_UNIT   unit24(temp_C[3][1], temp_C[3][0], temp_C[2], temp_C[24]);
    COMP_UNIT   unit25(temp_C[5][1], temp_C[5][0], temp_C[4], temp_C[25]);
    COMP_UNIT   unit26(temp_C[7][1], temp_C[7][0], temp_C[6], temp_C[26]);
    COMP_UNIT   unit27(temp_C[9][1], temp_C[9][0], temp_C[8], temp_C[27]);
    COMP_UNIT   unit28(temp_C[11][1], temp_C[11][0], temp_C[10], temp_C[28]);
    COMP_UNIT   unit29(temp_C[13][1], temp_C[13][0], temp_C[12], temp_C[29]);
    COMP_UNIT   unit30(temp_C[15][1], temp_C[15][0], temp_C[14], temp_C[30]);
    COMP_UNIT   unit31(temp_C[17][1], temp_C[17][0], temp_C[16], temp_C[31]);
    COMP_UNIT   unit32(temp_C[19][1], temp_C[19][0], temp_C[18], temp_C[32]);
    COMP_UNIT   unit33(temp_C[21][1], temp_C[21][0], temp_C[20], temp_C[33]);

    COMP_UNIT   unit34(temp_C[24][1], temp_C[24][0], temp_C[23], temp_C[34]);
    COMP_UNIT   unit35(temp_C[26][1], temp_C[26][0], temp_C[25], temp_C[35]);
    COMP_UNIT   unit36(temp_C[28][1], temp_C[28][0], temp_C[27], temp_C[36]);
    COMP_UNIT   unit37(temp_C[30][1], temp_C[30][0], temp_C[29], temp_C[37]);
    COMP_UNIT   unit38(temp_C[32][1], temp_C[32][0], temp_C[31], temp_C[38]);
   
    COMP_UNIT   unit39(temp_C[22][1], temp_C[22][0], temp_C[33], temp_C[39]);

    COMP_UNIT   unit40(temp_C[35][1], temp_C[35][0], temp_C[34], temp_C[40]);
    COMP_UNIT   unit41(temp_C[37][1], temp_C[37][0], temp_C[36], temp_C[41]);
    COMP_UNIT   unit42(temp_C[39][1], temp_C[39][0], temp_C[38], temp_C[42]);
    COMP_UNIT   unit43(temp_C[41][1], temp_C[41][0], temp_C[40], temp_C[43]);
    
    COMP_UNIT   unit44(temp_C[42][1], temp_C[42][0], temp_C[43], temp_C[44]);

    assign  C = temp_C[44];
endmodule
