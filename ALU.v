`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 07:52:00 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [15:0] op1,
    input [15:0] op2,
    input [3:0] sel,
    input carry_in,
    output reg [16:0] out,
    output carry_out,
    output zero,
    output neg,
    output overflow,
    output parity
    );
always @ (*)
case (sel)
4'b0000:out=op1+op2; //Add

4'b0001:out=op1+op2+carry_in; //Add with carry

4'b0010:out=op1-op2; //Subtract

4'b0011:out=op1-op2-carry_in; //Subtract with carry

4'b0100:out=0-op1; // 2's complement

4'b0101:out=op1+1; // Increment by 1

4'b0110:out=op1-1; // Decrement by 1

4'b0111:out=op1; // Pass through

4'b1000:out=op1&op2; // AND

4'b1001:out=op1|op2; // OR

4'b1010:out=op1^op2; // XOR

4'b1011:out=~op1; // 1's complement

4'b1100:out=op1<<<1; // Arithmetic left shift by 1

4'b1101:out=op1>>>1; // Arithmetic reight shift by 1

4'b1110:out=op1<<1; // Logical left shift by 1

4'b1111:out=op1>>1; // Logical right shift by 1

default:out=op2; // Mandatory default case

endcase

assign zero= out==0 ? 1 : 0; // Zero flag

assign carry_out= op1+op2>20'h0ffff ? 1 : 0; // Carry out flag

assign neg= out[15]==1 ? 1 : 0;

assign overflow= (op1[15]&op2[15]&(~out[15]))|((~op1[15])&(~op2[15])&out[15]);

assign parity= ~^out;

endmodule
