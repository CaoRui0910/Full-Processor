/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
 
//Notes:
//mem: 12-bit address; a single clock
//imem.mif and dmem.mif

module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,	               // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 wire [31:0] pcIn, pcOut, pc1, pcN1, finalImmediate, finalT;
	 //temp wire
	 wire t1, t2, t3, t4, t5, t6;
	 wire typeR, BR, JP, ALUinB, DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw;
	 wire isBex, isJ, isJal, isBlt, isBne, isJr, isSetx;
	 wire bex, blt, bne;
	 wire isNotEqual, isLessThan;
	 wire pcT_contrl, pcN1_contrl;
	 wire [4:0] opcode, rs, rt, rd, shamt, aluOp, r30, r31, r0;
	 //wire [1:0] zeroes;
	 wire [16:0] immediate;
	 wire [26:0] T;
	 
	 
	 //Step 1: Instruction Fetch:
	 //PC:
	 //??pc_in?????????????
	 pc myPC(clock, reset, pcIn, pcOut);
	 /*alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt
	 , data_result, isNotEqual, isLessThan, overflow);*/
	 //ck4: alu alu1(pcOut, 32'd1, 5'd0, 5'd0, pcIn, t1, t2, t3);
	 alu alu1(pcOut, 32'd1, 5'd0, 5'd0, pc1, t1, t2, t3);
	 alu alu2(pc1, finalImmediate, 5'd0, 5'd0, pcN1, t4, t5, t6);
	 //Let pcIn be (pcOut+1) or T or (pcOut+1+N) or $rd
	 and and1(bex, isBex, isNotEqual);
	 or or1(pcT_contrl, isJ, isJal, bex);
	 and and2(blt, isBlt, isLessThan); //less than: Asserts true iff data_operandA is strictly less than data_operandB
	 and and3(bne, isBne, isNotEqual);
	 or or2(pcN1_contrl, blt, bne);
	 assign pcIn = isJr? data_readRegA : (pcN1_contrl? pcN1 : (pcT_contrl? finalT : pc1));
	 //?????????????等下设置data_readRegA是$rd (if isJr)
	 //?????????????isLessThan: $rd (data A) < $rs (data B)
	 //?????????????finalT: sign? unsign?
	 //??????????finalImmediate (N): signed extend????
	 
	 
	 //Imem:
	 assign address_imem = pcOut[11:0];
	 
	 //Step 2: Instruction (q_imem) Decode:
	 assign opcode = q_imem[31:27];
	 assign rd = q_imem[26:22];
	 assign rs = q_imem[21:17];
	 assign rt = q_imem[16:12];
	 assign shamt = q_imem[11:7];
	 assign aluOp = q_imem[6:2];
	 //assign zeroes = q_imem[1:0];
	 assign immediate = q_imem[16:0];
	 assign r30 = 5'b11110; //$rstatus
	 assign r31 = 5'b11111; //$r31
	 assign r0 = 5'b00000; //$r0
	 assign T = q_imem[26:0];
	 assign finalT = {5'b00000, T};
	 
	 //target(T) JI type
	 //zeroes?
	 
	 //Control Circuit:
	 /*module control(opcode, aluOp, typeR, BR, JP, ALUinB, DMwe, Rwe, 
	 Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw,
	 isBex, isJ, isJal, isBlt, isBne, isJr, isSetx);*/
	 control ctrl(opcode, aluOp, typeR, BR, JP, ALUinB, DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw, isBex, isJ, isJal, isBlt, isBne, isJr, isSetx);
	 
	 //Step 3: Operand Fetch (read from regfile):
	 //A: $rd or $rstatus($r30) or rs
	 or or3(A_rd_contrl, isBne, isJr, isBlt);
	 //CK4: assign ctrl_readRegA = rs;
	 assign ctrl_readRegA = A_rd_contrl? rd: (isBex? r30 : rs);
	 //B: $rs or $r0 or (rd or rt)--isSw
	 //CK4: assign ctrl_readRegB = isSw ? rd : rt;
	 or or4(B_rs_contrl, isBne, isBlt);
	 assign ctrl_readRegB = B_rs_contrl ? rs : (isBex? r0: (isSw ? rd : rt));
	 //其他情况也都是rt？？？？？？？？？可以不？？？？？？？
	 
	 
	 //Step 4: Execute (ALU):
	 /*alu(data_operandA, data_operandB, ctrl_ALUopcode,
	 ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);*/
	 wire [31:0] data_operandB;
	 wire [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	 wire [31:0] data_result;
	 wire overflow;
	 
	 signExtend signextnd1(finalImmediate, immediate);
	 assign data_operandB = ALUinB ? finalImmediate : data_readRegB;
	 assign ctrl_ALUopcode = typeR? aluOp : 5'b00000;
	 alu alu3(data_readRegA, data_operandB, ctrl_ALUopcode, shamt, data_result, isNotEqual, isLessThan, overflow);
	 
	 
	 //Step 5: Result store (Write result to register or memory):
	 //(1) write regfile
	 assign ctrl_writeEnable = Rwe; //sw????????????
	 //Overflow:
	 wire addOverflow, addiOverflow, subOverflow, isOverflow, writeReg_r30_contrl;
	 and and4(addOverflow, overflow, isAdd);
	 and and5(addiOverflow, overflow, isAddi);
	 and and6(subOverflow, overflow, isSub);
	 or or5(isOverflow, addOverflow, addiOverflow, subOverflow);
	 wire [31:0] overflowData;
	 assign overflowData = isAdd ? 32'd1 : (isAddi ? 32'd2 : (isSub ? 32'd3 :32'd0));
	 //CK4: assign ctrl_writeReg = isOverflow ? r30 : rd;//????????
	 or or6(writeReg_r30_contrl, isOverflow, isSetx);
	 //????????????????(overflow || q_imem == 32'd0) ? 5'b11110
	 assign ctrl_writeReg = isJal ? r31 : (writeReg_r30_contrl? r30 : rd);
	 //CK4: assign data_writeReg = isLw? q_dmem : (isOverflow ? overflowData : data_result);
	 assign data_writeReg = isJal ? pc1: (isSetx? finalT : (isLw? q_dmem : (isOverflow ? overflowData : data_result)));
	 
	 //
	 
	 //(2) Dmem (memory):
	 assign wren = DMwe;
	 assign address_dmem = data_result[11:0];
	 assign data = data_readRegB;
	 
endmodule
