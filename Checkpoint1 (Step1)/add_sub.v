//adder and subtractor for two 32-bit unsigned integers:
module add_sub(data_operandA, data_operandB, ctrl_ALUopcode, data_result, overflow);
	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode;
	output [31:0] data_result;
	output overflow;
	wire cout1, cout2_0, cout2_1, cout2, cinForMSB1, cinForMSB_0, cinForMSB_1, cinForMSB;
	wire[31:0] operandB_complement;
	wire[15:0] reslut2_0, reslut2_1;
	
	//Method to deal with subtraction: use XOR gate to get operand B's 1's 
	//complement (1->0, 0->1). And then get B's 2's complement by making cin for
	//[15-0] is 0/1 ctrl_ALUopcode[0] (implement plus 1).
	xor g1(operandB_complement[0], data_operandB[0], ctrl_ALUopcode[0]);
	xor g2(operandB_complement[1], data_operandB[1], ctrl_ALUopcode[0]);
	xor g3(operandB_complement[2], data_operandB[2], ctrl_ALUopcode[0]);
	xor g4(operandB_complement[3], data_operandB[3], ctrl_ALUopcode[0]);
	xor g5(operandB_complement[4], data_operandB[4], ctrl_ALUopcode[0]);
	xor g6(operandB_complement[5], data_operandB[5], ctrl_ALUopcode[0]);
	xor g7(operandB_complement[6], data_operandB[6], ctrl_ALUopcode[0]);
	xor g8(operandB_complement[7], data_operandB[7], ctrl_ALUopcode[0]);
	xor g9(operandB_complement[8], data_operandB[8], ctrl_ALUopcode[0]);
	xor g10(operandB_complement[9], data_operandB[9], ctrl_ALUopcode[0]);
	xor g11(operandB_complement[10], data_operandB[10], ctrl_ALUopcode[0]);
	xor g12(operandB_complement[11], data_operandB[11], ctrl_ALUopcode[0]);
	xor g13(operandB_complement[12], data_operandB[12], ctrl_ALUopcode[0]);
	xor g14(operandB_complement[13], data_operandB[13], ctrl_ALUopcode[0]);
	xor g15(operandB_complement[14], data_operandB[14], ctrl_ALUopcode[0]);
	xor g16(operandB_complement[15], data_operandB[15], ctrl_ALUopcode[0]);
	xor g17(operandB_complement[16], data_operandB[16], ctrl_ALUopcode[0]);
	xor g18(operandB_complement[17], data_operandB[17], ctrl_ALUopcode[0]);
	xor g19(operandB_complement[18], data_operandB[18], ctrl_ALUopcode[0]);
	xor g20(operandB_complement[19], data_operandB[19], ctrl_ALUopcode[0]);
	xor g21(operandB_complement[20], data_operandB[20], ctrl_ALUopcode[0]);
	xor g22(operandB_complement[21], data_operandB[21], ctrl_ALUopcode[0]);
	xor g23(operandB_complement[22], data_operandB[22], ctrl_ALUopcode[0]);
	xor g24(operandB_complement[23], data_operandB[23], ctrl_ALUopcode[0]);
	xor g25(operandB_complement[24], data_operandB[24], ctrl_ALUopcode[0]);
	xor g26(operandB_complement[25], data_operandB[25], ctrl_ALUopcode[0]);
	xor g27(operandB_complement[26], data_operandB[26], ctrl_ALUopcode[0]);
	xor g28(operandB_complement[27], data_operandB[27], ctrl_ALUopcode[0]);
	xor g29(operandB_complement[28], data_operandB[28], ctrl_ALUopcode[0]);
	xor g30(operandB_complement[29], data_operandB[29], ctrl_ALUopcode[0]);
	xor g31(operandB_complement[30], data_operandB[30], ctrl_ALUopcode[0]);
	xor g32(operandB_complement[31], data_operandB[31], ctrl_ALUopcode[0]);
	
	//Method to deal with addition: first get 16-bit adder, second 
	//get 1-bit mux and 16-bit mux, finally build 32-bit
	//carry select adder based on 16-bit adder and mux.
	adder16 a1(data_operandA[15:0], operandB_complement[15:0], ctrl_ALUopcode[0], data_result[15:0], cout1, cinForMSB1);
	//a[15:0]+b[15:0] does not have cout (cout=1):
	adder16 a2(data_operandA[31:16], operandB_complement[31:16], 1'b0, reslut2_0, cout2_0, cinForMSB_0);
	//a[15:0]+b[15:0] has cout (cout=0):
	adder16 a3(data_operandA[31:16], operandB_complement[31:16], 1'b1, reslut2_1, cout2_1, cinForMSB_1);
	mux16 m1(reslut2_0, reslut2_1, cout1, data_result[31:16]);
	///////////////////////Get the final result////////////////////////
	
	//Overflow: compare cin and cout of MSB
	mux1 m2(cout2_0, cout2_1, cout1, cout2);
	mux1 m3(cinForMSB_0, cinForMSB_1, cout1, cinForMSB);
	xor g33(overflow, cout2, cinForMSB);
	
endmodule
