# 5-Stage-Pipelined-MIPS-Processor

This project is a fully functional 5-stage pipelined MIPS processor implemented in **Verilog HDL**, designed to simulate instruction-level parallelism using classical RISC pipeline architecture.

## 📁 Project Structure
├── README.md # Project documentation

├── mips_cpu.v # Top-level module

├── alu.v # ALU implementation

├── alu_control.v # ALU control logic

├── adder.v # Simple adder for PC + 4

├── control.v # Main control unit

├── data_mem.v # Data memory module

├── forwarding_unit.v # Forwarding logic

├── hazard_unit.v # Hazard detection logic

├── id_ex.v # ID/EX pipeline register

├── if_id.v # IF/ID pipeline register

├── ex_mem.v # EX/MEM pipeline register

├── mem_wb.v # MEM/WB pipeline register

├── instr_mem.v # Instruction memory

├── reg_file.v # Register file

├── pc.v # Program counter

├── sign_extend.v # Sign extension unit


🧠 Features
✅ 5-stage pipeline: IF, ID, EX, MEM, WB
✅ Modular design using Verilog HDL
✅ Support for key MIPS instructions:
Arithmetic: add, sub
Load/Store: lw, sw
Branch: beq
✅ Implements:
Hazard detection unit (for load-use hazards)
Forwarding unit (for data dependencies)
Pipeline registers (IF/ID, ID/EX, EX/MEM, MEM/WB)
✅ Verified using testbenches and waveform simulation in Vivado or ModelSim

ModelSim

📌 ISA Subset Supported
Instruction Type	Instructions
R-type	add, sub
I-type	addi, lw, sw, beq

⚠️ Logical (and, or, etc.) and jump instructions (j, jr) are not yet implemented.

.

🛠 Future Work
1.Add basic exception handling (syscall, overflow detection)
2.Synthesize to FPGA (e.g., Basys 3)
3.Expand the instruction set



