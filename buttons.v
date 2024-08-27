module buttons #(parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10) (clk, button1, button2, button3, led1, led2, led3, move_handler, floor);
    input clk, button1, button2, button3, move_handler;
    input [1:0] floor;
    output reg led1 = 1'b0, led2 = 1'b0, led3 = 1'b0;

    always @(negedge button1) led1 <= 1'b1;
    always @(negedge button2) led2 <= 1'b1;
    always @(negedge button3) led3 <= 1'b1;

    always @(posedge clk) begin
        case (floor)
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