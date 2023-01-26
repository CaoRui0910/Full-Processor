module signExtend(finalImmediate, immediate);

	input [16:0] immediate;
	output [31:0] finalImmediate;
	
	assign finalImmediate = immediate[16]? {15'b111111111111111, immediate} : {15'b000000000000000, immediate};
	
endmodule
