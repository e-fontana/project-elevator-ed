module frequency_move #(
    parameter move_time = 10
) (
    clk,
    led1,
    led2,
    led3,
    move_handler,
    sos_mode,
    weight_limit_exceeded,
    move_clk
);
    input clk, led1, led2, led3, move_handler, sos_mode, weight_limit_exceeded;
    output reg move_clk = 1'b0;

    reg [25:0] counter = 0;

    always @(posedge clk) begin
        if (~move_handler & (led1 | led2 | led3)) counter = 0;
        else if (~sos_mode && ~weight_limit_exceeded) begin
            if (counter < move_time) begin
                counter  <= counter + 1;
                move_clk <= 1'b0;
            end else begin
                counter  <= 0;
                move_clk <= ~move_clk;
            end
        end
    end
endmodule
