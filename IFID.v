module IFID(clr,de,clk,instr,imm_ifu,imm_ifuD,pcplus4F,pcplus4D,instrD);
  input clk,clr,de;
  input [31:0]instr;
  input [15:0] imm_ifu;
  input [31:0] pcplus4F;
  output reg[31:0] pcplus4D;
  output reg[31:0] instrD;
  output reg [15:0] imm_ifuD;
  always @(posedge clk)begin
  if(clr)begin//PCSrcD
    instrD=0;
    imm_ifuD=0;
    pcplus4D=0;
end 
else if(de)begin//stallD-hold value
    instrD=instrD;
    imm_ifuD=imm_ifuD;
    pcplus4D=pcplus4D;
  end
  else begin
    instrD=instr;
    imm_ifuD=imm_ifu;
    pcplus4D=pcplus4F;
    
  end
  
  
  end
endmodule 
