module dm(clk,data_in,WrEn,Addr,dout);
  input clk,WrEn;
  input [31:0]Addr;
  input[31:0]data_in;
  output reg [31:0]dout;
  reg [7:0]mem[1023:0]; // 1kb memmory
  always@(posedge clk) begin
    if(WrEn) begin
      mem[Addr[9:0]]=data_in[7:0];
      mem[Addr[9:0]+1]=data_in[15:8];
      mem[Addr[9:0]+2]=data_in[23:16];
      mem[Addr[9:0]+3]=data_in[31:24];
    end
    dout={mem[Addr[9:0]+3],mem[Addr[9:0]+2],mem[Addr[9:0]+1],mem[Addr[9:0]]};
  end
  
endmodule