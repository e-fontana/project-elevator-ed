`include "frequency.v"
`include "movement.v"

module TOP #(parameter clk_freq = 10) (clk_50, clk, led1, led2, led3, floor1, floor2, floor3, door, moving);
	input clk_50, clk, led1, led2, led3;
	output floor1, floor2, floor3, door, moving;

	frequency #(clk_freq) FREQUENCY(clk_50, led1, led2, led3, moving, clk);
	movement MOVEMENT(clk, led1, led2, led3, floor1, floor2, floor3, door, moving);
endmodule