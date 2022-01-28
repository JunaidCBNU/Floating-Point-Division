`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2020 04:20:16 PM
// Design Name: 
// Module Name: FP_Divider
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


module FP_Divider#( 
                        parameter DW = 32,
                        parameter Ex_DW = 8,
                        parameter Man_DW = 23,
                        parameter Dividend_DW = 47,
                        parameter Divisor_DW = 24
                      )
    (
    //for sequential
     input             clk,
     input             rst,
     input en,
    //
     input   [DW-1:0]  A,
     input   [DW-1:0]  B,
     output reg [DW-1:0]  C
    );
    
    wire            sign_A, sign_B, sign_C;
    wire    [Ex_DW-1:0]   exponent_A, exponent_B, exponent_C;
    wire    [Man_DW-1:0]  mantissa_A, mantissa_B, mantissa_C;   
    //comparator value
    wire    [1:0]   AB_comp;
    wire    [Dividend_DW-1:0] Dividend;
    wire    [Divisor_DW-1:0] Divisor;
    wire    [Divisor_DW-1:0] Quotient;
    wire     [DW-1:0] A_prev,B_prev;
    wire    [DW-1:0] C_prev;
    
    
    assign A_prev = (!rst) ? 0 : A;
    assign B_prev = (!rst) ? 0 : B;
    
    assign  C_prev = (A_prev == 0 | B_prev == 0) ? 0 : (en) ? {sign_C, exponent_C, mantissa_C} : 0;
    
    // quotient range (Dividend = 24bit, Divisor = 12bit) // the 12bits of divisor of mantissa truncate !!!
    assign  mantissa_A = A_prev[Man_DW-1:0];
    assign  mantissa_B = B_prev[Man_DW-1:0];
    assign Dividend = { 1'b1, mantissa_A, {(Man_DW){1'b0}}};
    assign Divisor  = { 1'b1, mantissa_B }; 
    
    COMP    comp(mantissa_A, mantissa_B, AB_comp); 
    assign mantissa_C = (AB_comp[0] == 1'b0) ? {Quotient[Divisor_DW-1:0]} : {(Quotient[Divisor_DW-2:0]),{1'b0}};
    assign  exponent_C = (AB_comp[0] == 1'b0) ? (exponent_A - exponent_B + 8'd127) : (exponent_A - exponent_B + 8'd126);  
    // sign
    assign  sign_A = A_prev[DW-1];
    assign  sign_B = B_prev[DW-1];
    assign  sign_C = sign_A ^ sign_B;
    
    // exponent
    assign  exponent_A = A_prev[DW-2'd2:(DW-Ex_DW)-1]; //[30:23]
    assign  exponent_B = B_prev[DW-2'd2:(DW-Ex_DW)-1];
 
    
    //mantissa (23bits)
 
    
    Divider_Sys #(Dividend_DW,Divisor_DW) DV_APROX (.A(Dividend), .B(Divisor), .Q(Quotient));
    
    //assign C = (!rst) ? 0 : C_prev;
    
    always @(posedge clk or negedge rst) begin
        if(!rst) C <= 0;
        else C <= C_prev;
    end
endmodule
