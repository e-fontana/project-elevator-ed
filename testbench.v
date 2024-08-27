`include "design.v"

module testbench;
	reg clk_50, clk, button1, button2, button3;
	wire led1, led2, led3, floor1, floor2, floor3, door, moving;

	always #1 clk_50 <= ~clk_50;

	TOP TOP(clk_50, clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving);

	initial begin
		clk_50 = 1'b0;
		clk = 1'b0;
		button1 = 1'b1;
		button2 = 1'b1;
		button3 = 1'b1;

		#15 press_button3;
		#4 press_button1;
		#4 press_button2;
	end

	task press_button1; begin
		#0.5 button1 = ~button1;
		#0.5 button1 = ~button1;
	end endtask

	task press_button2; begin
		#0.5 button2 = ~button2;
		#0.5 button2 = ~button2;
	end endtask

	task press_button3; begin
		#0.5 button3 = ~button3;
		#0.5 button3 = ~button3;
	end endtask
endmodule