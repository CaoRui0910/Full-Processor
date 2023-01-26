module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	wire [31:0] add_sub_result, and_result, or_result, sll_result, sra_result, sub_result, sub_overflow;
	
	add_sub add_sub1(data_operandA, data_operandB, ctrl_ALUopcode, add_sub_result, overflow);
	bitwise_and bitwise_and1(data_operandA, data_operandB, and_result);
	bitwise_or bitwise_or1(data_operandA, data_operandB, or_result);
	sll sll1(data_operandA, ctrl_shiftamt, sll_result);
	sra sra1(data_operandA, ctrl_shiftamt, sra_result);
	
	//isNotEqual & isLessThan after subtract operation:
	add_sub sub1(data_operandA, data_operandB, 5'b00001, sub_result, sub_overflow);
	isNotEqual isNotEqual1(sub_result, sub_overflow, isNotEqual);
	isLessThan isLessThan1(data_operandA, sub_result, sub_overflow, isLessThan);
	
	assign  data_result =  ctrl_ALUopcode[2] ? (ctrl_ALUopcode[0] ? sra_result : sll_result) : (ctrl_ALUopcode[1] ? (ctrl_ALUopcode[0] ? or_result : and_result) : add_sub_result);
endmodule