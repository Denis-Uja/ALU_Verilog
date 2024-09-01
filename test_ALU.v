`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 09:14:12 PM
// Design Name: 
// Module Name: test_ALU
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


module test_ALU();
    
reg [15:0] op1_t, op2_t;
reg [3:0] sel_t;
reg carry_in_t;
wire [15:0] out_t;
wire  carry_out_t, zero_t, neg_t, overflow_t, parity_t;

ALU dut (
         .op1(op1_t),
         .op2(op2_t),
         .sel(sel_t),
         .carry_in(carry_in_t),
         .out(out_t),
         .carry_out(carry_out_t),
         .zero(zero_t),
         .neg(neg_t),
         .overflow(overflow_t),
         .parity(parity_t)
         );
         
 initial begin
 
 op1_t=125;
 op2_t=90;
 carry_in_t=1;
 sel_t=0;
 
 while (sel_t!=15) begin
 #2 sel_t=sel_t+1;
 end
 
 #2 op1_t=16'hffff; //Overflow test #1
 sel_t=1; 
 
 #2 op1_t=16'h8f0f; //Overflow test #2
 op2_t=16'h8e08;
 
 #2 op1_t=25; //Zero test
 op2_t=25;
 sel_t=2;
 
 #10 $stop;
 
 end

endmodule
