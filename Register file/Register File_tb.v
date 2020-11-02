`include "REG_FILE.v"

module stimulus ();
    reg [4:0] read_reg_num1;
    reg [4:0] read_reg_num2;
    reg [4:0] write_reg;
    reg [31:0] write_data;
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    reg regwrite;
    reg clock;
    reg reset;
    

    // Instantiating register file module
    REG_FILE REG_FILE_module(
    read_reg_num1,
    read_reg_num2,
    write_reg,
    write_data,
    read_data1,
    read_data2,
    regwrite,
    clock,
    reset);

    // Setting up output waveform
    initial begin
        $dumpfile("output_wave.vcd");
        $dumpvars(0, stimulus);
    end

    // Initializing the registers
    initial begin
        reset = 1;
        #10 reset = 0;
    end

    // Writing values to different registers
    initial begin
        regwrite = 0;
        #10
        regwrite = 1; write_data = 20; write_reg = 0;
        #10
        regwrite = 1; write_data = 30; write_reg = 1;
        #10
        regwrite = 1; write_data = 30; write_reg = 1;
        #10;
    end

    // Reading values of different registers
    initial begin
        
        #10 read_reg_num1 = 0; read_reg_num2 = 0;
        #10 read_reg_num1 = 0; read_reg_num2 = 1;
        #10 read_reg_num1 = 0; read_reg_num2 = 1;
        #10 read_reg_num1 = 1; read_reg_num2 = 2;
    
    end

    // Setting up clock
    initial begin
        
        clock = 0;
        forever #10 clock = ~clock;

    end

    initial begin
        #200 $finish;
    end

endmodule
