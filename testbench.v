module testbench;
	reg clk_50, button1, button2, button3, sos_flip, weight_flip, weight_flip_reset;
	wire clk, led1, led2, led3, floor1, floor2, floor3, door, moving, sos_mode, weight_limit_exceeded;
	
	integer i = 0;

	always #1 clk_50 <= ~clk_50;
	always #1 $strobe("led1:%b,led2:%b,led3:%b,floor1:%b,floor2:%b,floor3:%b,door:%b,sos_mode:%b,weight_limit_exceeded:%b", led1, led2, led3, floor1, floor2, floor3, door, sos_mode, weight_limit_exceeded);

	TOP TOP(clk_50, clk, button1, button2, button3, sos_flip, weight_flip, weight_flip_reset, led1, led2, led3, floor1, floor2, floor3, door, moving, sos_mode, weight_limit_exceeded);

	initial begin
		clk_50 = 1'b0;
		button1 = 1'b1;
		button2 = 1'b1;
		button3 = 1'b1;
		sos_flip = 1'b0;
		weight_flip = 1'b0;
		weight_flip_reset = 1'b0;

		#40 press_button3;
		#40 press_button2;
		#40 press_button1;
	
		#1000 $finish;
	end

	task reset_weight; begin
		#1 weight_flip_reset = ~weight_flip_reset;
		#1 weight_flip_reset = ~weight_flip_reset;
	end endtask

	task increase_people; begin
		#1 weight_flip = ~weight_flip;
		#1 weight_flip = ~weight_flip;
	end endtask

	task toggle_sos; begin
		#5 sos_flip = ~sos_flip;
	end endtask

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