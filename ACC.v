module ACC
(
    input clk,
    input [15:0]ALU_in,
    output [15:0]ALU_out,
    output [15:0]MBR_out,
    output flag
);

reg [15:0]buffer = 16'b0000_0000_0000_0000;
assign ALU_out = buffer;
assign MBR_out = buffer;

endmodule