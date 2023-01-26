module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);
	
	
	
   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	wire [31:0] write_portOut;
	
	wire [31:0] q0, q1, q2, q3, q4, q5, q6, q7, 
	q8, q9, q10, q11, q12, q13, q14, q15, q16, 
	q17, q18, q19, q20, q21, q22, q23, q24, 
	q25, q26, q27, q28, q29, q30, q31;
	
	
	write_port write_port0(write_portOut, ctrl_writeReg, ctrl_writeEnable);
	
	register32 reg0(q0, 32'b00000000000000000000000000000000, clock, write_portOut[0], ctrl_reset);
	register32 reg1(q1, data_writeReg, clock, write_portOut[1], ctrl_reset);
	register32 reg2(q2, data_writeReg, clock, write_portOut[2], ctrl_reset);
	register32 reg3(q3, data_writeReg, clock, write_portOut[3], ctrl_reset);
	register32 reg4(q4, data_writeReg, clock, write_portOut[4], ctrl_reset);
	register32 reg5(q5, data_writeReg, clock, write_portOut[5], ctrl_reset);
	register32 reg6(q6, data_writeReg, clock, write_portOut[6], ctrl_reset);
	register32 reg7(q7, data_writeReg, clock, write_portOut[7], ctrl_reset);
	register32 reg8(q8, data_writeReg, clock, write_portOut[8], ctrl_reset);
	register32 reg9(q9, data_writeReg, clock, write_portOut[9], ctrl_reset);
	register32 reg10(q10, data_writeReg, clock, write_portOut[10], ctrl_reset);
	register32 reg11(q11, data_writeReg, clock, write_portOut[11], ctrl_reset);
	register32 reg12(q12, data_writeReg, clock, write_portOut[12], ctrl_reset);
	register32 reg13(q13, data_writeReg, clock, write_portOut[13], ctrl_reset);
	register32 reg14(q14, data_writeReg, clock, write_portOut[14], ctrl_reset);
	register32 reg15(q15, data_writeReg, clock, write_portOut[15], ctrl_reset);
	register32 reg16(q16, data_writeReg, clock, write_portOut[16], ctrl_reset);
	register32 reg17(q17, data_writeReg, clock, write_portOut[17], ctrl_reset);
	register32 reg18(q18, data_writeReg, clock, write_portOut[18], ctrl_reset);
	register32 reg19(q19, data_writeReg, clock, write_portOut[19], ctrl_reset);
	register32 reg20(q20, data_writeReg, clock, write_portOut[20], ctrl_reset);
	register32 reg21(q21, data_writeReg, clock, write_portOut[21], ctrl_reset);
	register32 reg22(q22, data_writeReg, clock, write_portOut[22], ctrl_reset);
	register32 reg23(q23, data_writeReg, clock, write_portOut[23], ctrl_reset);
	register32 reg24(q24, data_writeReg, clock, write_portOut[24], ctrl_reset);
	register32 reg25(q25, data_writeReg, clock, write_portOut[25], ctrl_reset);
	register32 reg26(q26, data_writeReg, clock, write_portOut[26], ctrl_reset);
	register32 reg27(q27, data_writeReg, clock, write_portOut[27], ctrl_reset);
	register32 reg28(q28, data_writeReg, clock, write_portOut[28], ctrl_reset);
	register32 reg29(q29, data_writeReg, clock, write_portOut[29], ctrl_reset);
	register32 reg30(q30, data_writeReg, clock, write_portOut[30], ctrl_reset);
	register32 reg31(q31, data_writeReg, clock, write_portOut[31], ctrl_reset);
	
	read_port read_portA(data_readRegA, ctrl_readRegA, q0, q1, 
	q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, 
	q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, 
	q22, q23, q24, q25, q26, q27, q28, q29, q30, q31);
	
	read_port read_portB(data_readRegB, ctrl_readRegB, q0, q1, 
	q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, 
	q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, 
	q22, q23, q24, q25, q26, q27, q28, q29, q30, q31);

endmodule
