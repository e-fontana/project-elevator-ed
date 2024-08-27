module door_frequency #(parameter clk_freq = 50000000) (clk, movement_handler, half_clk);
	input clk, movement_handler;
	output reg half_clk = 1'b0;

	reg [25:0] counter = 0;

	always @(posedge clk) begin
		if (counter < clk_freq / 2 && movement_handler) begin
			counter <= counter + 1;
			half_clk <= 1'b0;
		end else begin
			counter <= 0;
			half_clk <= ~half_clk;
		end
	end
endmodule
