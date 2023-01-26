module control(opcode, aluOp, typeR, BR, JP, ALUinB, DMwe, Rwe, 
Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw,
isBex, isJ, isJal, isBlt, isBne, isJr, isSetx);

	input [4:0] opcode, aluOp;
	output typeR, BR, JP, ALUinB, DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isSub, isAddi, isLw;
	output isBex, isJ, isJal, isBlt, isBne, isJr, isSetx;
	//Control Implementation Using “Random Logic” from our PPT Page 29
	and and1(typeR, ~opcode[0], ~opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);//00000
	and and2(isAddi, opcode[0], ~opcode[1], opcode[2], ~opcode[3], ~opcode[4]);//00101
	and and3(isSw, opcode[0], opcode[1], opcode[2], ~opcode[3], ~opcode[4]);//00111
	and and4(isLw, ~opcode[0], ~opcode[1], ~opcode[2], opcode[3], ~opcode[4]);//01000
	and and7(isAdd, typeR, ~aluOp[0], ~aluOp[1], ~aluOp[2], ~aluOp[3], ~aluOp[4]);//00000
	and and8(isSub, typeR, aluOp[0], ~aluOp[1], ~aluOp[2], ~aluOp[3], ~aluOp[4]);//00001
	and and9(isBex, ~opcode[0], opcode[1], opcode[2], ~opcode[3], opcode[4]);//10110
	and and10(isJ, opcode[0], ~opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);//00001
	and and11(isJal, opcode[0], opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);//00011
	and and12(isBlt, ~opcode[0], opcode[1], opcode[2], ~opcode[3], ~opcode[4]);//00110
	and and13(isBne, ~opcode[0], opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);//00010
	and and14(isJr, ~opcode[0], ~opcode[1], opcode[2], ~opcode[3], ~opcode[4]);//00100
	and and15(isSetx, opcode[0], ~opcode[1], opcode[2], ~opcode[3], opcode[4]);//10101
	
	//this checkpoint doesn't need BR and JP, but they will be needed later
	//assign BR = 1'b0;
	//assign JP = 1'b0;
	
	or or1(ALUinB, isAddi, isSw, isLw);
	assign DMwe = isSw;
	//CK4: or or2(Rwe, typeR, isAddi, isLw);
	or or2(Rwe, typeR, isAddi, isLw, isJal, isSetx);
	assign Rdst = typeR;
	assign Rwd = isLw;
	
endmodule
	