module mips_test;
  reg clk, rst;
  mips_top m1(clk,rst);
 
  initial begin
    clk=1;
    rst=0;
    #1 rst=1;
    #1 rst=0;
    #1 $readmemh( "pipeline3.txt", m1.ifu.im);
  end
    
  
  always #100 clk = ~clk;
endmodule