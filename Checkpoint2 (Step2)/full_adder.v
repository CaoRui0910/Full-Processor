//1-bit adder:
module full_adder(a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	wire w1, w2, w3;
	xor g1(sum, a, b, cin);
	xor g2(w1, a, b);
	and g3(w2, a, b);
	and g4(w3, w1, cin);
	or g5(cout, w2, w3);
endmodule
	