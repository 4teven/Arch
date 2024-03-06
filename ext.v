module ext(imm16,imm32,Extop);
  input [15:0]imm16;
  input [1:0]Extop;
  output [31:0]imm32;
  assign imm32=(Extop==2'b11)?{imm16,16'b0}:(Extop==2'b01)?{{16{imm16[15]}},imm16}:{16'b0,imm16};//11-lui;01-sign;00-zero;
endmodule
