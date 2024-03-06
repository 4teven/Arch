module IDEX(input clr, input clk,
input RegWriteD,input MemtoRegD,input MemWriteD,
input [1:0]AluCtrD,input AluSrcD,
input RegDstD,input [31:0]busaD, input[31:0]busbD,
input [4:0]rd, input [4:0] rt,
input [31:0]signD, input[31:0] pcplus4D,
input[4:0]rs,
output reg RegWriteE,output reg MemtoRegE,output reg MemWriteE,
output reg [1:0]AluCtrE,output reg AluSrcE,
output reg RegDstE, output reg [31:0]busaE, output reg[31:0]busbE, 
output reg [4:0]rdE, output reg [4:0]rtE,
output reg [31:0]signE, output reg[31:0] pcplus4E,
output reg[4:0]rsE);

  always @(posedge clk)begin 
    if(clr) begin//flushE
      RegWriteE=0;
      MemtoRegE=0;
      AluCtrE=0;
      AluSrcE=0;
      RegDstE=0;
      busaE=0;
      busbE=0;
      MemWriteE=0;
      rdE=0;
      rtE=0;
      signE=0;
      pcplus4E=0;
      rsE=0;
    end
  else begin
    RegWriteE=RegWriteD;
    MemtoRegE=MemtoRegD;
    AluCtrE=AluCtrD;
    AluSrcE=AluSrcD;
    RegDstE=RegDstD;
    busaE=busaD;
    busbE=busbD;
    MemWriteE=MemWriteD;
    rdE=rd;
    rtE=rt;
    signE=signD;
    pcplus4E=pcplus4D;
    rsE=rs;
  end
  end
endmodule 