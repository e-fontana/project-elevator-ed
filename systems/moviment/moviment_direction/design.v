module moviment_direction (floor, next_floor, direction);
    input [1:0] floor, next_floor;
    output reg direction;
    parameter going_up = 1'b1, going_down = 1'b0;

    if (floor < next_floor) begin
        direction = going_up;
    end else if (floor > next_floor) begin
        direction = going_down;
    end
    // TODO: If the floor is the same as the next floor, the elevator should stop, but not in this module.
endmodule