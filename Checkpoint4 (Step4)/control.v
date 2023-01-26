module control(opcode, aluOp, typeR, BR, JP, ALUinB, DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw);

	input [4:0] opcode, aluOp;
	output typeR, BR, JP, ALUinB, DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isSub, isAddi, isLw;
	
	//Control Implementation Using “Random Logic” from our PPT Page 29
	and and1(typeR, ~opcode[0], ~opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);//00000
	and and2(isAddi, opcode[0], ~opcode[1], opcode[2], ~opcode[3], ~opcode[4]);//00101
	and and3(isSw, opcode[0], opcode[1], opcode[2], ~opcode[3], ~opcode[4]);//00111
	and and4(isLw, ~opcode[0], ~opcode[1], ~opcode[2], opcode[3], ~opcode[4]);//01000
	and and7(isAdd, typeR, ~aluOp[0], ~aluOp[1], ~aluOp[2], ~aluOp[3], ~aluOp[4]);//00000
	and and8(isSub, typeR, aluOp[0], ~aluOp[1], ~aluOp[2], ~aluOp[3], ~aluOp[4]);//00001
	
	//this checkpoint doesn't need BR and JP, but they will be needed later
	assign BR = 1'b0;
	assign JP = 1'b0;
	
	or or1(ALUinB, isAddi, isSw, isLw);
	assign DMwe = isSw;
	or or2(Rwe, typeR, isAddi, isLw);
	assign Rdst = typeR;
	assign Rwd = isLw;
	
endmodule
	