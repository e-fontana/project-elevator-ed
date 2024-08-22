module weight_control
    (
        weight_flip,
        weight_flip_reset,
        weight_limit_exceeded,
    );
    input clk, weight_flip, weight_flip_reset;
    output reg weight_limit_exceeded;

    reg [2:0] counter = 3'b000;

    always @(posedge weight_flip_reset) begin
        counter <= 3'b000;
        weight_limit_exceeded <= 1'b0;
    end

    always @(posedge weight_flip) begin
        if (counter <= 3'b101) counter <= counter + 1;
        else weight_limit_exceeded <= 1'b1;
    end
endmodule