/*
A register file can read two registers and write in to one register. 
The RISC V register file contains total of 32 registers each of size 32-bit. 
Hence 5-bits are used to specify the register numbers that are to be read or written. 
*/

/*
Register Read: Register file always outputs the contents of the register corresponding to read register numbers specified. 
Reading a register is not dependent on any other signals.

Register Write: Register writes are controlled by a control signal RegWrite.  
Additionally the register file has a clock signal. 
The write should happen if RegWrite signal is made 1 and if there is positive edge of clock. 
*/
module Register_file (
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2,
    input regwrite,
    input clock,
    input reset
);
    // reg [31:0] read_data1;
    // reg [31:0] read_data2;
    reg [31:0] reg_memory [31:0]; // 32 memory locations each 32 bits wide

    //  When reset is triggered, we initialize the registers with some values
    // For ease of testing we only initialize the first seven registers
    always @(posedge reset)
    begin
        reg_memory[0] = 32'h0;
        reg_memory[1] = 32'h1;
        reg_memory[2] = 32'h2;
        reg_memory[3] = 32'h3;
        reg_memory[4] = 32'h4;
        reg_memory[5] = 32'h5;
        reg_memory[6] = 32'h6;

    end

    // The register file will always output the vaules corresponding to read register numbers 
    // It is independent of any other signal
    assign read_data1 = reg_memory[read_reg_num1];
    assign read_data2 = reg_memory[read_reg_num2];

    // If clock edge is positive and regwrite is 1, we write data to specified register
    always @(posedge clock)
    begin

        if (regwrite) begin
            reg_memory[write_reg] = write_data;
        end     
    end
    
endmodule