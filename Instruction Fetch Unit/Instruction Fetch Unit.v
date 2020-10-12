/*
The instruction fetch unit has clock and reset pins as input and 32-bit instruction code as output.
Internally the block has Instruction Memory, Program Counter(P.C) and an adder to increment counter by 4, 
on every positive clock edge.
*/

`include "Instruction memory.v"
module Instruction_Fetch_Unit(
    input clock,reset,
    output [31:0] Instruction_Code
);
reg [31:0] PC = 32'b0;  // 32-bit program counter is initialized to zero

    // Initializing the instruction memory block
    Instruction_Memory instr_mem(PC,reset,Instruction_Code);

    /*
        NOTE: Since we have only initialized 4 instructions in the memory unit,
        once P.C moves beyond 12, we will have undefined states, this can be overcome 
        by simply initializing more instructions in memory unit
    */

    always @(posedge clock, negedge reset)
    begin
        if(reset == 0)  //If reset is zero, clear the program counter
        PC <= 0;
        else
        PC<=PC+4;   // Increment program counter on positive clock edge
    end

endmodule