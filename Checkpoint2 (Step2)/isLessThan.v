module isLessThan(data_operandA, sub_result, sub_overflow, isLessThan);
	input [31:0] data_operandA, sub_result;
	input sub_overflow;
	output isLessThan;
	//if overflow, there are two situations: (1) A<0, B>0; (2) A>0, B<0. --> isLessThan is dependent on A[31]
	//if not overflow, (1) sub_result[31]=0 --> A>=B; (2) sub_result[31]=1 --> A<B
	assign isLessThan = sub_overflow ? data_operandA[31] : sub_result[31];
endmodule