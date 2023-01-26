// 1-bit Mux:
//When s=0, selcect a
//When s=1, select b
module mux1(a, b, s, o);
	input	a, b, s;
	output o;
	wire w1, w2, w3;
	and g1(w1, s, b);
	not g2(w3, s);
	and g3(w2, w3, a);
	or g4(o, w1, w2);

endmodule