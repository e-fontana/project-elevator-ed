module frequency #(parameter clk_freq = 50000000) (clk_50, clk);
	input clk_50;
	output reg clk = 1'b0;

	reg [31:0] counter = 0;
	
	always @(posedge clk_50) begin
		if (counter < clk_freq - 1) begin
			counter <= counter + 1;
			clk <= 1'b0;
		end else begin
			counter <= 0;
			clk <= ~clk;
		end
	end
endmodule