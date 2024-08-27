module buttons #(parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10) (button1, button2, button3, led1, led2, led3, moving, goal_floor);
    input button1, button2, button3, moving;
    input [1:0] goal_floor;
    output reg led1 = 1'b0, led2 = 1'b0, led3 = 1'b0;

    always @(negedge button1) led1 <= 1'b1;
    always @(negedge button2) led2 <= 1'b1;
    always @(negedge button3) led3 <= 1'b1;

    always @(negedge moving) begin
        case (goal_floor)
            labelF1: led1 <= 1'b0;
            labelF2: led2 <= 1'b0;
            labelF3: led3 <= 1'b0;
            default: begin
                led1 <= 1'b0;
                led2 <= 1'b0;
                led3 <= 1'b0;
            end
        endcase
    end
endmodule
