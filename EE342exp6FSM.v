 
module EE342exp6FSM(Clk, Din, Cntr);
input Clk;
input [1:0] Din;


output reg [2:0] Cntr; // Counter to Count # of Cars
reg [3:0] State; // Stored Din values
parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0011, S3 = 4'b0010, S4 = 4'b0100,
		  S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111, S8 = 4'b1000;


always@(posedge Clk)
begin				
	case(State[2:0])
		S0:
			if(Din[1:0] == 2'b00)
				State <= S0;
			else if(Din[1:0] == 2'b10)
				State <= S1;
			else if(Din[1:0] == 2'b01)
				State <= S5;
		S1:
			if(Din[1:0] == 2'b10)
				State <= S1;
			else if(Din[1:0] == 2'b11)
				State <= S2;
			else if(Din[1:0] == 2'b00)
				State <= S0;
		S2:
			if(Din[1:0] == 2'b11)
				State <= S2;
			else if(Din[1:0] == 2'b01)
				State <= S3;
			else if(Din[1:0] == 2'b10)
				State <= S1;
		S3:
			if(Din[1:0] == 2'b01)
				State <= S3;
			else if(Din[1:0] == 2'b00)
				State <= S4;
			else if(Din[1:0] == 2'b11)
				State <= S2;
		S4:
				State <= S0;
		S5:
			if(Din[1:0] == 2'b01)
				State <= S5;
			else if(Din[1:0] == 2'b00)
				State <= S0;
			else if(Din[1:0] == 2'b11)
				State <= S6;
		S6:
			if(Din[1:0] == 2'b11)
				State <= S6;
			else if(Din[1:0] == 2'b01)
				State <= S5;
			else if(Din[1:0] == 2'b10)
				State <= S7;
		S7:
			if(Din[1:0] == 2'b10)
				State <= S7;
			else if(Din[1:0] == 2'b11)
				State <= S6;
			else if(Din[1:0] == 2'b00)
				State <= S8;
		S8:
			State <= S0;
	endcase
end
		
always @(posedge Clk) // combinational logic to increment counter when DirState is S4
begin
	case(State)
		S0: Cntr[2:0] <= Cntr[2:0];
		S1: Cntr[2:0] <= Cntr[2:0];
		S2: Cntr[2:0] <= Cntr[2:0];
		S3: Cntr[2:0] <= Cntr[2:0];
		S4: Cntr[2:0] <= Cntr[2:0] + 3'd1;
		S5: Cntr[2:0] <= Cntr[2:0];
		S6: Cntr[2:0] <= Cntr[2:0];
		S7: Cntr[2:0] <= Cntr[2:0];
		S8: Cntr[2:0] <= Cntr[2:0] - 3'd1;		
	endcase
end
			

endmodule 