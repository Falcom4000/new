module top (
    input clk
);
    //定义各个模块的输入输出
    wire [31:0]ALU_in;
    wire [31:0]ALU_out;
    wire [31:0]MBR_in;

    //例化各个模块
    ACC acc(
        .clk(clk),
        .ALU_in(ALU_in),
        .ALU_out(ALU_out),
        .MBR_out(MBR_out),
        .flag(flag)
    );
    ALU alu(
        
    );

    MBR mbr(
        .clk(clk),
        .MBR_in(MBR_in),
        .MBR_out(MBR_out)
    );

    MAR mar(
        .clk(clk),
        .MAR_in(MAR_in),
        .MAR_out(MAR_out)
    );

    MR mr(
        .clk(clk),
        .MR_in(MR_in),
        .MR_out(MR_out)
    );

    DR dr(
        .clk(clk),
        .DR_in(DR_in),
        .DR_out(DR_out)
    );

    BR br (
        .clk(clk),
        .flag(flag),
        .PC_in(PC_in),
        .PC_out(PC_out)
    );

    IR ir(
        .clk(clk),
        .IR_in(IR_in),
        .IR_out(IR_out)
    );

    PC pc(
        .clk(clk),
        .PC_in(PC_in),
        .PC_out(PC_out)
    );

    CU cu(
        .clk(clk),
        .IR(IR_out),
        .flag(flag),
        .control_signal(control_signal)
    );


endmodule