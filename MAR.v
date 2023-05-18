module MAR
(
   input clk,
   input [31:0]control_signal,
   input [15:0]MBR_in,
   input [7:0]PC_in,
   output [7:0]mem_out
);

reg [7:0]buffer = 8'b0000_0000;
assign mem_out = buffer;

always@(posedge clk) begin
    // MAR<-MBR
    if(control_signal[5]) begin
        buffer <= MBR_in[7:0];
    end

    // MAR<-PC
    else if(control_signal[10]) begin
        buffer <= PC_in;
    end

end

endmodule
