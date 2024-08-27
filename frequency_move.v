module frequency_move #(parameter move_time = 10) (clk, button1, button2, button3, moving, move_clk);
	input clk, button1, button2, button3, moving;
	output reg move_clk;

	reg [25:0] counter = 0;

	always @(negedge button1 or negedge button2 or negedge button3) begin
		if (~moving) counter <= 0;
	end
	
	always @(posedge clk) begin
		if (counter < move_time) begin
			counter <= counter + 1;
			move_clk <= 1'b0;
		end else begin
			counter <= 0;
			move_clk <= ~move_clk;
		end
	end
endmodule