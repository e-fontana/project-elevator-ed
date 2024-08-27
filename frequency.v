module frequency #(parameter clk_freq = 50000000) (clk_50, button1, button2, button3, moving, clk);
	input clk_50, button1, button2, button3, moving;
	output reg clk;

	reg [25:0] counter = 1'b0;

	always @(negedge button1 or negedge button2 or negedge button3) begin
		if (~moving) counter <= 0;
	end
	
	always @(posedge clk_50) begin
		if (counter < clk_freq && moving) begin
			counter <= counter + 1;
			clk <= 1'b0;
		end else begin
			counter <= 0;
			clk <= ~clk;
		end
	end
endmodule