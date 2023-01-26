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
	 wire [31:0] pcIn, pcOut;
	 //temp wire
	 wire t1, t2, t3;
	 wire typeR, BR, JP, ALUinB, DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw;
	 wire [4:0] opcode, rs, rt, rd, shamt, aluOp, r30;
	 wire [1:0] zeroes;
	 wire [16:0] immediate;
	 
	 //Step 1: Instruction Fetch:
	 //PC:
	 //??pc_in?????????????
	 pc pc1(clock, reset, pcIn, pcOut);
	 /*alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt
	 , data_result, isNotEqual, isLessThan, overflow);*/
	 alu alu1(pcOut, 32'd1, 5'd0, 5'd0, pcIn, t1, t2, t3);
	 //Imem:
	 assign address_imem = pcOut[11:0];
	 
	 //Step 2: Instruction (q_imem) Decode:
	 assign opcode = q_imem[31:27];
	 assign rd = q_imem[26:22];
	 assign rs = q_imem[21:17];
	 assign rt = q_imem[16:12];
	 assign shamt = q_imem[11:7];
	 assign aluOp = q_imem[6:2];
	 assign zeroes = q_imem[1:0];
	 assign immediate = q_imem[16:0];
	 assign r30 = 5'b11110; //rstatus
	 
	 //Control Circuit:
	 /*control(opcode, aluOp, typeR, BR, JP, ALUinB, 
	 DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw)*/
	 control ctrl(opcode, aluOp, typeR, BR, JP, ALUinB, DMwe, Rwe, Rdst, Rwd, isSw, isAdd, isAddi, isSub, isLw);
	 
	 //Step 3: Operand Fetch (read from regfile):
	 assign ctrl_readRegA = rs;
	 assign ctrl_readRegB = isSw ? rd : rt;
	 
	 //Step 4: Execute (ALU):
	 /*alu(data_operandA, data_operandB, ctrl_ALUopcode,
	 ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);*/
	 wire [31:0] data_operandB, finalImmediate;
	 wire [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	 wire [31:0] data_result;
	 wire isNotEqual, isLessThan, overflow;
	 
	 signExtend signextnd1(finalImmediate, immediate);
	 assign data_operandB = ALUinB ? finalImmediate : data_readRegB;
	 assign ctrl_ALUopcode = typeR? aluOp : 5'b00000;
	 alu alu2(data_readRegA, data_operandB, ctrl_ALUopcode, shamt, data_result, isNotEqual, isLessThan, overflow);
	 
	 
	 //Step 5: Result store (Write result to register or memory):
	 //(1) write regfile
	 assign ctrl_writeEnable = Rwe; //sw????????????
	 //Overflow:
	 wire addOverflow, addiOverflow, subOverflow, isOverflow;
	 and and1(addOverflow, overflow, isAdd);
	 and and2(addiOverflow, overflow, isAddi);
	 and and3(subOverflow, overflow, isSub);
	 or or1(isOverflow, addOverflow, addiOverflow, subOverflow);
	 wire [31:0] overflowData;
	 assign overflowData = isAdd ? 32'd1 : (isAddi ? 32'd2 : (isSub ? 32'd3 :32'd0));
	 assign ctrl_writeReg = isOverflow ? r30 : rd;//????????
	 assign data_writeReg = isLw? q_dmem : (isOverflow ? overflowData : data_result);
	 
	 //
	 
	 //(2) Dmem (memory):
	 assign wren = DMwe;
	 assign address_dmem = data_result[11:0];
	 assign data = data_readRegB;
	 
endmodule
