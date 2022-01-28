`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2020 02:50:25 PM
// Design Name: 
// Module Name: PE
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


module PE(
    input A,
    input B,
    input Cin,
    input sel,
    output Cout,
    output Result
    );
    
    wire B_bar;    //For Subtract
    wire FA_Sum;   //FA_Result
    
    //B -> -B
    assign B_bar = ~B;
    //A + (-B)
    FA Full_adder(.A(A), .B(B_bar), .Cin(Cin), .Sum(FA_Sum), .Cout(Cout));
    //MuX (sel = 1 : Sum / sel = 0 : A)
    assign Result = (sel) ? FA_Sum : A;
endmodule
