module top (
    input clk
);
    //定义各个模块的输入输出
    wire [31:0]ALU_in;
    wire [31:0]ALU_out;
    wire [31:0]MBR_in;
    wire [31:0]MBR_out;
    wire [31:0]BR_in;
    wire [31:0]ACC_in;
    wire [31:0]ACC_out;
    wire [31:0]MR_out;
    wire [31:0]DR_out;
    wire [31:0]IR_out;
    wire [31:0]PC_in;
    wire [31:0]mem_in;
    wire [31:0]mem_out;
    wire [31:0]reg_out;
    wire [31:0]control_signal;
    wire flag;


    //例化各个模块
    ACC acc(
        .clk(clk),
        .ALU_in(ALU_in),
        .ALU_out(ALU_out),
        .MBR_out(MBR_out),
        .flag(flag)
    );
    ALU alu(
        .clk(clk),
        .control_signal(control_signal),
        .BR_in(BR_in),
        .ACC_in(ACC_in),
        .ACC_out(ACC_out),
        .MR_out(MR_out),
        .DR_out(DR_out)
    );

    MBR mbr(
        .clk(clk),
        .control_signal(control_signal),
        .ACC_in(ACC_in),
        .mem_in(mem_in),
        .mem_out(mem_out),
        .reg_out(reg_out)
    );

    MAR mar(
        .clk(clk),
        .control_signal(control_signal),
        .MBR_in(MBR_in),
        .PC_in(PC_in),
        .mem_out(mem_out)
    );

    MR mr(
        .clk(clk),
        .control_signal(control_signal),
        .ALU_in(ALU_in)
    );

    DR dr(
        .clk(clk),
        .control_signal(control_signal),
        .ALU_in(ALU_in)
    );

    BR br (
        .clk(clk),
        .control_signal(control_signal),
        .MBR_in(MBR_in),
        .ALU_out(ALU_out)
    );

    IR ir(
        .clk(clk),
        .control_signal(control_signal),
        .MBR_in(MBR_in),
        .IR_out(IR_out)
    );

    PC pc(
        .clk(clk),
        .control_signal(control_signal),
        .IR_out(IR_out),
        .PC_in(PC_in)
    );

    CU cu(
        .clk(clk),
        .IR(IR_out),
        .flag(flag),
        .control_signal(control_signal)
    );
    //将各个模块的输入输出连接起来

    


endmodule