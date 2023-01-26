module write_port(write_portOut, ctrl_writeReg, ctrl_writeEnable);
	input ctrl_writeEnable;
	input [4:0] ctrl_writeReg;
	output [31:0] write_portOut;
	
	wire [31:0] ctrl_writeReg32bit;
	decoder32 decd_write(ctrl_writeReg32bit, ctrl_writeReg);
	
	and g0(write_portOut[0], ctrl_writeEnable, ctrl_writeReg32bit[0]);
	and g1(write_portOut[1], ctrl_writeEnable, ctrl_writeReg32bit[1]);
	and g2(write_portOut[2], ctrl_writeEnable, ctrl_writeReg32bit[2]);
	and g3(write_portOut[3], ctrl_writeEnable, ctrl_writeReg32bit[3]);
	and g4(write_portOut[4], ctrl_writeEnable, ctrl_writeReg32bit[4]);
	and g5(write_portOut[5], ctrl_writeEnable, ctrl_writeReg32bit[5]);
	and g6(write_portOut[6], ctrl_writeEnable, ctrl_writeReg32bit[6]);
	and g7(write_portOut[7], ctrl_writeEnable, ctrl_writeReg32bit[7]);
	and g8(write_portOut[8], ctrl_writeEnable, ctrl_writeReg32bit[8]);
	and g9(write_portOut[9], ctrl_writeEnable, ctrl_writeReg32bit[9]);
	and g10(write_portOut[10], ctrl_writeEnable, ctrl_writeReg32bit[10]);
	and g11(write_portOut[11], ctrl_writeEnable, ctrl_writeReg32bit[11]);
	and g12(write_portOut[12], ctrl_writeEnable, ctrl_writeReg32bit[12]);
	and g13(write_portOut[13], ctrl_writeEnable, ctrl_writeReg32bit[13]);
	and g14(write_portOut[14], ctrl_writeEnable, ctrl_writeReg32bit[14]);
	and g15(write_portOut[15], ctrl_writeEnable, ctrl_writeReg32bit[15]);
	and g16(write_portOut[16], ctrl_writeEnable, ctrl_writeReg32bit[16]);
	and g17(write_portOut[17], ctrl_writeEnable, ctrl_writeReg32bit[17]);
	and g18(write_portOut[18], ctrl_writeEnable, ctrl_writeReg32bit[18]);
	and g19(write_portOut[19], ctrl_writeEnable, ctrl_writeReg32bit[19]);
	and g20(write_portOut[20], ctrl_writeEnable, ctrl_writeReg32bit[20]);
	and g21(write_portOut[21], ctrl_writeEnable, ctrl_writeReg32bit[21]);
	and g22(write_portOut[22], ctrl_writeEnable, ctrl_writeReg32bit[22]);
	and g23(write_portOut[23], ctrl_writeEnable, ctrl_writeReg32bit[23]);
	and g24(write_portOut[24], ctrl_writeEnable, ctrl_writeReg32bit[24]);
	and g25(write_portOut[25], ctrl_writeEnable, ctrl_writeReg32bit[25]);
	and g26(write_portOut[26], ctrl_writeEnable, ctrl_writeReg32bit[26]);
	and g27(write_portOut[27], ctrl_writeEnable, ctrl_writeReg32bit[27]);
	and g28(write_portOut[28], ctrl_writeEnable, ctrl_writeReg32bit[28]);
	and g29(write_portOut[29], ctrl_writeEnable, ctrl_writeReg32bit[29]);
	and g30(write_portOut[30], ctrl_writeEnable, ctrl_writeReg32bit[30]);
	and g31(write_portOut[31], ctrl_writeEnable, ctrl_writeReg32bit[31]);
	
endmodule
