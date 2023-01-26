# Full-Processor
 - Duke University ECE 550 Project
 - A single-cycle 32-bit processor
## 1. Contents
 - Checkpoint 1: Simple ALU
   - ADD
   - SUBTRACT
   - a non-RCA adder with support for addition & subtraction
 - Checkpoint 2: Full ALU
   - AND
   - OR
   - SLL
   - SRA
 - Checkpoint 3: Regfile (register file)
   - 2 read ports
   - 1 write port
   - 32 registers (registers are 32-bits wide)
 - Checkpoint 4: Simple Processor -- R-type and I-type
   - Integrates my register file and ALU units
   - Properly generates the dmem and imem files by generating Quartus syncram
components
   - Implement the following R-type and I-type instructions: add, addi, sub, and, or, sll, sra, sw, and lw
 - Checkpoint 5: Full Processor
   - Integrates my register file and ALU units
   - Properly generates the dmem and imem files by generating Quartus syncram
components
   - implement J-type instructions
## 2. Module Interface
 - ALU:
 <img width="619" alt="Screen Shot 2023-01-26 at 00 14 24" src="https://user-images.githubusercontent.com/93239143/214763421-5dd16539-5a23-412f-a01d-3efb30ce5ab3.png">

 - regfile:
 <img width="629" alt="Screen Shot 2023-01-26 at 00 14 49" src="https://user-images.githubusercontent.com/93239143/214763430-583faf17-3d85-43cd-96fb-bfb9dbb3bfe0.png">

 
 
