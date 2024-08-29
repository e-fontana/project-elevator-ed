module frequency_door #(
    parameter door_time = 2
) (
    clk,
    move_handler,
    weight_limit_exceeded,
    door_clk
);
    input clk, move_handler, weight_limit_exceeded;
    output reg door_clk = 1'b0;

    reg [31:0] counter = 0;

    always @(posedge clk) begin
        if (~weight_limit_exceeded) begin
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
