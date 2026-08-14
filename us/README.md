# Universal Shift Register with Parallel Load

## Description
This project implements a 4-bit Universal Shift Register with Parallel Load using Verilog HDL.

The register supports:
- Parallel Load
- Shift Left
- Shift Right
- Hold

## Operations

| Mode | Operation |
|------|-----------|
| 00 | Hold |
| 01 | Shift Right |
| 10 | Shift Left |
| 11 | Parallel Load |

## Files
- `universal_shift_register.v` - Main Verilog design
- `tb_universal_shift_register.v` - Testbench
- `output.txt` - Simulation output

## Tools
- Verilog HDL
- Icarus Verilog
- GTKWave

