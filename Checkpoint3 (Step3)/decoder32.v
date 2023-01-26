//converts from 5 bits binary to 2^5 bits one hot
module decoder32(ctrl_reg32bit, ctrl_reg5bit);
	input [4:0] ctrl_reg5bit;
	output [31:0] ctrl_reg32bit;
	
	wire w0, w1, w2, w3, w4;
	
	not n0(w0, ctrl_reg5bit[0]);
	not n1(w1, ctrl_reg5bit[1]);
	not n2(w2, ctrl_reg5bit[2]);
	not n3(w3, ctrl_reg5bit[3]);
	not n4(w4, ctrl_reg5bit[4]);
	
	and g0(ctrl_reg32bit[0], w0, w1, w2, w3, w4);
	and g1(ctrl_reg32bit[1], ctrl_reg5bit[0], w1, w2, w3, w4);
	and g2(ctrl_reg32bit[2], w0, ctrl_reg5bit[1], w2, w3, w4);
	and g3(ctrl_reg32bit[3], ctrl_reg5bit[0], ctrl_reg5bit[1], w2, w3, w4);
	and g4(ctrl_reg32bit[4], w0, w1, ctrl_reg5bit[2], w3, w4);
	and g5(ctrl_reg32bit[5], ctrl_reg5bit[0], w1, ctrl_reg5bit[2], w3, w4);
	and g6(ctrl_reg32bit[6], w0, ctrl_reg5bit[1], ctrl_reg5bit[2], w3, w4);
	and g7(ctrl_reg32bit[7], ctrl_reg5bit[0], ctrl_reg5bit[1], ctrl_reg5bit[2], w3, w4);
	and g8(ctrl_reg32bit[8], w0, w1, w2, ctrl_reg5bit[3], w4);
	and g9(ctrl_reg32bit[9], ctrl_reg5bit[0], w1, w2, ctrl_reg5bit[3], w4);
	and g10(ctrl_reg32bit[10], w0, ctrl_reg5bit[1], w2, ctrl_reg5bit[3], w4);
	and g11(ctrl_reg32bit[11], ctrl_reg5bit[0], ctrl_reg5bit[1], w2, ctrl_reg5bit[3], w4);
	and g12(ctrl_reg32bit[12], w0, w1, ctrl_reg5bit[2], ctrl_reg5bit[3], w4);
	and g13(ctrl_reg32bit[13], ctrl_reg5bit[0], w1, ctrl_reg5bit[2], ctrl_reg5bit[3], w4);
	and g14(ctrl_reg32bit[14], w0, ctrl_reg5bit[1], ctrl_reg5bit[2], ctrl_reg5bit[3], w4);
	and g15(ctrl_reg32bit[15], ctrl_reg5bit[0], ctrl_reg5bit[1], ctrl_reg5bit[2], ctrl_reg5bit[3], w4);
	and g16(ctrl_reg32bit[16], w0, w1, w2, w3, ctrl_reg5bit[4]);
	and g17(ctrl_reg32bit[17], ctrl_reg5bit[0], w1, w2, w3, ctrl_reg5bit[4]);
	and g18(ctrl_reg32bit[18], w0, ctrl_reg5bit[1], w2, w3, ctrl_reg5bit[4]);
	and g19(ctrl_reg32bit[19], ctrl_reg5bit[0], ctrl_reg5bit[1], w2, w3, ctrl_reg5bit[4]);
	and g20(ctrl_reg32bit[20], w0, w1, ctrl_reg5bit[2], w3, ctrl_reg5bit[4]);
	and g21(ctrl_reg32bit[21], ctrl_reg5bit[0], w1, ctrl_reg5bit[2], w3, ctrl_reg5bit[4]);
	and g22(ctrl_reg32bit[22], w0, ctrl_reg5bit[1], ctrl_reg5bit[2], w3, ctrl_reg5bit[4]);
	and g23(ctrl_reg32bit[23], ctrl_reg5bit[0], ctrl_reg5bit[1], ctrl_reg5bit[2], w3, ctrl_reg5bit[4]);
	and g24(ctrl_reg32bit[24], w0, w1, w2, ctrl_reg5bit[3], ctrl_reg5bit[4]);
	and g25(ctrl_reg32bit[25], ctrl_reg5bit[0], w1, w2, ctrl_reg5bit[3], ctrl_reg5bit[4]);
	and g26(ctrl_reg32bit[26], w0, ctrl_reg5bit[1], w2, ctrl_reg5bit[3], ctrl_reg5bit[4]);
	and g27(ctrl_reg32bit[27], ctrl_reg5bit[0], ctrl_reg5bit[1], w2, ctrl_reg5bit[3], ctrl_reg5bit[4]);
	and g28(ctrl_reg32bit[28], w0, w1, ctrl_reg5bit[2], ctrl_reg5bit[3], ctrl_reg5bit[4]);
	and g29(ctrl_reg32bit[29], ctrl_reg5bit[0], w1, ctrl_reg5bit[2], ctrl_reg5bit[3], ctrl_reg5bit[4]);
	and g30(ctrl_reg32bit[30], w0, ctrl_reg5bit[1], ctrl_reg5bit[2], ctrl_reg5bit[3], ctrl_reg5bit[4]);
	and g31(ctrl_reg32bit[31], ctrl_reg5bit[0], ctrl_reg5bit[1], ctrl_reg5bit[2], ctrl_reg5bit[3], ctrl_reg5bit[4]);
	
endmodule
