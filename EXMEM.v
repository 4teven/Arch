module EXMEM(input clk,
input RegWriteE,input MemtoRegE,input MemWriteE,
input [31:0] busbE, input[31:0]Alu_out, input [4:0]rw,

output reg RegWriteM,output reg MemtoRegM,output reg MemWriteM,
output reg[31:0] busbM,output reg [31:0]Alu_outM, output reg[4:0]rwM);

  always @(posedge clk)begin 
    RegWriteM=RegWriteE;
    MemtoRegM=MemtoRegE;
    MemWriteM=MemWriteE;
    busbM=busbE;
    Alu_outM=Alu_out;
    rwM=rw;
  end
endmodule 