`timescale 1ns/ 1ps


//Arithmetic Logic Unit
/*
* INPUT: A, B
* op: 00, A PLUS B
* op: 01, A AND B
* op: 10, A OR B
* op: 11, A XOR B
* OUTPUT A op B
* equal: is A == B?
* even: is the output even?
*/



	 
module ALU(A,B,op,OUT,EQUAL, EVEN);

	input [ 3:0] A;
	input [ 3:0] B;
	input [ 1:0] op;
	output reg [3:0] OUT; // logic in SystemVerilog
	output reg EQUAL;
	output reg EVEN;

	always@* // always_comb in systemverilog
	begin 
		if(op == 0)
		begin
			OUT = A + B; // In class we had A+A BUG here
		end
		else if(op == 2'b01)
		begin
			OUT = A & B;
		end
		else if(op == 2'd2)
			OUT = A | B;
		else
			OUT = A ^ B;
			
			
		EQUAL = (A==B);
		EVEN = !OUT[0];  // 2:10 (even), 3:11(not even)
	end 



endmodule
