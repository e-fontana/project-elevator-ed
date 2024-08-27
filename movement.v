`include "goal.v"
`include "door.v"
`include "buttons.v"
`include "led_disable.v"
`include "floor_types.v"
`include "frequency_move.v"
`include "frequency_door.v"

module movement (clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving);
	input clk, button1, button2, button3;
	output led1, led2, led3;
	output floor1, floor2, floor3, door;
	output reg moving = 1'b0;
	
	wire [1:0] goal_floor;
	wire move_handler;
	wire door_clk;
	wire move_clk;

	parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10;
	reg [1:0] floor = labelF1, next_floor;

	assign move_handler = ~(goal_floor == floor);
	
	parameter door_time = 2;
	parameter move_time = 5;
	frequency_door #(door_time) FD(clk, move_handler, door_clk);
	frequency_move #(move_time) FM(clk, button1, button2, button3, moving, move_clk);

	floor_types FT(floor, floor1, floor2, floor3);
	door DOOR(moving, floor1, floor2, floor3, door);
	goal #(labelF1, labelF2, labelF3) GOAL(floor, led1, led2, led3, move_handler, goal_floor);
	buttons #(labelF1, labelF2, labelF3) BT(button1, button2, button3, led1, led2, led3, move_handler, floor);


	always @(posedge door_clk or negedge move_handler) moving = move_handler;
	always @(posedge move_clk) floor = next_floor;

	always @(floor or goal_floor) begin
		if (goal_floor == floor) begin
			next_floor = floor;
		end else if (goal_floor - floor == labelF3) next_floor = labelF2;
		else next_floor = goal_floor;
	end
endmodule