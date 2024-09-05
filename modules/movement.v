// `include "./modules/segments.v"
// `include "./modules/frequency_door.v"
// `include "./modules/frequency_move.v"
// `include "./modules/door.v"
// `include "./modules/goal.v"
// `include "./modules/buttons.v"
// `include "./modules/floor_types.v"


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
    weight_limit_exceeded,
    display10, display11, display12, display13, display14, display15, display16,
    display20, display21, display22, display23, display24, display25, display26
);
    input clk, button1, button2, button3, button_reset, sos_mode, weight_limit_exceeded;
    output display10, display11, display12, display13, display14, display15, display16;
    output display20, display21, display22, display23, display24, display25, display26;
    output led1, led2, led3, floor1, floor2, floor3, door;
    output reg moving;

    wire [1:0] goal_floor;
    wire door_clk, move_clk;
    reg move_handler;

    parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10, door_time = 2, move_time = 5;
    reg [1:0] floor, next_floor;

    always @(posedge clk or posedge button_reset or posedge weight_limit_exceeded or posedge led1 or posedge led2 or posedge led3) begin
        if (button_reset | weight_limit_exceeded) begin
            move_handler <= 1'b0;
        end else begin
            move_handler <= ~(goal_floor == floor);
        end
    end

    frequency_door #(door_time) FD (
        clk,
        move_handler,
        weight_limit_exceeded,
        door_clk,
        button_reset
    );
    frequency_move #(move_time) FM (
        clk,
        led1,
        led2,
        led3,
        move_handler,
        sos_mode,
        weight_limit_exceeded,
        move_clk,
        button_reset
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
        door,
        weight_limit_exceeded
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
    segments SEG(
        floor1,
        floor2,
        floor3,
        display10, display11, display12, display13, display14, display15, display16,
        display20, display21, display22, display23, display24, display25, display26
    );

    always @(posedge door_clk or negedge move_handler or posedge button_reset) begin
        moving <= move_handler;
    end
    always @(posedge move_clk or posedge button_reset) begin
        if (button_reset) floor <= labelF1;
        else floor <= next_floor;
    end

    always @(floor or goal_floor) begin
        if (goal_floor == floor) next_floor = floor;
        else if (goal_floor - floor == labelF3) next_floor = labelF2;
        else next_floor = goal_floor;
    end
endmodule
