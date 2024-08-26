module frequency #(parameter clk_freq = 50000000) (clk_50, led1, led2, led3, clk);
	input clk_50, led1, led2, led3;
	output reg clk;

	reg auth = 1'b0;
	reg [25:0] counter;

	always @(posedge led1 or posedge led2 or posedge led3) begin
		auth <= 1'b1;
		counter <= 0;
	end
	
	always @(posedge clk_50) begin
		if (counter < clk_freq && auth) begin
			counter <= counter + 1;
			clk <= 0;
		end else begin
			auth = 1'b0;
			counter <= 0;
			clk <= ~clk;
		end
	end
endmodule