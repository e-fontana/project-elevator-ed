`include "frequency.v"

module frequency_tb;
    reg clk_50, goal_floor;
    wire clk;

    parameter clk_frequency = 500;

    frequency #(clk_frequency) FREQUENCY(clk_50, goal_floor, clk);

    always #1 clk_50 <= ~clk_50;

	always @(posedge clk) begin
		$strobe("time: %d, clk: %b", $time, clk);
	end

    initial begin
        clk_50 = 0;
		goal_floor = 0;
		#100 goal_floor <= ~goal_floor;
        $monitor("clk: %b, goal_floor: %b, time: %d", clk, goal_floor, $time);
        #(clk_frequency * 10) $finish;
    end
endmodule