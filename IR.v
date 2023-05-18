module IR
(
    input clk,
    input [31:0]control_signal,
    input [15:0]MBR_in,
    output [7:0]CU_out
);

reg [7:0]opcode = 8'b0000_0000;
assign CU_out = opcode;

always@(posedge clk) begin
    // IR<-MBR
    if(control_signal[4]) begin
        opcode <= MBR_in[7:0];
    end

end

endmodule