`include "goal.v"
`include "door.v"
`include "buttons.v"
`include "floor_types.v"

module movement(clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving);
	input clk, button1, button2, button3;
	output led1, led2, led3;
	output floor1, floor2, floor3, door, moving;
	wire [1:0] goal_floor;

	parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10;
	reg [1:0] floor = labelF1, next_floor;
	assign moving = ~(goal_floor == floor);

	floor_types FT(floor, floor1, floor2, floor3);
	door DOOR(moving, floor1, floor2, floor3, door);
	goal #(labelF1, labelF2, labelF3) GOAL(floor, led1, led2, led3, moving, goal_floor);
	buttons #(labelF1, labelF2, labelF3) BT(button1, button2, button3, led1, led2, led3, moving, goal_floor);


	always @(posedge clk) floor = next_floor;

	always @(floor or goal_floor) begin
		if (goal_floor == floor) next_floor = floor;
		else if (goal_floor - floor == labelF3) next_floor = labelF2;
		else next_floor = goal_floor;
	end
endmodule