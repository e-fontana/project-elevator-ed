`include "door_frequency.v"
`include "floor_converter.v"
`include "door_status.v"
`include "floor_goal.v"
`include "buttons.v"

module movement(clk, button1, button2, button3, led1, led2, led3, floor1, floor2, floor3, door, moving);
	// INPUTS AND VARIABLES INSTACIATION
	input clk, button1, button2, button3;
	output floor1, floor2, floor3, door, led1, led2, led3;

	output reg moving = 1'b0;
	parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10;
	
	wire [1:0] goal_floor;
	wire movement_handler, half_clk;
	reg [1:0] floor = labelF1, next_floor;

	// MODULES IMPORT
	door_frequency FD(clk, movement_handler, half_clk);
	floor_converter FT(floor, floor1, floor2, floor3);
	door_status DOOR(moving, floor1, floor2, floor3, door);
	goal #(labelF1, labelF2, labelF3) GOAL(floor, led1, led2, led3, moving, goal_floor);
	buttons #(labelF1, labelF2, labelF3) BT(button1, button2, button3, led1, led2, led3, moving, goal_floor);

	// MOVEMENT MODULE LOGIC
	assign movement_handler = ~(goal_floor == floor);

	// nao gera erro de tempo por causa do clk da porta
	always @(movement_handler) moving = movement_handler;
	//gera erro devido ao clk da porta
	always @(posedge half_clk) moving <= movement_handler;


	always @(posedge clk) floor <= next_floor;

	always @(floor or goal_floor) begin
		if (goal_floor == floor) next_floor = floor;
		else if (goal_floor - floor == labelF3) next_floor = labelF2;
		else next_floor = goal_floor;
	end

endmodule