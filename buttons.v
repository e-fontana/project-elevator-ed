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
    output reg led1 = 1'b0, led2 = 1'b0, led3 = 1'b0;

    always @(posedge clk or negedge button1 or negedge button2 or negedge button3) begin
        // unselect
        led1 <= ~button1 || floor == labelF1;
        led2 <= ~button2 || floor == labelF2;
        led3 <= ~button3 || floor == labelF3;
    end
endmodule
