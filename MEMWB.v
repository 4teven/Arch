module MEMWB(input clk,
input RegWriteM,input MemtoRegM,input[31:0]data_out,
input[31:0]AluoutM,input[4:0] rwM,
output reg RegWriteW, output reg MemtoRegW, output reg[31:0]data_outW,
output reg[31:0]AluoutW,output reg[4:0]rwW
);
always@(posedge clk)begin
  RegWriteW=RegWriteM;
  MemtoRegW=MemtoRegM;
  data_outW=data_out;
  AluoutW=AluoutM;
  rwW=rwM;
end
endmodule