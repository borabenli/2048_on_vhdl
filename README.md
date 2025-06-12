# 🎮 2048 Game in VHDL (Nexys3 Spartan-6, VGA)

This project implements the classic **2048 game** entirely in **VHDL**, targeting the **Spartan-6 FPGA** (Nexys3 development board). Designed for educational and demonstrative purposes, it simulates the tile-based game logic on a 4×4 grid and outputs visuals via **VGA display**.

All gameplay logic—including shifting, merging, and tile spawning—is built using hardware state machines and combinational logic. No score tracking is included to focus purely on the core mechanics.

## ✨ Features

- ✅ 4×4 tile grid implemented using registers and combinational logic
- 🎮 Supports directional input: Up, Down, Left, Right (via push-buttons)
- 🧠 Fully custom line based control logic
- 🖥️ VGA display output (1600×900)


## 📦 Directory Structure

- `2048-vhdl/`
  - `src/` – VHDL source files
    - `top_module_2048.vhd` – Main module
    - `game_2048_1x4.vhd` – Handles tile movement & merging for 1x4 line
    - `compute_operations.vhd` – 4 1x4 module to compute movements for one side
    - `all_operations.vhd` – 4 compute_operation module to compute movement for all sides 
    - `Mux_4x1_with_4_bit_input_output.vhd` – Mux for selecting correct movement 
    - `counter_4bit.vhd` – 4 bit counter for random_tile_generator (currently not used)
    - `frequencydivider.vhd/` – 100MH to 25MH frequency divider for debouncers
    - `debouncer.vhd` – debouncer for buttons
    - `operation_selecter.vhd/` – 4x2 decoder for selecting correct movement
    - `signal_register_final.vhd/` – registers the signals of each tile in between moves
    - `optimized_second_random_tile.vhd/` – creates random 2 tile after a move
    - `optimized_vga_driver.vhd/` – vga driver for 1600x900 monitor
    - `ucf_2048.ucf`
  - `README.md` – Project documentation


## 🚀 Quickstart

### Requirements

- ✅ Xilinx ISE WebPACK (Tested with 14.7)
- ✅ Nexys3 Spartan-6 FPGA board
- ✅ VGA monitor & cable
- ✅ Push-buttons (on-board or external)

### Running on Hardware

1. Clone this repo
2. Open the ISE project and set `top_module_2048.vhdl` as the top module.
3. Add `ucf_2048.ucf` for pin assignments.
4. Synthesize, implement, and generate bitstream.
5. Upload the bitstream to your Nexys3 board.
6. Connect VGA monitor and play using directional buttons.




## 🧱 Architecture Overview

- **Grid Logic:** 4×4 tile matrix stored in registers. Implements merge/shift logic with directional decoding.
- **FSM Controller:** Controls turn sequencing: input → move → spawn → render
- **Random Tile Generator:** Uses LFSR to select a random empty tile and assign value 
- **VGA Output:** Implements 1600×900 signal timing. Draws each tile as a colored box with dots as values
- **Modular Files:** Each major feature (input, logic, display) isolated in its own module

## ⚠️ Known Issues

- Due to an issue in counter and random_tile_generator, after a while all randomly generated numbers become 4. So we bypassed the counter and just generated 2 in a randomly selected tile after each move.(normally it should generate 2 in %90 of the cases )

- After an invalid move it should not generate a random tile but in our case we realised that even if we input an invalid move, random_tile_generator still generates a 2 in a random tile with 0.


## Roadmap

- Since all known issues located in random_tile_generator module, if we decide to do a second version, we will redesign the logic of this module.



## Author

**Bora Benli**\
GitHub: [@borabenli](https://github.com/borabenli)

---

> Inspired by the original [2048](https://play2048.co/) by Gabriele Cirulli. This FPGA version was created as an academic demonstration of game logic synthesis in hardware.

