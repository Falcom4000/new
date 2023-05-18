module ALU
(
    input clk,
    input [31:0]control_signal,
    input [15:0]BR_in,
    input [15:0]ACC_in,
    output [15:0]ACC_out,
    output [15:0]MR_out,
    output [15:0]DR_out
);

reg [31:0]buffer = 32'd0;
reg [15:0]re_buffer; // 存余数
assign ACC_out = buffer[15:0];
assign MR_out = buffer[31:16];

always@(posedge clk) begin
    // 清零
    if(control_signal[8]) begin
        buffer <= 32'd0;
    end

    // 加
    if(control_signal[9]) begin
        buffer[15:0] <= ACC_in + BR_in;
    end

    // 减
    if(control_signal[9]) begin
        buffer[15:0] <= ACC_in - BR_in;
    end

    // 与
    if(control_signal[9]) begin
        buffer[15:0] <= ACC_in & BR_in;
    end

    // 或
    if(control_signal[10]) begin
        buffer[15:0] <= ACC_in | BR_in;
    end

    // 非
    if(control_signal[10]) begin
        buffer[15:0] <= ~ ACC_in;
    end

    // 逻辑左移
    if(control_signal[10]) begin
        buffer[15:0] <= ACC_in << 1;
    end

    // 逻辑右移
    if(control_signal[10]) begin
        buffer[15:0] <= ACC_in >> 1;
    end

    // 乘
    if(control_signal[22]) begin
        buffer <= ACC_in * BR_in;
    end

    // 除
    if(control_signal[23]) begin
        buffer[15:0] <= ACC_in / BR_in;
        re_buffer <= ACC_in % BR_in;
    end

end

endmodule