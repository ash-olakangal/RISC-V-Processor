module CONTROL(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_control,
    output reg regwrite_control
);
    always @(funct3 or funct7 or opcode)
    begin
        if (opcode == 7'b0110011) begin // R-type instructions

            regwrite_control = 1;

            case (funct3)
                0: begin
                    if(funct7 == 0)
                    alu_control = 4'b0010; // ADD
                    else if(funct7 == 32)
                    alu_control = 4'b0100; // SUB
                end
                6: alu_control = 4'b0001; // OR
                7: alu_control = 4'b0000; // AND
                1: alu_control = 4'b0011; // SLL
                5: alu_control = 4'b0101; // SRL
				2: alu_control = 4'b0110; // MUL
				4: alu_control = 4'b0111; // XOR
            endcase

      end

    end

endmodule