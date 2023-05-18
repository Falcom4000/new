module MR
(
    input clk,
    input [31:0]control_signal,
    input [15:0]ALU_in,
);

reg [15:0]buffer = 8'b0000_0000;

always@(posedge clk) begin
    // MR <- ALU
    if(control_signal[22]) begin
        buffer <= ALU_in;
    end

end

endmodule
