module buttons #(
    parameter labelF1 = 2'b00,
    labelF2 = 2'b01,
    labelF3 = 2'b10
) (
    clk,
    button1,
    button2,
    button3,
    led1,
    led2,
    led3,
    move_handler,
    floor
);
    input clk, button1, button2, button3, move_handler;
    input [1:0] floor;
    output reg led1, led2, led3;

    always @(posedge button1 or posedge clk) begin
        if (button1) led1 <= 1'b1;
        else if (led1 & (move_handler | floor != labelF1)) led1 <= 1'b1;
        else led1 <= 1'b0;
    end
    always @(posedge button2 or posedge clk) begin
        if (button2) led2 <= 1'b1;
        else if (led2 & (move_handler | floor != labelF2)) led2 <= 1'b1;
        else led2 <= 1'b0;
    end
    always @(posedge button3 or posedge clk) begin
        if (button3) led3 <= 1'b1;
        else if (led3 & (move_handler | floor != labelF3)) led3 <= 1'b1;
        else led3 <= 1'b0;
    end

endmodule
