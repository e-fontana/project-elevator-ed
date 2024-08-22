`include "./systems/emergency/weigth_control/design.v"

module weight_control_tb;
    wire weight_flip, reset_weight_flip, weight_limit_exceeded;

    weight_control wc(
        .weight_flip(weight_flip),
        .reset_weight_flip(reset_weight_flip),
        .weight_limit_exceeded(weight_limit_exceeded)
    );

    initial begin
        // change the value of weight_flip to 1 5 times to test the weight_limit_exceeded
        // after the 5th time, the weight_limit_exceeded should be 1
        // boa sorte mandy
    end

endmodule