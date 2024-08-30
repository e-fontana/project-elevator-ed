module movement (
    clk,
    button1,
    button2,
    button3,
    button_reset,
    led1,
    led2,
    led3,
    floor1,
    floor2,
    floor3,
    door,
    moving,
    sos_mode,
    weight_limit_exceeded
);
    input clk, button1, button2, button3, button_reset, sos_mode, weight_limit_exceeded;
    output led1, led2, led3, floor1, floor2, floor3, door;
    output reg moving;

    wire [1:0] goal_floor;
    wire move_handler, door_clk, move_clk;

    parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10, door_time = 2, move_time = 5;
    reg [1:0] floor, next_floor;

    assign move_handler = ~(goal_floor == floor);

    frequency_door #(door_time) FD (
        clk,
        move_handler,
        weight_limit_exceeded,
        door_clk
    );
    frequency_move #(move_time) FM (
        clk,
        led1,
        led2,
        led3,
        move_handler,
        sos_mode,
        weight_limit_exceeded,
        move_clk
    );

    floor_types FT (
        floor,
        floor1,
        floor2,
        floor3
    );
    door DOOR (
        clk,
        moving,
        floor1,
        floor2,
        floor3,
        door
    );
    goal #(labelF1, labelF2, labelF3) GOAL (
        floor,
        led1,
        led2,
        led3,
        move_handler,
        goal_floor
    );
    buttons #(labelF1, labelF2, labelF3) BT (
        clk,
        button1,
        button2,
        button3,
        button_reset,
        led1,
        led2,
        led3,
        move_handler,
        floor
    );

    always @(posedge door_clk or negedge move_handler) moving = move_handler;
    always @(posedge move_clk or posedge button_reset) begin
        if (button_reset) floor = labelF1;
        else floor = next_floor;
    end

    always @(floor or goal_floor) begin
        if (goal_floor == floor) next_floor = floor;
        else if (goal_floor - floor == labelF3) next_floor = labelF2;
        else next_floor = goal_floor;
    end
endmodule
