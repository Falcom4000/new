module BR
(
   input clk,
   input [31:0]control_signal,
   input [15:0]MBR_in,
   output [15:0]ALU_out
);

reg [15:0]buffer = 16'b0000_0000_0000_0000;
assign ALU_out = buffer;

always@(posedge clk) begin
    // BR<-MBR
    if(control_signal[7]) begin
        buffer <= MBR_in;
    end

end

endmodule