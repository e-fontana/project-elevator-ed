`include "movement.v"

module movement_tb;
	reg clk, led1, led2, led3;
	wire floor1, floor2, floor3, door, moving;

	always #1 clk = ~clk;

	movement MOVEMENT(clk, led1, led2, led3, floor1, floor2, floor3, door, moving);

	initial begin
		#1 clk = 0;
		step(0,0,0);
		step(0,0,1);
		step(0,1,0);
		step(0,1,1);
		step(1,0,0);
		step(1,0,1);
		step(1,1,0);
		step(1,1,1);
		#2 $finish;
	end

	task step(input l1, l2, l3); begin
		#1 begin
			led1 = l1;
			led2 = l2;
			led3 = l3;
		end
		#1 $strobe("time:%b,clk:%b,leds:%b%b%b,floor:%b%b%b,door:%b,moving:%b", $time, clk, led1, led2, led3, floor1, floor2, floor3, door, moving);
	end endtask
endmodule