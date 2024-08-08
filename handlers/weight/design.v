module weight_handler
    (
        clk,
        weight,
        is_door_open,
        is_alarm_active
    );

    input clk;
    input [7:0] weight;

    always @(posedge clk) begin
        if (weight > 100) begin
            is_door_open <= 1;
            is_alarm_active <= 1;
            $display("Weight is too high");
        end else begin
            if (is_alarm_active == 1) begin
                is_alarm_active <= 0;
                $display("Alarm is deactivated");
            end
            if (is_door_open == 1) begin
                is_door_open <= 0;
                $display("Door is closed");
            end
        end
        $display("Weight: %d", weight);
    end
endmodule