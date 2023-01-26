module bitwise_and(data_operandA, data_operandB, data_result);
	input [31:0] data_operandA, data_operandB;
	output [31:0] data_result;
	
	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1) begin: andgateforloop
			and and_gate(data_result[i], data_operandA[i], data_operandB[i]);
			end
		endgenerate
endmodule
