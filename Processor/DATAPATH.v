`include "REG_FILE.v"
`include "ALU.v"

module DATAPATH(
    input [4:0]read_reg_num1,
    input [4:0]read_reg_num2,
    input [4:0]write_reg,
    input [3:0]alu_control,
    input regwrite,
    input clock,
    input reset,
    output zero_flag
);

    // Declaring internal wires that carry data
    wire [31:0]read_data1;
    wire [31:0]read_data2;
    wire [31:0]write_data;

    // Instantiating the register file
    REG_FILE reg_file_module(
    read_reg_num1,
    read_reg_num2,
    write_reg,
    write_data,
    read_data1,
    read_data2,
    regwrite,
    clock,
    reset
    );

    // Instanting ALU
    ALU alu_module(read_data1, read_data2, alu_control, write_data, zero_flag);
	 
endmodule