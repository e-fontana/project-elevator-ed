module weight (
    button_reset,
    door,
    weight_flip,
    weight_flip_reset,
    weight_limit_exceeded
);
    input door, weight_flip, weight_flip_reset, button_reset;
    output reg weight_limit_exceeded;

    reg [31:0] counter = 0;

    always @(posedge weight_flip or posedge weight_flip_reset or posedge button_reset) begin
        if (button_reset) begin
            counter <= 0;
            weight_limit_exceeded <= 1'b0;
        end else if (weight_flip_reset) begin
            counter <= 0;
            weight_limit_exceeded <= 1'b0;
        end else if (door) begin
            if (counter == 5) begin
                counter <= counter + 1;
                weight_limit_exceeded <= 1'b1;
            end else if (counter < 5) counter <= counter + 1;
            else counter <= counter;
        end else counter <= counter;
    end
endmodule
