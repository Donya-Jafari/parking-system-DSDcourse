
# Parking Management System

A Verilog-based project that manages the parking spaces in a parking lot, distinguishing between university and non-university cars.

## Tools

The project is implemented using Verilog HDL (Hardware Description Language) and may utilize simulation tools such as ModelSim or Xilinx Vivado for testing and verification. Synthesis tools like Xilinx Vivado Synthesis or Intel Quartus Prime are used to convert the Verilog code into logic that can be implemented on FPGAs.

## Implementation Details

This project utilizes Verilog to create a parking management system. The system monitors the number of parked and vacated cars, maintaining separate counts for university-affiliated and non-university vehicles. Additionally, the system enforces maximum capacity limits for parking spaces. Initial capacities are statically determined, while capacities for non-university vehicles vary dynamically based on time.

## How to Run

To run the system on an FPGA:

  - Use the appropriate synthesis tool (e.g., Xilinx Vivado Synthesis, Intel Quartus Prime) to synthesize the Verilog code.
  - Verify the synthesized design through simulation to ensure functionality meets expectations.
  - Generate the bitstream file that configures the FPGA with the synthesized design.
  - Program the FPGA with the generated bitstream using tools provided by the FPGA vendor.

## Results

The system effectively manages parking by accurately tracking the number of cars parked and vacated.

## Related Links

- [Verilog HDL](https://en.wikipedia.org/wiki/Verilog)
- [ModelSim](https://www.mentor.com/products/fv/modelsim/)
- [Xilinx Vivado](https://www.xilinx.com/products/design-tools/vivado.html)
- [Intel Quartus Prime](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/overview.html)

## Authors

- [Author Name](https://github.com/Donya-Jafari)





