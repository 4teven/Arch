module mux_5(a,b,sel,c);
  input [4:0] a, b;
  input sel;
  output [4:0] c;
  assign c=(sel)?a:b;
endmodule


