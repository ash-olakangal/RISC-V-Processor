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

module REG_FILE(
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

    reg [31:0] reg_memory [31:0]; // 32 memory locations each 32 bits wide
    integer i=0;

    //  When reset is triggered, we initialize the registers with some values
    always @(posedge reset)
    begin
        // Bear with me for now, I tried using loops, but it won't work
        // Just duct-taping this for now
         reg_memory[0] = 32'h0;
         reg_memory[1] = 32'h1;
         reg_memory[2] = 32'h2;
         reg_memory[3] = 32'h3;
         reg_memory[4] = 32'h4;
         reg_memory[5] = 32'h5;
         reg_memory[6] = 32'h6;
         reg_memory[7] = 32'h7;
         reg_memory[8] = 32'h8;
         reg_memory[9] = 32'h9;
         reg_memory[10] = 32'h10;
         reg_memory[11] = 32'h11;
         reg_memory[12] = 32'h12;
         reg_memory[13] = 32'h13;
         reg_memory[14] = 32'h14;
         reg_memory[15] = 32'h15;
         reg_memory[16] = 32'h16;
         reg_memory[17] = 32'h17;
         reg_memory[18] = 32'h18;
         reg_memory[19] = 32'h19;
         reg_memory[20] = 32'h20;
         reg_memory[21] = 32'h21;
         reg_memory[22] = 32'h22;
         reg_memory[23] = 32'h23;
         reg_memory[24] = 32'h24;
         reg_memory[25] = 32'h25;
		 reg_memory[26] = 32'h26;
         reg_memory[27] = 32'h27;
         reg_memory[28] = 32'h28;
         reg_memory[29] = 32'h29;
         reg_memory[30] = 32'h30;
         reg_memory[31] = 32'h31;

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