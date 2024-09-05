module frequency_door #(
    parameter door_time = 2
) (
    clk,
    move_handler,
    weight_limit_exceeded,
    door_clk,
    button_reset
);
    input clk, move_handler, weight_limit_exceeded, button_reset;
    output reg door_clk;

    reg [31:0] counter;

    always @(posedge clk or posedge button_reset) begin
        if (button_reset) begin
            door_clk <= 1'b0;
            counter  <= 0;
        end
        else if (~weight_limit_exceeded) begin
            if (counter < door_time) begin
                counter  <= counter + 1;
                door_clk <= 1'b0;
            end else begin
                counter  <= 1'b0;
                door_clk <= ~door_clk;
            end
        end
    end
endmodule
