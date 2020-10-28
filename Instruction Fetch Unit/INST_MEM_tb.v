`include "INST_MEM.v"

module stimulus ();
    reg [31:0] PC;
    reg RESET;
    wire [31:0]INST_CODE;

    // Instantiating instruction memory module
    INST_MEM INST_MEM_module(PC,RESET,INST_CODE);

    // Setting up waveform
    initial
    begin
        $dumpfile("INST_MEM_output_wave.vcd");
        $dumpvars(0,stimulus);
    end

    initial
    $monitor($time, " Instruction code = %h, PC = %d", INST_CODE, PC);

    // Setting test conditions
    initial
    begin
        RESET = 1'b0;
        #20 RESET = 1'b1;
        #20 PC = 32'd0;
        #20 PC = 32'd4;
        #20 PC = 32'd8;
        #20 PC = 32'd12;
    end

    // Terminating after 150 clock cycles
    initial
    #150 $finish;

endmodule