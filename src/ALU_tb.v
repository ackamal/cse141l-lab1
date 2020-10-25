`timescale 1ns/ 1ps



//Test bench
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


module ALU_tb;
reg [ 3:0] INPUTA;     	  // data inputs
reg [ 3:0] INPUTB;
reg [ 1:0] op;		// ALU opcode, part of microcode
wire [3:0] OUT;		  

  wire EVEN;              
  wire EQUAL;
 
 reg [ 3:0] expected;
 
// CONNECTION
ALU uut(
  .A(INPUTA),      	  // data inputs
  .B(INPUTB),
  .op(op),				  // ALU opcode, part of microcode
  .OUT,		  			// or:  output reg [3:0] OUT,
  .EVEN,              // LSB of output = 0
 . EQUAL
    );
	 
initial begin


	INPUTA = 1;
	INPUTB = 1; 
	op= 'b01; // AND
	test_alu_func; // void function call
	#5;
	
	
	INPUTA = 2;
	INPUTB = 1;
	op= 'b00; // ADD
	test_alu_func; // void function call
	#5;
	end
	
	task test_alu_func;
	begin
	  case (op)
		0: expected = INPUTA + INPUTB;
		1: expected = INPUTA & INPUTB;
		2: expected = INPUTA | INPUTB;
		3: expected = INPUTA ^ INPUTB;
	  endcase
	  #1; if(expected == OUT)
		begin
			$display("%t YAY!! inputs = %h %h, opcode = %b, EVEN %b, EQUAL %b",$time, INPUTA,INPUTB,op, EVEN, EQUAL);
		end
	    else begin $display("%t FAIL! inputs = %h %h, opcode = %b, EVEN %b, EQUAL %b",$time, INPUTA,INPUTB,op, EVEN, EQUAL);end
		
	end
	endtask



endmodule
