module alu(busA,busB,ALUctr,data_out);
  input[31:0] busA, busB;
  input[1:0] ALUctr;
  output[31:0]data_out;
  assign data_out=(ALUctr==2'b00)?busA+busB:(ALUctr==2'b01)?busA-busB:(ALUctr==2'b11)?busA|busB:busB;
endmodule