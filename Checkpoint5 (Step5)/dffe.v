module pc(clock, reset, pcIn, pcOut);
	input clock, reset;
	input [31:0] pcIn;
	output [31:0] pcOut;
	reg [31:0] pcOut;
	
	
	initial
   begin
			pcOut=32'd0;
   end
	
	
	always @ (posedge clock or posedge reset)
	begin
		if(reset)
			pcOut<=32'd0;
		else
			pcOut<=pcIn;
	end
	
	
endmodule
