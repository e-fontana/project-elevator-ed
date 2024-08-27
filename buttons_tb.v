`include "buttons.v"

module buttons_tb;
	reg button1, button2, button3;
	wire led1, led2, led3;

	buttons BT(button1, button2, button3, led1, led2, led3);

	initial begin
		button1 = 1'b1;
		button2 = 1'b1;
		button3 = 1'b1;

		press_button1;
	end

	task press_button1; begin
		#0.5 button1 = ~button1;
		#0.5 button1 = ~button1;
	end endtask
endmodule