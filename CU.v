module control_unit (
    input clk,
    input [7:0]IR,
    input flag,
    output reg [31:0]control_signal
);
    reg [31:0]control_memory [55:0];
    reg [5:0] CAR;
    reg [5:0] CBR;
    initial begin
        control_signal <= 0;
        CAR <= 0;
        CBR <= 0;
        control_memory[0] <=32'b00000000000000000000000000001001;
        control_memory[1] <=32'b00000000000000000000000000010001;
        control_memory[2] <=32'b00000000001000000000000000000010;
        control_memory[3] <=32'b00000000000000000000000001100001;
        control_memory[4] <=32'b00000000000000000000000000001001;
        control_memory[5] <=32'b00000000000000000000000110000001;
        control_memory[6] <=32'b00000000000000000000001000000001;
        control_memory[7] <=32'b00000000000000000000010000000100;
        control_memory[8] <=32'b00000000000000000000000001100001;
        control_memory[9] <=32'b00000000000010000000000000000001;
        control_memory[10] <=32'b00000000000000000000000000001001;
        control_memory[11] <=32'b00000000000000000000010000000100;
        control_memory[12] <=32'b00000000000000000000000001100001;
        control_memory[13] <=32'b00000000000000000000000000001001;
        control_memory[14] <=32'b00000000000000000000000010000001;
        control_memory[15] <=32'b00000000000000000000001000000001;
        control_memory[16] <=32'b00000000000000000000010000000100;
        control_memory[17] <=32'b00000000000000000000000001100001;
        control_memory[18] <=32'b00000000000000000000000000001001;
        control_memory[19] <=32'b00000000000000000000000010000001;
        control_memory[20] <=32'b00000000000000000000100000000001;
        control_memory[21] <=32'b00000000000000000000010000000100;
        control_memory[22] <=32'b00000000000000000000000001100001;
        control_memory[23] <=32'b00000000000000000000000000001001;
        control_memory[24] <=32'b00000000000000000000000010000001;
        control_memory[25] <=32'b00000000000000000001000000000001;
        control_memory[26] <=32'b00000000000000000000010000000100;
        control_memory[27] <=32'b00000000000000000000000001100001;
        control_memory[28] <=32'b00000000000000000000000000001001;
        control_memory[29] <=32'b00000000000000000000000010000001;
        control_memory[30] <=32'b00000000000000000010000000000001;
        control_memory[31] <=32'b00000000000000000000010000000100;
        control_memory[32] <=32'b00000000000000000000000001000001;
        control_memory[33] <=32'b00000000000000000100000000000001;
        control_memory[34] <=32'b00000000000000000000010000000100;
        control_memory[35] <=32'b00000000000000000000000001000001;
        control_memory[36] <=32'b00000000000000001000000000000001;
        control_memory[37] <=32'b00000000000000000000010000000100;
        control_memory[38] <=32'b00000000000000000000000001000001;
        control_memory[39] <=32'b00000000000000010000000000000001;
        control_memory[40] <=32'b00000000000000000000010000000100;
        control_memory[41] <=32'b00000000000000000000000001100001;
        control_memory[42] <=32'b00000000000000000000000000001001;
        control_memory[43] <=32'b00000000000000000000000010000001;
        control_memory[44] <=32'b00000000010000000000000000000001;
        control_memory[45] <=32'b00000000000000000000010000000100;
        control_memory[46] <=32'b00000000000000000000000001100001;
        control_memory[47] <=32'b00000000000000000000010000000100;
        control_memory[48] <=32'b00000000000000000000000001100001;
    end
    always @(posedge clk) begin
        /*
        1. CAR查control_memory，得到control_signal
        2. 根据control_signal、flag和CAR，更新CBR
        3. CAR <= CBR   
        */
        CAR <= CBR;
        control_signal <= control_memory[CAR];
        if(CAR == 48)begin
            if(flag == 1)begin
                CBR <= 50;
            end
            else begin
                CBR <= 49;
            end
        end
        else begin
                if(control_signal[0] == 1)begin
                    CBR <= CAR +1;
                end
                else if(control_signal[1] == 1)begin
                    case (IR)
                        8'b0000_0001:  CBR<=8;//STORE
                        8'b0000_0010:  CBR<=3;//LOAD
                        8'b0000_0011:  CBR<=12;//ADD
                        8'b0000_0100:  CBR<=17;//SUB
                        8'b0000_0101:  CBR<=48;//JMPGEZ
                        8'b0000_0110:  CBR<=46;//JMP
                        8'b0000_0111:  CBR<=56;//HALT
                        8'b0000_1000:  CBR<=43;// MPY
                        8'b0000_1001:  CBR<=53;// DIV
                        8'b0000_1010:  CBR<=24;// AND
                        8'b0000_1011:  CBR<=29;// OR
                        8'b0000_1100:  CBR<=34;// NOT
                        8'b0000_1101:  CBR<=37;// SHL
                        8'b0000_1110:  CBR<=40;// SHR
                        default: CBR<=0;
                    endcase
                end
                else if(control_signal[2] == 1)begin
                    CBR <= 0;
                end
            end
        
    end
    
    
endmodule