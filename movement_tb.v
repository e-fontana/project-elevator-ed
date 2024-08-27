`include "movement.v"

module movement_tb;
	reg clk, button1, button2, button3;
	wire led1, led2, led3, floor1, floor2, floor3, door, moving;

	always #1 clk = ~clk;

	movement MOVEMENT(clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving);

	initial begin
		clk = 1'b0;
		button1 = 1'b1;
		button2 = 1'b1;
		button3 = 1'b1;

		#5 press_button2;
		#5 $finish;
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