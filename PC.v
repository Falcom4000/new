module PC
(
    input clk,
    input [31:0]control_signal,
    input [15:0]MBR_in,
    output [7:0]MAR_out
);

reg [7:0]address = 8'b0000_0000;
assign MAR_out = address;

always@(posedge clk) begin
    // PC<-MBR 用于立即数寻址
    if(control_signal[20]) begin
        address <= MBR_in[7:0];
    end

    // PC自增
    else if(control_signal[6]) begin
        address <= address+1;
    end
    
end

endmodule