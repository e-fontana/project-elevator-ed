`include "./systems/emergency/sos_handler/design.v"
`include "./systems/emergency/weigth_control/design.v"
`include "./systems/emergency/doors_block/design.v"

module emergency_module (
    clk,
    emergency_flip,
    emergency_mode,
    weight_flip,
    weight_flip_reset,
    weight_limit_exceeded,
    doors_block,
);
    input clk, emergency_flip, weight_flip, weight_flip_reset;
    output reg weight_limit_exceeded, doors_block, emergency_mode;

    weight_control wc(
        .weight_flip(weight_flip),
        .weight_flip_reset(weight_flip_reset),
        .weight_limit_exceeded(weight_limit_exceeded)
    );
    sos_handler sh(
        .clk(clk),
        .sos_flip(emergency_flip),
        .sos_mode(emergency_mode)
    );
    doors_block db(
        .sos_mode(emergency_mode),
    );
endmodule