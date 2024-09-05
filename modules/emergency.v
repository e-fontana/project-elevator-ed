// `include "./modules/sos.v"
// `include "./modules/weight.v"

module emergency (
    button_reset,
    sos_flip,
    sos_mode,
    door,
    weight_flip,
    weight_flip_reset,
    weight_limit_exceeded
);
    input sos_flip, door, weight_flip, weight_flip_reset, button_reset;
    output sos_mode, weight_limit_exceeded;

    sos SOS (
        sos_flip,
        sos_mode
    );
    weight WEIGHT (
        button_reset,
        door,
        weight_flip,
        weight_flip_reset,
        weight_limit_exceeded
    );
endmodule
