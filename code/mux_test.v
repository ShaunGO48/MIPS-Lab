`timescale 1ns / 1ps

module mux_test;

	reg [15:0] Ain;
	reg [15:0] Bin;
	reg control;
	wire [15:0] mux_out;

	mux#(16) uut (
		.Ain(Ain), 
		.Bin(Bin), 
		.control(control), 
		.mux_out(mux_out)
	);

	initial begin
		Ain <= 0;
		Bin <= 0;
		control <= 0;
        #10;

	end
      
endmodule

