module comparator(busa,busb,npc_selD,PCSrcD,zero);
  input[31:0]busa,busb;
  input npc_selD;
  output PCSrcD,zero;
  
  assign zero=(busa==busb)?1:0;
  assign PCSrcD=((zero)&&npc_selD)?1:0;//branch condition(pass back to mux in IF)
  
endmodule
