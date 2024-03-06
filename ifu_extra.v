module ifu_extra(pcplus4D,imm_ifu,j_imm,j_sel,t1);
  input [31:0]pcplus4D;
  input [15:0]imm_ifu;
  input [25:0] j_imm;
  input j_sel;
  output [31:0]t1;
  wire [31:0] temp;
  wire [31:0] extout;
  assign temp={{16{imm_ifu[15]}},imm_ifu};
  assign extout=(j_sel===0)?temp<<2:{pcplus4D[31:28],j_imm,2'b00};//J
  assign t1=(j_sel===0)?pcplus4D+extout:extout;
endmodule
