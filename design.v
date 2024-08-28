module TOP (
		// ENTRADAS

		// clocks
		clk_50, clk,
		// botoes
		button1, button2, button3,
		// flips
		sos_flip, weight_flip, weight_flip_reset,

		// SAIDAS

		// chamadas (leds verdes)
		led1, led2, led3,
		// posicionamento (leds vermelhos)
		floor1, floor2, floor3,
		// movimentação (leds verdes)
		door, moving,
		// emergencia (leds vermelhos)
		sos_mode, weight_limit_exceeded
	);
	input clk_50, button1, button2, button3, sos_flip, weight_flip, weight_flip_reset;
	output led1, led2, led3, floor1, floor2, floor3, door, moving, sos_mode, weight_limit_exceeded, clk;

	parameter clk_freq = 1;
	frequency #(clk_freq) FREQUENCY(clk_50, clk);
	movement MOVEMENT(clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving, sos_mode, weight_limit_exceeded);
	emergency EMERGENCY(sos_flip, sos_mode, door, weight_flip, weight_flip_reset, weight_limit_exceeded);
endmodule