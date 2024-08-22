module weight_control
    (
        clk,
        weight_flip,
        reset_weight_flip,
        weight_limit_exceeded,
    );
    input clk, weight_flip, reset_weight_flip;
    output reg weight_limit_exceeded;

    reg [2:0] counter = 3`b000;

    always @(posedge reset_weight_flip) begin
        counter <= 3`b000;
        weight_limit_exceeded <= 1'b0;
    end

    always @(posedge weight_flip) begin
        if (counter <= 3`b101) counter <= counter + 1;
        else weight_limit_exceeded <= 1'b1;
    end
endmodule