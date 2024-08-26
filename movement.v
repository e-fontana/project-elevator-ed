`include "goal.v"
`include "door.v"
`include "floor_types.v"

module movement(clk, led1, led2, led3, floor1, floor2, floor3, door, moving);
	input clk, led1, led2, led3;
	output floor1, floor2, floor3, door;
	output reg moving;

	parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10;
	reg [1:0] floor, next_floor;
	wire [1:0] goal_floor;

	floor_types FT(floor, floor1, floor2, floor3);
	door DOOR(moving, floor1, floor2, floor3, door);
	goal #(labelF1, labelF2, labelF3) GOAL(floor, led1, led2, led3, moving, goal_floor);

	always @(posedge clk) floor = next_floor;

	always @(floor) begin
		moving = 1'b1;
		if (goal_floor == floor) begin
			moving = 1'b0;
			next_floor = floor;
		end else if (goal_floor - floor == labelF2) next_floor = labelF2;
		else next_floor = goal_floor;
	end
endmodule