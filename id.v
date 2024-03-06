module id(instr,opcode,rs,rt,rd,shamt,funct,imm,j_imm);
  input [31:0]instr;
  output [5:0]opcode,funct;
  output [4:0] rs,rt,rd,shamt;
  output [15:0] imm;
  output [25:0] j_imm;
  assign opcode=instr[31:26];
  assign funct=instr[5:0];
  assign rs=instr[25:21];
  assign rt=instr[20:16];
  assign rd=instr[15:11];
  assign imm=instr[15:0];
  assign j_imm=instr[25:0];
endmodule