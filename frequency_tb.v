`include "frequency.v"

module frequency_tb;
    reg clk_50, button1, button2, button3, moving;
    wire clk;

    parameter clk_frequency = 10;
    frequency #(clk_frequency) FREQUENCY(clk_50, button1, button2, button3, moving, clk);

    always #1 clk_50 <= ~clk_50;

	initial begin
        clk_50 = 1'b0;
        button1 = 1'b1;
        button2 = 1'b1;
        button3 = 1'b1;
        moving = 1'b0;
        
        #10 press_button1;
        #20 moving = 1'b1;
        #25 press_button2;
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