//16-bit mux:
//When s=0, select a
//When s=1, select b
module mux16(a, b, s, o);
	input [15:0] a, b;
	input s;
	output [15:0] o;
	mux1 m0(a[0], b[0], s, o[0]);
	mux1 m1(a[1], b[1], s, o[1]);
	mux1 m2(a[2], b[2], s, o[2]);
	mux1 m3(a[3], b[3], s, o[3]);
	mux1 m4(a[4], b[4], s, o[4]);
	mux1 m5(a[5], b[5], s, o[5]);
	mux1 m6(a[6], b[6], s, o[6]);
	mux1 m7(a[7], b[7], s, o[7]);
	mux1 m8(a[8], b[8], s, o[8]);
	mux1 m9(a[9], b[9], s, o[9]);
	mux1 m10(a[10], b[10], s, o[10]);
	mux1 m11(a[11], b[11], s, o[11]);
	mux1 m12(a[12], b[12], s, o[12]);
	mux1 m13(a[13], b[13], s, o[13]);
	mux1 m14(a[14], b[14], s, o[14]);
	mux1 m15(a[15], b[15], s, o[15]);
endmodule