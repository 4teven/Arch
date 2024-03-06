module PCnext(PCSrcD,j_sel,t1,pcplus4D,pcnew);
  input j_sel;
  input PCSrcD;
  input [31:0]t1,pcplus4D;
  output [31:0]pcnew;
  assign pcnew=(PCSrcD||j_sel)?t1:pcplus4D;
endmodule
