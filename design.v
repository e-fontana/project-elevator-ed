`include "frequency.v"
`include "movement.v"


module TOP #(parameter clk_freq = 10) (clk_50, clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving);
	input clk_50, clk, button1, button2, button3;
	output led1, led2, led3, floor1, floor2, floor3, door, moving;

	frequency #(clk_freq) FREQUENCY(clk_50, button1, button2, button3, moving, clk);
	movement MOVEMENT(clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving);
endmodule