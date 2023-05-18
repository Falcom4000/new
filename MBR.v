module MBR
(
    input clk,
    input [31:0]control_signal,
    input [15:0]ACC_in,
    input [15:0]mem_in,
    output [15:0]mem_out,
    output [15:0]reg_out // MAR/PC/IR/BR均以此为输入
);

reg [15:0]buffer = 16'b0000_0000_0000_0000;
assign mem_out = buffer;
assign reg_out = buffer;

always@(posedge clk) begin
    // MBR<-ACC
    if(control_signal[19]) begin
        buffer <= ACC_in;
    end

    // MBR<-memory
    else if(control_signal[17]) begin
        buffer <= mem_in;
    end
    
end

endmodule