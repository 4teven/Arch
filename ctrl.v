module ctrl(instruction,RegDst,RegWr,AluSrc,MemWr,Memtoreg,Aluctr,nPC_sel,ExtOp,j_sel);
  input [31:0]instruction;
  output RegDst, RegWr,AluSrc,MemWr,Memtoreg,nPC_sel;
  output[1:0]ExtOp;
  output [1:0]Aluctr;
  output j_sel;
  wire[5:0] opcode,funct;
  assign opcode=instruction[31:26];
  assign funct=instruction[5:0];
  wire addu,subu,ori,lw,sw,beq,rtype,lui,j;
  
  assign beq=(opcode==6'b000100);
  assign rtype=(opcode==6'b0);
  assign addu=rtype&&(funct==6'b100001);
  assign subu=rtype&&(funct==6'b100011);
  assign ori=(opcode==6'b001101);
  assign lw=(opcode==6'b100011);
  assign sw=(opcode==6'b101011);
  assign beq=(opcode==6'b000100);
  assign lui=(opcode==6'b001111);
  assign j=(opcode==6'b000010);
  
  assign RegDst=addu||subu;
  assign AluSrc=ori||lw||sw||lui;
  assign Memtoreg=lw;
  assign RegWr=addu||subu||ori||lw||lui;
  assign MemWr=sw;
  assign nPC_sel=beq;
  assign j_sel=j;
  assign ExtOp=(lw||sw)?2'b01:(lui)?2'b11:2'b00;
  assign Aluctr=(addu||sw||lw)?2'b00:(subu||beq)?2'b01:(ori)?2'b11:2'b10;//ori
endmodule