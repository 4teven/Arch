module mux(a,b,sel,c);
  input [31:0] a, b;
  input sel;
  output [31:0] c;
  assign c=(sel)?a:b;
endmodule


