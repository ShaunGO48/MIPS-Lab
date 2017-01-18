`include "definitions.vh"

module iExecute(
    input clk,
    input reset,
    input [`WORD-1:0] n_PCin,
    input [`WORD-1:0] A,
    input [`WORD-1:0] B,
    input [`WORD-1:0] SE,
    input [4:0] RT,
    input [4:0] RD,
    input [1:0] ALUOp,
    input ALUSrc,
    input RegDst,
    input Branch_in,
    input MemRead_in,
    input MemWrite_in,
    input RegWrite_in,
    input MemtoReg_in,
    output [`WORD-1:0] Branch_Target,
    output [`WORD-1:0] Result,
    output [`WORD-1:0] MemWriteData,
    output [4:0] RegDstAddress,
    output zero,
    output Branch_out,
    output MemRead_out,
    output MemWrite_out,
    output RegWrite_out,
    output MemtoReg_out
    );
    wire [`WORD-1:0] Data2;
    wire [3:0] ALUoperation;
    wire [`WORD-1:0] Branch_Target_nb;
    wire [`WORD-1:0] Result_nb;
    wire [4:0] RegDstAddress_nb;
    wire zero_nb;

    
mux#(`WORD) alu_mux(
    .Ain(),
    .Bin(),
    .control(),
    .mux_out()
    );

adder branch_target_calculator(
    .Ain(),
    .Bin(),
    .add_out()
    );

ALU myALU(
    .A(),
    .B(),
    .ALU_control(),
    .ALUresult(),
    .zero()
    );
    
ALU_control ALUcont(
    .ALUOp(),
    .funct(),
    .ALU_control()
    );
    
mux#(5) RegDstMux(
    .Ain(),
    .Bin(),
    .control(),
    .mux_out()
    );
    
buffer_exmem BufEXMEM(
    .clk(clk), 
    .reset(reset),
    .Branch_Target_in(Branch_Target_nb),
    .Result_in(Result_nb),
    .MemWriteData_in(B),
    .RegDstAddress_in(RegDstAddress_nb),
    .zero_in(zero_nb),
    .Branch_in(Branch_in), 
    .MemRead_in(MemRead_in), 
    .MemWrite_in(MemWrite_in), 
    .MemtoReg_in(MemtoReg_in), 
    .RegWrite_in(RegWrite_in),
    .Branch_Target_out(Branch_Target),
    .Result_out(Result),
    .MemWriteData_out(MemWriteData),
    .RegDstAddress_out(RegDstAddress),
    .zero_out(zero),
    .Branch_out(Branch_out), 
    .MemRead_out(MemRead_out), 
    .MemWrite_out(MemWrite_out), 
    .MemtoReg_out(MemtoReg_out), 
    .RegWrite_out(RegWrite_out)
);

endmodule
