# MIPS Pipeline Processor (Verilog)

This project implements a **5-stage pipelined MIPS processor** in **Verilog HDL** to demonstrate instruction pipelining, modular datapath design, and simulation-based verification. The processor follows the standard pipeline architecture:

**Instruction Fetch (IF) → Instruction Decode (ID) → Execute (EX) → Memory Access (MEM) → Write Back (WB)**

The implementation includes supporting digital modules such as adders, comparator, register, memory, FSM logic, and Min–Max computation units used for building and verifying pipeline components.

---

## Features

- 5-stage pipelined MIPS architecture
- Modular Verilog implementation
- Register file and memory integration
- ALU-based execution stage
- Pipeline stage separation
- Simulation using Verilog testbenches
- Reusable digital building blocks

---

## Project Structure

The repository includes the following modules:

- `adder.v` – Basic arithmetic addition module
- `adder4bit.v` – 4-bit hierarchical adder design
- `comparator.v` – Binary comparison logic
- `register.v` – Data storage register module
- `memory.v` – Memory block implementation
- `fsm.v` – Finite State Machine control module
- `Min_Max.v` – Minimum and maximum value detector
- `max_min_tb.v` – Testbench for Min–Max module verification

---

## Tools Used

This project can be simulated using:

- ModelSim
- Vivado Simulator
- Icarus Verilog (iverilog)

Example simulation command:

```bash
iverilog *.v
vvp a.out
