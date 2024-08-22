`include "./systems/emergency/sos_handler/design.v"
`include "./systems/emergency/weigth_control/design.v"

module emergency_module (
    clk,
    sos_flip,
    weight_flip,
    weight_flip_reset,
    weight_limit_exceeded,
);
    weight_control wc(
        .weight_flip(weight_flip),
        .weight_flip_reset(weight_flip_reset),
        .weight_limit_exceeded(weight_limit_exceeded)
    );
    sos_handler sh(
        .clk(clk),
        .sos_flip(sos_flip),
        .sos_mode(sos_mode)
    );
endmodule