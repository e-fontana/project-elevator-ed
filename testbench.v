`include "design.v"

module testbench;
	reg clk_50, clk, led1, led2, led3;
	wire floor1, floor2, floor3, door, moving;

	always #1 clk_50 <= ~clk_50;

	parameter clk_freq = 3;
	TOP #(clk_freq) TOP(clk_50, clk, led1, led2, led3, floor1, floor2, floor3, door, moving);

	initial begin
		clk_50 = 0;
		clk = 0;
		step(0,0,1);
		#2 $finish;
	end

	task step(input l1, l2, l3); begin
		#(clk_freq) begin
			led1 = l1;
			led2 = l2;
			led3 = l3;
		end
		#(clk_freq) $strobe("time:%b,clk:%b,leds:%b%b%b,floor:%b%b%b,door:%b,moving:%b", $time, clk, led1, led2, led3, floor1, floor2, floor3, door, moving);
	end endtask
endmodule