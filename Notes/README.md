# Assembly Notes
## Lecture 1

### Basic Computer Architecture :
![](Assembly/Computer Architecture.png) 

- CPU consists of 	
  - ALU "Arithmetic Logic Unit" performs arithmetic and bitwise operations
  - CU "Control Unit" cooridnates sequence of execution steps
  - Clock and registers.
- Bus 
  - is a group of parallel wires that transfer data from one part of the computer to another.
- Notes 
  - Accessing data in registers is much faster than memory
  - CPU include several registers that store current instruction and its operands to allow ALU performs the required operation.
  - An instruction requires at least one clock cycle to execute, and a few require of 50 clocks 
  - To synchronize operations inside CPU, an internal clock is continuously pulsing to trigger events
  - Running programs reside in memory and they're executed instruction by instruction
  - To execute an instruction, it should be transferred to the CPU registers and follow the instruction execution cycle.

### Instruction Execution Cycle :
![](Assembly/Instruction Excection Cycle.png) 

### Registers :
![](Assembly/Registers.png) 
#### Accessing parts of registers :
![](Assembly/Accessing registers.png)
![](Assembly/Accessing registers2.png)
 

