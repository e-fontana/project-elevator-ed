module test;

    always @(posedge button_reset or posedge weight_limit_exceeded or posedge sos_mode or posedge floor1 or posedge floor2 or posedge floor3) begin
        if (button_reset | weight_limit_exceeded | sos_mode) begin
            move_handler <= 1'b0;
        end else begin
            move_handler <= ~(goal_floor == floor);
        end
    end

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
