`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2020 02:50:25 PM
// Design Name: 
// Module Name: Divider_Sys
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


module Divider_Sys#( 
                        parameter Dividend_DW = 47,
                        parameter Divisor_DW = 24
                      )
    (
    input [Dividend_DW-1:0] A,           //Dividend
    input [Divisor_DW-1:0] B,            //Divisor
    
    output [Divisor_DW-1:0] Q
//    output [Divisor_DW:0] R
    );
    
    genvar i;
    
    //additional values
    //reminder - the Sum of PU
    wire [Divisor_DW-1:0] R_0;
    wire [Divisor_DW:0] R_1;
    wire [Divisor_DW:0] R_2;
    wire [Divisor_DW:0] R_3;
    wire [Divisor_DW:0] R_4;
    wire [Divisor_DW:0] R_5;
    wire [Divisor_DW:0] R_6;
    wire [Divisor_DW:0] R_7;
    wire [Divisor_DW:0] R_8;
    wire [Divisor_DW:0] R_9;
    wire [Divisor_DW:0] R_10;
    wire [Divisor_DW:0] R_11;  
    wire [Divisor_DW:0] R_12;
    wire [Divisor_DW:0] R_13;
    wire [Divisor_DW:0] R_14;
    wire [Divisor_DW:0] R_15;
    wire [Divisor_DW:0] R_16;
    wire [Divisor_DW:0] R_17;
    wire [Divisor_DW:0] R_18;
    wire [Divisor_DW:0] R_19;
    wire [Divisor_DW:0] R_20;
    wire [Divisor_DW:0] R_21;
    wire [Divisor_DW:0] R_22;
    wire [Divisor_DW:0] R_23;
    
    //Carry(Only out && MSB is 'sel' signal)        
    wire [Divisor_DW-1:0] C_0;
    wire [Divisor_DW:0] C_1;
    wire [Divisor_DW:0] C_2;
    wire [Divisor_DW:0] C_3;
    wire [Divisor_DW:0] C_4;
    wire [Divisor_DW:0] C_5;
    wire [Divisor_DW:0] C_6;
    wire [Divisor_DW:0] C_7;
    wire [Divisor_DW:0] C_8;
    wire [Divisor_DW:0] C_9;
    wire [Divisor_DW:0] C_10;
    wire [Divisor_DW:0] C_11;
    wire [Divisor_DW:0] C_12;
    wire [Divisor_DW:0] C_13;
    wire [Divisor_DW:0] C_14;
    wire [Divisor_DW:0] C_15;
    wire [Divisor_DW:0] C_16;
    wire [Divisor_DW:0] C_17;
    wire [Divisor_DW:0] C_18;
    wire [Divisor_DW:0] C_19;
    wire [Divisor_DW:0] C_20;
    wire [Divisor_DW:0] C_21;
    wire [Divisor_DW:0] C_22;
    wire [Divisor_DW:0] C_23;
   
    
    //////////////////////////////////////////////////////////////
    ////////////////////////array start///////////////////////////
    //////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////
    /////////////////////1st array(24bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_0_0(.A(A[(Dividend_DW - Divisor_DW)]), .B(B[0]), .Cin(1'b1), .sel(C_0[Divisor_DW-1]), .Cout(C_0[0]), .Result(R_0[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_0
            PE PU(.A(A[(Dividend_DW - Divisor_DW)+i]), .B(B[i]), .Cin(C_0[i-1]), .sel(C_0[Divisor_DW-1]), .Cout(C_0[i]), .Result(R_0[i]));
        end
    endgenerate
    
    //////////////////////////////////////////////////////////////
    /////////////////////2nd array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_1_0(.A(A[(Dividend_DW - Divisor_DW) - 1]), .B(B[0]), .Cin(1'b1), .sel(C_1[Divisor_DW]), .Cout(C_1[0]), .Result(R_1[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_1
            PE PU(.A(R_0[i-1]), .B(B[i]), .Cin(C_1[i-1]), .sel(C_1[Divisor_DW]), .Cout(C_1[i]), .Result(R_1[i]));
        end
    endgenerate
    PE PU_1_24(.A(R_0[Divisor_DW-1]), .B(1'b0), .Cin(C_1[Divisor_DW-1]), .sel(C_1[Divisor_DW]), .Cout(C_1[Divisor_DW]), .Result(R_1[Divisor_DW]));                            

    //////////////////////////////////////////////////////////////
    /////////////////////3rd array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_2_0(.A(A[(Dividend_DW - Divisor_DW - 2)]), .B(B[0]), .Cin(1'b1), .sel(C_2[Divisor_DW]), .Cout(C_2[0]), .Result(R_2[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_2
            PE PU(.A(R_1[i-1]), .B(B[i]), .Cin(C_2[i-1]), .sel(C_2[Divisor_DW]), .Cout(C_2[i]), .Result(R_2[i]));
        end
    endgenerate
    PE PU_2_24(.A(R_1[Divisor_DW-1]), .B(1'b0), .Cin(C_2[Divisor_DW-1]), .sel(C_2[Divisor_DW]), .Cout(C_2[Divisor_DW]), .Result(R_2[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////4th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_3_0(.A(A[(Dividend_DW - Divisor_DW - 3)]), .B(B[0]), .Cin(1'b1), .sel(C_3[Divisor_DW]), .Cout(C_3[0]), .Result(R_3[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_3
            PE PU(.A(R_2[i-1]), .B(B[i]), .Cin(C_3[i-1]), .sel(C_3[Divisor_DW]), .Cout(C_3[i]), .Result(R_3[i]));
        end
    endgenerate
    PE PU_3_24(.A(R_2[Divisor_DW-1]), .B(1'b0), .Cin(C_3[Divisor_DW-1]), .sel(C_3[Divisor_DW]), .Cout(C_3[Divisor_DW]), .Result(R_3[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////5th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_4_0(.A(A[(Dividend_DW - Divisor_DW - 4)]), .B(B[0]), .Cin(1'b1), .sel(C_4[Divisor_DW]), .Cout(C_4[0]), .Result(R_4[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_4
            PE PU(.A(R_3[i-1]), .B(B[i]), .Cin(C_4[i-1]), .sel(C_4[Divisor_DW]), .Cout(C_4[i]), .Result(R_4[i]));
        end
    endgenerate
    PE PU_4_24(.A(R_3[Divisor_DW-1]), .B(1'b0), .Cin(C_4[Divisor_DW-1]), .sel(C_4[Divisor_DW]), .Cout(C_4[Divisor_DW]), .Result(R_4[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////6th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_5_0(.A(A[(Dividend_DW - Divisor_DW - 5)]), .B(B[0]), .Cin(1'b1), .sel(C_5[Divisor_DW]), .Cout(C_5[0]), .Result(R_5[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_5
            PE PU(.A(R_4[i-1]), .B(B[i]), .Cin(C_5[i-1]), .sel(C_5[Divisor_DW]), .Cout(C_5[i]), .Result(R_5[i]));
        end
    endgenerate
    PE PU_5_24(.A(R_4[Divisor_DW-1]), .B(1'b0), .Cin(C_5[Divisor_DW-1]), .sel(C_5[Divisor_DW]), .Cout(C_5[Divisor_DW]), .Result(R_5[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////7th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_6_0(.A(A[(Dividend_DW - Divisor_DW - 6)]), .B(B[0]), .Cin(1'b1), .sel(C_6[Divisor_DW]), .Cout(C_6[0]), .Result(R_6[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_6
            PE PU(.A(R_5[i-1]), .B(B[i]), .Cin(C_6[i-1]), .sel(C_6[Divisor_DW]), .Cout(C_6[i]), .Result(R_6[i]));
        end
    endgenerate
    PE PU_6_24(.A(R_5[Divisor_DW-1]), .B(1'b0), .Cin(C_6[Divisor_DW-1]), .sel(C_6[Divisor_DW]), .Cout(C_6[Divisor_DW]), .Result(R_6[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////8th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_7_0(.A(A[(Dividend_DW - Divisor_DW - 7)]), .B(B[0]), .Cin(1'b1), .sel(C_7[Divisor_DW]), .Cout(C_7[0]), .Result(R_7[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_7
            PE PU(.A(R_6[i-1]), .B(B[i]), .Cin(C_7[i-1]), .sel(C_7[Divisor_DW]), .Cout(C_7[i]), .Result(R_7[i]));
        end
    endgenerate
    PE PU_7_24(.A(R_6[Divisor_DW-1]), .B(1'b0), .Cin(C_7[Divisor_DW-1]), .sel(C_7[Divisor_DW]), .Cout(C_7[Divisor_DW]), .Result(R_7[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////9th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_8_0(.A(A[(Dividend_DW - Divisor_DW - 8)]), .B(B[0]), .Cin(1'b1), .sel(C_8[Divisor_DW]), .Cout(C_8[0]), .Result(R_8[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_8
            PE PU(.A(R_7[i-1]), .B(B[i]), .Cin(C_8[i-1]), .sel(C_8[Divisor_DW]), .Cout(C_8[i]), .Result(R_8[i]));
        end
    endgenerate
    PE PU_8_24(.A(R_7[Divisor_DW-1]), .B(1'b0), .Cin(C_8[Divisor_DW-1]), .sel(C_8[Divisor_DW]), .Cout(C_8[Divisor_DW]), .Result(R_8[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////10th array(25bit)////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_9_0(.A(A[(Dividend_DW - Divisor_DW) - 9]), .B(B[0]), .Cin(1'b1), .sel(C_9[Divisor_DW]), .Cout(C_9[0]), .Result(R_9[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_9
            PE PU(.A(R_8[i-1]), .B(B[i]), .Cin(C_9[i-1]), .sel(C_9[Divisor_DW]), .Cout(C_9[i]), .Result(R_9[i]));
        end
    endgenerate
    PE PU_9_24(.A(R_8[Divisor_DW-1]), .B(1'b0), .Cin(C_9[Divisor_DW-1]), .sel(C_9[Divisor_DW]), .Cout(C_9[Divisor_DW]), .Result(R_9[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////11th array(25bit)////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_10_0(.A(A[(Dividend_DW - Divisor_DW)-10]), .B(B[0]), .Cin(1'b1), .sel(C_10[Divisor_DW]), .Cout(C_10[0]), .Result(R_10[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_10
            PE PU(.A(R_9[i-1]), .B(B[i]), .Cin(C_10[i-1]), .sel(C_10[Divisor_DW]), .Cout(C_10[i]), .Result(R_10[i]));
        end
    endgenerate
    PE PU_10_24(.A(R_9[Divisor_DW-1]), .B(1'b0), .Cin(C_10[Divisor_DW-1]), .sel(C_10[Divisor_DW]), .Cout(C_10[Divisor_DW]), .Result(R_10[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////12th array(25bit)////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_11_0(.A(A[(Dividend_DW - Divisor_DW)-11]), .B(B[0]), .Cin(1'b1), .sel(C_11[Divisor_DW]), .Cout(C_11[0]), .Result(R_11[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_11
            PE PU(.A(R_10[i-1]), .B(B[i]), .Cin(C_11[i-1]), .sel(C_11[Divisor_DW]), .Cout(C_11[i]), .Result(R_11[i]));
        end
    endgenerate
    PE PU_11_24(.A(R_10[Divisor_DW-1]), .B(1'b0), .Cin(C_11[Divisor_DW-1]), .sel(C_11[Divisor_DW]), .Cout(C_11[Divisor_DW]), .Result(R_11[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////13th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_12_0(.A(A[(Dividend_DW - Divisor_DW)-12]), .B(B[0]), .Cin(1'b1), .sel(C_12[Divisor_DW]), .Cout(C_12[0]), .Result(R_12[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_12
            PE PU(.A(R_11[i-1]), .B(B[i]), .Cin(C_12[i-1]), .sel(C_12[Divisor_DW]), .Cout(C_12[i]), .Result(R_12[i]));
        end
    endgenerate
    PE PU_12_24(.A(R_11[Divisor_DW-1]), .B(1'b0), .Cin(C_12[Divisor_DW-1]), .sel(C_12[Divisor_DW]), .Cout(C_12[Divisor_DW]), .Result(R_12[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////14th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_13_0(.A(A[(Dividend_DW - Divisor_DW)-13]), .B(B[0]), .Cin(1'b1), .sel(C_13[Divisor_DW]), .Cout(C_13[0]), .Result(R_13[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_13
            PE PU(.A(R_12[i-1]), .B(B[i]), .Cin(C_13[i-1]), .sel(C_13[Divisor_DW]), .Cout(C_13[i]), .Result(R_13[i]));
        end
    endgenerate
    PE PU_13_24(.A(R_12[Divisor_DW-1]), .B(1'b0), .Cin(C_13[Divisor_DW-1]), .sel(C_13[Divisor_DW]), .Cout(C_13[Divisor_DW]), .Result(R_13[Divisor_DW]));
   
    //////////////////////////////////////////////////////////////
    /////////////////////15th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_14_0(.A(A[(Dividend_DW - Divisor_DW)-14]), .B(B[0]), .Cin(1'b1), .sel(C_14[Divisor_DW]), .Cout(C_14[0]), .Result(R_14[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_14
            PE PU(.A(R_13[i-1]), .B(B[i]), .Cin(C_14[i-1]), .sel(C_14[Divisor_DW]), .Cout(C_14[i]), .Result(R_14[i]));
        end
    endgenerate
    PE PU_14_24(.A(R_13[Divisor_DW-1]), .B(1'b0), .Cin(C_14[Divisor_DW-1]), .sel(C_14[Divisor_DW]), .Cout(C_14[Divisor_DW]), .Result(R_14[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////16th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_15_0(.A(A[(Dividend_DW - Divisor_DW)-15]), .B(B[0]), .Cin(1'b1), .sel(C_15[Divisor_DW]), .Cout(C_15[0]), .Result(R_15[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_15
            PE PU(.A(R_14[i-1]), .B(B[i]), .Cin(C_15[i-1]), .sel(C_15[Divisor_DW]), .Cout(C_15[i]), .Result(R_15[i]));
        end
    endgenerate
    PE PU_15_24(.A(R_14[Divisor_DW-1]), .B(1'b0), .Cin(C_15[Divisor_DW-1]), .sel(C_15[Divisor_DW]), .Cout(C_15[Divisor_DW]), .Result(R_15[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////17th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_16_0(.A(A[(Dividend_DW - Divisor_DW)-16]), .B(B[0]), .Cin(1'b1), .sel(C_16[Divisor_DW]), .Cout(C_16[0]), .Result(R_16[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_16
            PE PU(.A(R_15[i-1]), .B(B[i]), .Cin(C_16[i-1]), .sel(C_16[Divisor_DW]), .Cout(C_16[i]), .Result(R_16[i]));
        end
    endgenerate
    PE PU_16_24(.A(R_15[Divisor_DW-1]), .B(1'b0), .Cin(C_16[Divisor_DW-1]), .sel(C_16[Divisor_DW]), .Cout(C_16[Divisor_DW]), .Result(R_16[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////18th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_17_0(.A(A[(Dividend_DW - Divisor_DW)-17]), .B(B[0]), .Cin(1'b1), .sel(C_17[Divisor_DW]), .Cout(C_17[0]), .Result(R_17[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_17
            PE PU(.A(R_16[i-1]), .B(B[i]), .Cin(C_17[i-1]), .sel(C_17[Divisor_DW]), .Cout(C_17[i]), .Result(R_17[i]));
        end
    endgenerate
    PE PU_17_24(.A(R_16[Divisor_DW-1]), .B(1'b0), .Cin(C_17[Divisor_DW-1]), .sel(C_17[Divisor_DW]), .Cout(C_17[Divisor_DW]), .Result(R_17[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////19th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_18_0(.A(A[(Dividend_DW - Divisor_DW)-18]), .B(B[0]), .Cin(1'b1), .sel(C_18[Divisor_DW]), .Cout(C_18[0]), .Result(R_18[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_18
            PE PU(.A(R_17[i-1]), .B(B[i]), .Cin(C_18[i-1]), .sel(C_18[Divisor_DW]), .Cout(C_18[i]), .Result(R_18[i]));
        end
    endgenerate
    PE PU_18_24(.A(R_17[Divisor_DW-1]), .B(1'b0), .Cin(C_18[Divisor_DW-1]), .sel(C_18[Divisor_DW]), .Cout(C_18[Divisor_DW]), .Result(R_18[Divisor_DW]));
    
    //////////////////////////////////////////////////////////////
    /////////////////////20th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_19_0(.A(A[(Dividend_DW - Divisor_DW)-19]), .B(B[0]), .Cin(1'b1), .sel(C_19[Divisor_DW]), .Cout(C_19[0]), .Result(R_19[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_19
            PE PU(.A(R_18[i-1]), .B(B[i]), .Cin(C_19[i-1]), .sel(C_19[Divisor_DW]), .Cout(C_19[i]), .Result(R_19[i]));
        end
    endgenerate
    PE PU_19_24(.A(R_18[Divisor_DW-1]), .B(1'b0), .Cin(C_19[Divisor_DW-1]), .sel(C_19[Divisor_DW]), .Cout(C_19[Divisor_DW]), .Result(R_19[Divisor_DW]));

    
    //////////////////////////////////////////////////////////////
    /////////////////////21st array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_20_0(.A(A[(Dividend_DW - Divisor_DW)-20]), .B(B[0]), .Cin(1'b1), .sel(C_20[Divisor_DW]), .Cout(C_20[0]), .Result(R_20[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_20
            PE PU(.A(R_19[i-1]), .B(B[i]), .Cin(C_20[i-1]), .sel(C_20[Divisor_DW]), .Cout(C_20[i]), .Result(R_20[i]));
        end
    endgenerate
    PE PU_20_24(.A(R_19[Divisor_DW-1]), .B(1'b0), .Cin(C_20[Divisor_DW-1]), .sel(C_20[Divisor_DW]), .Cout(C_20[Divisor_DW]), .Result(R_20[Divisor_DW]));

    
    //////////////////////////////////////////////////////////////
    /////////////////////22nd array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_21_0(.A(A[(Dividend_DW - Divisor_DW)-21]), .B(B[0]), .Cin(1'b1), .sel(C_21[Divisor_DW]), .Cout(C_21[0]), .Result(R_21[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_21
            PE PU(.A(R_20[i-1]), .B(B[i]), .Cin(C_21[i-1]), .sel(C_21[Divisor_DW]), .Cout(C_21[i]), .Result(R_21[i]));
        end
    endgenerate
    PE PU_21_24(.A(R_20[Divisor_DW-1]), .B(1'b0), .Cin(C_21[Divisor_DW-1]), .sel(C_21[Divisor_DW]), .Cout(C_21[Divisor_DW]), .Result(R_21[Divisor_DW]));

    
    //////////////////////////////////////////////////////////////
    /////////////////////23rd array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_22_0(.A(A[(Dividend_DW - Divisor_DW)-22]), .B(B[0]), .Cin(1'b1), .sel(C_22[Divisor_DW]), .Cout(C_22[0]), .Result(R_22[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_22
            PE PU(.A(R_21[i-1]), .B(B[i]), .Cin(C_22[i-1]), .sel(C_22[Divisor_DW]), .Cout(C_22[i]), .Result(R_22[i]));
        end
    endgenerate
    PE PU_22_24(.A(R_21[Divisor_DW-1]), .B(1'b0), .Cin(C_22[Divisor_DW-1]), .sel(C_22[Divisor_DW]), .Cout(C_22[Divisor_DW]), .Result(R_22[Divisor_DW]));

    
    //////////////////////////////////////////////////////////////
    /////////////////////24th array(25bit)/////////////////////////
    //////////////////////////////////////////////////////////////
    PE PU_23_0(.A(A[(Dividend_DW - Divisor_DW)-23]), .B(B[0]), .Cin(1'b1), .sel(C_23[Divisor_DW]), .Cout(C_23[0]), .Result(R_23[0]));
    generate 
        for(i=1; i<Divisor_DW; i=i+1) begin : PU_23
            PE PU(.A(R_22[i-1]), .B(B[i]), .Cin(C_23[i-1]), .sel(C_23[Divisor_DW]), .Cout(C_23[i]), .Result(R_23[i]));
        end
    endgenerate
    PE PU_23_24(.A(R_22[Divisor_DW-1]), .B(1'b0), .Cin(C_23[Divisor_DW-1]), .sel(C_23[Divisor_DW]), .Cout(C_23[Divisor_DW]), .Result(R_23[Divisor_DW]));
                    
   assign Q = (A == 0 && B == 0) ? 0 : {C_0[Divisor_DW-1],C_1[Divisor_DW],C_2[Divisor_DW],C_3[Divisor_DW],C_4[Divisor_DW],C_5[Divisor_DW],C_6[Divisor_DW],C_7[Divisor_DW],C_8[Divisor_DW],C_9[Divisor_DW],C_10[Divisor_DW],C_11[Divisor_DW],C_12[Divisor_DW],C_13[Divisor_DW],C_14[Divisor_DW],C_15[Divisor_DW],C_16[Divisor_DW],C_17[Divisor_DW],C_18[Divisor_DW],C_19[Divisor_DW],C_20[Divisor_DW],C_21[Divisor_DW],C_22[Divisor_DW],C_23[Divisor_DW]};
//   assign R = R_12;
endmodule
