module ifu(clk,reset,insout,pcnew,ifu_imm,pcplus4F,StallF,zero,nPC_sel,j_sel);
      input clk,reset,zero,nPC_sel,StallF,j_sel;
      input [31:0]pcnew;
      output [15:0]ifu_imm;
       output [31:0]insout;
       output [31:0]pcplus4F;
       reg [31:0]pc;
       reg[7:0] im[1023:0];
       wire [31:0]pcnext;
       assign pcnext=(((nPC_sel&zero)|j_sel)===1)?pcnew:pcplus4F;
       assign insout={im[pc[9:0]],im[pc[9:0]+1],im[pc[9:0]+2],im[pc[9:0]+3]};
       assign ifu_imm=insout[15:0];

       always@(posedge clk, posedge reset)
       begin
         if(reset) 
           pc = 32'h0000_3000;
         else if(StallF!==1) 
           pc=pcnext;//No hold
       end
       assign pcplus4F=pc+4;
     endmodule
     
     
       
