module hazard(rst,RegWriteW,RegWriteM,rwW,rwM,ForwardAE,ForwardBE,rsE,rtE,StallF,StallD,npc_selD,ForwardAD,ForwardBD,rsD,rtD,FlushE,rwE,MemtoRegE,RegWriteE,MemtoRegM);
  input wire rst,RegWriteW,RegWriteM,npc_selD,MemtoRegE,RegWriteE,MemtoRegM;
  input wire[4:0]rsE,rtE,rwW,rwM,rsD,rtD,rwE;
  output wire StallF,StallD,FlushE;
  output wire ForwardAD,ForwardBD;
  output reg[1:0] ForwardAE,ForwardBE;
  wire branchstall,lwstall;
  always@(*)begin
    if((rsE!=0)&&rsE==rwM&&RegWriteM)begin
      ForwardAE=2'b10;
    end
    else if((rsE!=0)&&rsE==rwW&&RegWriteW)begin
      ForwardAE=2'b01;
    end
    else begin
      ForwardAE=2'b00;
    end
    if((rtE!=0)&&rtE==rwM&&RegWriteM)begin
      ForwardBE=2'b10;
    end
    else if((rtE!=0)&&rtE==rwW&&RegWriteW)begin
      ForwardBE=2'b01;
    end
    else begin
      ForwardBE=2'b00;
    end    
  end

  
assign ForwardAD=((rsD!=0)&&(rsD==rwM)&&RegWriteM);
assign ForwardBD=((rtD!=0)&&(rtD==rwM)&&RegWriteM);//RAW data hazard

assign lwstall=(((rsD==rtE)||(rtD==rtE))&&MemtoRegE); // as rt(destination) match decode stage's source, stall it until updated

assign StallF=lwstall||branchstall;
assign StallD=lwstall||branchstall;
assign FlushE=lwstall||branchstall;//IDEX flush

assign  branchstall=(npc_selD&&RegWriteE&&(rwE==rsD||rwE==rtD))||(MemtoRegM&&(rwM==rsD||rwM==rtD));//branch at either alu or lw(memory stage?
endmodule
