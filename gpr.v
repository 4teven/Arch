module gpr(clk,reset,busw,we,rw,ra,rb,busa,busb,RegWriteM,Alu_outM,rwM);
  input clk,reset,we,RegWriteM;
  input [31:0] busw,Alu_outM;
  input [4:0] rw,ra,rb,rwM;
  output [31:0] busa, busb;
  reg [31:0] regfile[31:0];
  integer i;
  assign busa=(we&&rw===ra)?busw:(RegWriteM&&ra===rwM)?Alu_outM:regfile[ra];//  assign busa=(we&&rw===ra)?busw:regfile[ra];
  assign busb=(we&&rw===rb)?busw:(RegWriteM&&rb===rwM)?Alu_outM:regfile[rb];// assign busb=(we&&rw===rb)?busw:regfile[rb];
  
  always@(negedge clk,posedge reset)
   begin 
     if(reset) 
       for(i=0;i<32;i=i+1) 
         regfile[i]=0;
      if(we&&(rw!=0)) 
        regfile[rw] = busw;
    end
  endmodule
  
