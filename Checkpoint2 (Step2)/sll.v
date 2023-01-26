module sll(data_operandA, ctrl_shiftamt, data_result);
	input [31:0] data_operandA;
	input [4:0] ctrl_shiftamt;
	output [31:0] data_result;
	wire [31:0] result_after_shiftamt0, result_after_shiftamt1, result_after_shiftamt2, result_after_shiftamt3;
	// if ctrl_shiftamt[0]=1, left shift 2^0 bit
	assign result_after_shiftamt0 = ctrl_shiftamt[0] ? {data_operandA[30:0], 1'b0} : data_operandA;
	//if ctrl_shiftamt[1]=1, left shift 2^1 bits
	assign result_after_shiftamt1 = ctrl_shiftamt[1] ? {result_after_shiftamt0[29:0], 2'b00} : result_after_shiftamt0;
	// if ctrl_shiftamt[2]=1, left shift 2^2 bits
	assign result_after_shiftamt2 = ctrl_shiftamt[2] ? {result_after_shiftamt1[27:0], 4'b0000} : result_after_shiftamt1;
	// if ctrl_shiftamt[3]=1, left shift 2^3 bits
	assign result_after_shiftamt3 = ctrl_shiftamt[3] ? {result_after_shiftamt2[23:0], 8'b00000000} : result_after_shiftamt2;
	// if ctrl_shiftamt[4]=1, left shift 2^4 bits
	assign data_result = ctrl_shiftamt[4] ? {result_after_shiftamt3[15:0], 16'b0000000000000000} : result_after_shiftamt3;
	
endmodule
