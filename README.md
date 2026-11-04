# BARREL_SHIFTER
A parameterized Verilog module that performs a logical right shift
# N-Bit Barrel Shifter

A parameterized Verilog module that implements an **N-bit logical right barrel shifter**. The shift amount is provided by the `s` input, and vacated bit positions are filled with zeros.

## Features

- Parameterized data width
- Supports shift amounts from 0 to `N-1`
- Uses cascaded shift stages controlled by individual bits of `s`
- Includes a testbench that checks every input value and shift amount for the default 8-bit configuration

## Module interface

| Port | Direction | Width | Description |
|---|---|---:|---|
| `a` | Input | `N` bits | Data to shift |
| `s` | Input | `Q` bits | Shift amount |
| `y` | Output | `N` bits | Shifted result |

Parameters:

- `N`: Data width; defaults to `8`
- `Q`: Shift-control width; defaults to `$clog2(N)`

For `N = 8`, `Q = 3`, so `s` selects a shift from 0 to 7 bits.

## Example

With `a = 8'b10110110`:

| `s` | Shift amount | `y` |
|---|---:|---|
| `3'b000` | 0 | `10110110` |
| `3'b001` | 1 | `01011011` |
| `3'b010` | 2 | `00101101` |
| `3'b011` | 3 | `00010110` |

## Files

- `N_BIT_BARREL_SHIFTER_2TO1MUX_BH.v` — barrel shifter design
- `tb_N_BIT_BARREL_SHIFTER.v` — self-checking testbench

## Simulating in Vivado

1. Create or open a Vivado project.
2. Add the design file as a **Design Source**.
3. Add the testbench as a **Simulation Source**.
4. Set `tb_N_BIT_BARREL_SHIFTER` as the simulation top.
5. Run **Behavioral Simulation**.
6. Check the Tcl Console for the test result:
   - `PASS: all input and shift combinations passed.` means the checks succeeded.
   - A `FAIL` message shows the input, shift amount, expected result, and actual result.

The included testbench checks all 256 input values and all 8 shift amounts for `N = 8`.

## Notes

- This module performs a **logical right shift**, not a rotate; shifted-out bits are discarded.
- The example and testbench use the default width of 8 bits.
- Choose `N` as a power of two for the full range of shift amounts to be exactly 0 through `N-1`.
