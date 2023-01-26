module read_port(data_readReg, ctrl_readReg, q0, q1, 
q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, 
q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, 
q22, q23, q24, q25, q26, q27, q28, q29, q30, q31);
	
	output [31:0] data_readReg;
	input [4:0] ctrl_readReg;
	input [31:0] q0, q1, q2, q3, q4, q5, q6, q7, 
	q8, q9, q10, q11, q12, q13, q14, q15, q16, 
	q17, q18, q19, q20, q21, q22, q23, q24, 
	q25, q26, q27, q28, q29, q30, q31;
	
	//converts from 5 bits binary to 2^5 bits one hot
	wire [31:0] ctrl_readReg32bit;
	decoder32 decd_read(ctrl_readReg32bit, ctrl_readReg);
	
	//tristate buffers:
	wire [31:0] buffer_output[31:0];
	assign buffer_output[0] = ctrl_readReg32bit[0] ? q0 : 1'bz;
	assign buffer_output[1] = ctrl_readReg32bit[1] ? q1 : 1'bz;
	assign buffer_output[2] = ctrl_readReg32bit[2] ? q2 : 1'bz;
	assign buffer_output[3] = ctrl_readReg32bit[3] ? q3 : 1'bz;
	assign buffer_output[4] = ctrl_readReg32bit[4] ? q4 : 1'bz;
	assign buffer_output[5] = ctrl_readReg32bit[5] ? q5 : 1'bz;
	assign buffer_output[6] = ctrl_readReg32bit[6] ? q6 : 1'bz;
	assign buffer_output[7] = ctrl_readReg32bit[7] ? q7 : 1'bz;
	assign buffer_output[8] = ctrl_readReg32bit[8] ? q8 : 1'bz;
	assign buffer_output[9] = ctrl_readReg32bit[9] ? q9 : 1'bz;
	assign buffer_output[10] = ctrl_readReg32bit[10] ? q10 : 1'bz;
	assign buffer_output[11] = ctrl_readReg32bit[11] ? q11 : 1'bz;
	assign buffer_output[12] = ctrl_readReg32bit[12] ? q12 : 1'bz;
	assign buffer_output[13] = ctrl_readReg32bit[13] ? q13 : 1'bz;
	assign buffer_output[14] = ctrl_readReg32bit[14] ? q14 : 1'bz;
	assign buffer_output[15] = ctrl_readReg32bit[15] ? q15 : 1'bz;
	assign buffer_output[16] = ctrl_readReg32bit[16] ? q16 : 1'bz;
	assign buffer_output[17] = ctrl_readReg32bit[17] ? q17 : 1'bz;
	assign buffer_output[18] = ctrl_readReg32bit[18] ? q18 : 1'bz;
	assign buffer_output[19] = ctrl_readReg32bit[19] ? q19 : 1'bz;
	assign buffer_output[20] = ctrl_readReg32bit[20] ? q20 : 1'bz;
	assign buffer_output[21] = ctrl_readReg32bit[21] ? q21 : 1'bz;
	assign buffer_output[22] = ctrl_readReg32bit[22] ? q22 : 1'bz;
	assign buffer_output[23] = ctrl_readReg32bit[23] ? q23 : 1'bz;
	assign buffer_output[24] = ctrl_readReg32bit[24] ? q24 : 1'bz;
	assign buffer_output[25] = ctrl_readReg32bit[25] ? q25 : 1'bz;
	assign buffer_output[26] = ctrl_readReg32bit[26] ? q26 : 1'bz;
	assign buffer_output[27] = ctrl_readReg32bit[27] ? q27 : 1'bz;
	assign buffer_output[28] = ctrl_readReg32bit[28] ? q28 : 1'bz;
	assign buffer_output[29] = ctrl_readReg32bit[29] ? q29 : 1'bz;
	assign buffer_output[30] = ctrl_readReg32bit[30] ? q30 : 1'bz;
	assign buffer_output[31] = ctrl_readReg32bit[31] ? q31 : 1'bz;
	
	assign data_readReg = buffer_output[ctrl_readReg];
	
	
endmodule
