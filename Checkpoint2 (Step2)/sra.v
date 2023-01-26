//Arithmetic (or signed) right shift:
module sra(data_operandA, ctrl_shiftamt, data_result);
	input [31:0] data_operandA;
	input [4:0] ctrl_shiftamt;
	output [31:0] data_result;
	wire [31:0] result_after_shiftamt0_1, result_after_shiftamt1_1, result_after_shiftamt2_1, result_after_shiftamt3_1, result_after_shiftamt4_1, result_after_shiftamt0_0, result_after_shiftamt1_0, result_after_shiftamt2_0, result_after_shiftamt3_0, result_after_shiftamt4_0;
	//Two situations: the MSB of data_operandA is 1 or 0
	// if ctrl_shiftamt[0]=1, right shift 2^0 bits and brining in sign bit (1) at left
	assign result_after_shiftamt0_1 = ctrl_shiftamt[0] ? {1'b1, data_operandA[31:1]} : data_operandA;
	// if ctrl_shiftamt[1]=1, right shift 2^1 bits and brining in sign bit (1) at left
	assign result_after_shiftamt1_1 = ctrl_shiftamt[1] ? {2'b11, result_after_shiftamt0_1[31:2]} : result_after_shiftamt0_1;
	//if ctrl_shiftamt[2]=1, right shift 2^2 bits and brining in sign bit (1) at left
	assign result_after_shiftamt2_1 = ctrl_shiftamt[2] ? {4'b1111, result_after_shiftamt1_1[31:4]} : result_after_shiftamt1_1;
	// if ctrl_shiftamt[3]=1, right shift 2^3 bits and brining in sign bit (1) at left
	assign result_after_shiftamt3_1 = ctrl_shiftamt[3] ? {8'b11111111, result_after_shiftamt2_1[31:8]} : result_after_shiftamt2_1;
	// if ctrl_shiftamt[4]=1, right shift 2^4 bits and brining in sign bit (1) at left
	assign result_after_shiftamt4_1 = ctrl_shiftamt[4] ? {16'b1111111111111111, result_after_shiftamt3_1[31:16]} : result_after_shiftamt3_1;

	// if ctrl_shiftamt[0]=1, right shift 2^0 bits and brining in sign bit (0) at left
	assign result_after_shiftamt0_0 = ctrl_shiftamt[0] ? {1'b0, data_operandA[31:1]} : data_operandA;
	// if ctrl_shiftamt[1]=1, right shift 2^1 bits and brining in sign bit (0) at left
	assign result_after_shiftamt1_0 = ctrl_shiftamt[1] ? {2'b00, result_after_shiftamt0_0[31:2]} : result_after_shiftamt0_0;
	//if ctrl_shiftamt[2]=1, right shift 2^2 bits and brining in sign bit (0) at left
	assign result_after_shiftamt2_0 = ctrl_shiftamt[2] ? {4'b0000, result_after_shiftamt1_0[31:4]} : result_after_shiftamt1_0;
	// if ctrl_shiftamt[3]=1, right shift 2^3 bits and brining in sign bit (0) at left
	assign result_after_shiftamt3_0 = ctrl_shiftamt[3] ? {8'b00000000, result_after_shiftamt2_0[31:8]} : result_after_shiftamt2_0;
	// if ctrl_shiftamt[4]=1, right shift 2^4 bits and brining in sign bit (0) at left
	assign result_after_shiftamt4_0 = ctrl_shiftamt[4] ? {16'b0000000000000000, result_after_shiftamt3_0[31:16]} : result_after_shiftamt3_0;
	
	
	assign data_result = data_operandA[31] ? result_after_shiftamt4_1 : result_after_shiftamt4_0;
endmodule

		
			

		