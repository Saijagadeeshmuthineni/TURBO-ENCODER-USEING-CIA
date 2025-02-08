# TURBO-ENCODER-USEING-CIA
This project study design of the Turbo encoder in the in-vehicle system (IVS).
Developing the parallel computation method using carry increment adder, it is
shown that both chip size and processing time are improved. The logic utilization
is enhanced by reduce area. The Turbo encoder module designing, simulating,
and synthesing using Xilinx tools. Xilinx vertex low power is employed. The
Turbo encoder module design to be a part of the IVS chip on a single
programmable device.
The EU eCall system, mandated since March 2018, facilitates immediate
communication between vehicles and emergency centers post-accident. Key
components include the in-vehicle system (IVS), public safety answering point
(PSAP), and cellular communication channel. The IVS, equipping with a Turbo
encoder, automatically activates a data channel upon a collision, sending crucial
data like GPS coordinates and VIN number to the nearest PSAP within 4 seconds.
The Turbo encoder, employing a parallel concatenated convolutional code
(PCCC), uses two constituent encoders with eight states and a 1/3 code rate to
enhance digital communication reliability. The encoded data structure involves
1148 input bits, generating 3456 output bits with the influence of the Turbo
encoder's thrills structure. The PCCC incorporates a 3GPP-designed interleaver
technique for improved performance.
Language Used: Verilog
Tool Used: Xilinx
