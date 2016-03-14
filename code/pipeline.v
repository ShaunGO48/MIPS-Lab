`include "definitions.vh"

module pipeline;

// size of data and instruction memory
parameter MEMSIZE=1024;

//special
wire clk,clk_a;
reg reset,run;

// wires from Fetch outputs


// wires from decode outputs


// wires from Execute outputs


// wires from Memory outputs


// wires from Write Back outputs



// clock generator
oscillator  Crystal(
    .clk(clk)
    );

// does run control and slips - use clk_a not clk
assign clk_a = clk & run;

// Fetch


// Decode
    
    
// Execute
    
    
// Memory


// Write Back

    
// sends a reset pulse at the start and puts in run mode
// must be last so runs first (Verilog uses a stack to simulate)
initial begin
    reset<=1;
    run<=0;
    #(2*`CYCLE/3) reset<=0;
    run<=1;
end
endmodule
