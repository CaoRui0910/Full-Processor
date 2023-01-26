//16-bit adder:
module adder16(a, b, cin, sum, cout, cinForMSB);
	input [15:0] a, b;
	input cin;
	output [15:0] sum;
	output cout, cinForMSB;
	wire [14:1] c;
	full_adder fa0(a[0], b[0], cin, sum[0], c[1]);
	full_adder fa1(a[1], b[1], c[1], sum[1], c[2]);
	full_adder fa2(a[2], b[2], c[2], sum[2], c[3]);
	full_adder fa3(a[3], b[3], c[3], sum[3], c[4]);
	full_adder fa4(a[4], b[4], c[4], sum[4], c[5]);
	full_adder fa5(a[5], b[5], c[5], sum[5], c[6]);
	full_adder fa6(a[6], b[6], c[6], sum[6], c[7]);
	full_adder fa7(a[7], b[7], c[7], sum[7], c[8]);
	full_adder fa8(a[8], b[8], c[8], sum[8], c[9]);
	full_adder fa9(a[9], b[9], c[9], sum[9], c[10]);
	full_adder fa10(a[10], b[10], c[10], sum[10], c[11]);
	full_adder fa11(a[11], b[11], c[11], sum[11], c[12]);
	full_adder fa12(a[12], b[12], c[12], sum[12], c[13]);
	full_adder fa13(a[13], b[13], c[13], sum[13], c[14]);
	full_adder fa14(a[14], b[14], c[14], sum[14], cinForMSB);
	full_adder fa15(a[15], b[15], cinForMSB, sum[15], cout);
endmodule