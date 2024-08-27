`include "floor_goal.v"

module goal_tb;
	reg [1:0] floor;
	reg led1, led2, led3, moving;
	wire gf;

	parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10;
	goal #(labelF1, labelF2, labelF3) goal(floor, led1, led2, led3, moving, gf);

	initial begin
		step(2'b00,1'b0,1'b0,1'b0,1'b0); // gf = xx
		step(2'b00,1'b1,1'b0,1'b0,1'b0); // gf = 00
		step(2'b01,1'b1,1'b1,1'b0,1'b1); // gf = gfanterior = 00
		step(2'b00,1'b1,1'b0,1'b0,1'b0); // gf = 00
		step(2'b10,1'b0,1'b1,1'b0,1'b0); // gf = 01
		step(2'b11,1'b1,1'b0,1'b0,1'b0); // gf = gfanterior = 01
		step(2'b11,1'b1,1'b1,1'b0,1'b0); // gf = gfanterior = 01
		step(2'b00,1'b0,1'b0,1'b1,1'b0); // gf = 10
		step(2'b01,1'b0,1'b0,1'b0,1'b1); // gf = gfanterior = 10
		step(2'b10,1'b1,1'b1,1'b0,1'b1); // gf = gfanterior = 10
		step(2'b10,1'b1,1'b0,1'b1,1'b0); // gf = 10
		step(2'b10,1'b0,1'b1,1'b1,1'b1); // gf = gfanterior = 10
	end

	task step(input [1:0] f, input l1, l2, l3, m); begin
		#1 begin
			floor = f;
			led1 = l1;
			led2 = l2;
			led3 = l3;
			moving = m;
		end
		#1 $strobe("floor:%b,led1:%b,led2:%b,led3:%b,moving:%b,gf:%b", floor, led1, led2, led3, moving, gf);
	end endtask
endmodule
