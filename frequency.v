module frequency #(parameter clk_freq = 50000000) (clk_50, led1, led2, led3, moving, clk);
	input clk_50, led1, led2, led3, moving;
	output reg clk;

	reg [25:0] counter;

	always @(posedge led1 or posedge led2 or posedge led3) begin
		counter <= 0;
	end
	
	always @(posedge clk_50) begin
		if (counter < clk_freq && moving) begin
			counter <= counter + 1;
			clk <= 0;
		end else begin
			counter <= 0;
			clk <= ~clk;
		end
	end
endmodule