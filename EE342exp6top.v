
module EE342exp6top(Clk, tDin, Cntr);
input Clk; 
input [1:0] tDin;
output [2:0] Cntr;


EE342exp6FSM FSM1(.Clk(Clk), .Din(tDin), .Cntr(Cntr));

endmodule 