module TOP (
    // ENTRADAS

    // clocks
    clk_50,
    // botoes
    button1_pushed,
    button2_pushed,
    button3_pushed,
    button_reset_pushed,
    // flips
    sos_flip,
    weight_flip,
    weight_flip_reset,

    // SAIDAS

    // chamadas (leds verdes)
    led1,
    led2,
    led3,
    // posicionamento (leds vermelhos)
    floor1,
    floor2,
    floor3,
    // movimentação (leds verdes)
    door,
    moving,
    // emergencia (leds vermelhos)
    sos_mode,
    weight_limit_exceeded
);
    input clk_50, button1_pushed, button2_pushed, button3_pushed, button_reset_pushed, sos_flip, weight_flip, weight_flip_reset;
    output led1, led2, led3, floor1, floor2, floor3, door, moving, sos_mode, weight_limit_exceeded;

    wire clk, button1, button2, button3, button_reset;

    parameter clk_freq = 1;
    frequency #(clk_freq) FREQUENCY (
        clk_50,
        clk
    );
    button_handler BUTTON_HANDLER (
        button1_pushed,
        button2_pushed,
        button3_pushed,
        button_reset_pushed,
        button1,
        button2,
        button3,
        button_reset
    );
    movement MOVEMENT (
        clk,
        button1,
        button2,
        button3,
        led1,
        led2,
        led3,
        floor1,
        floor2,
        floor3,
        door,
        moving,
        sos_mode,
        weight_limit_exceeded
    );
    emergency EMERGENCY (
        sos_flip,
        sos_mode,
        door,
        weight_flip,
        weight_flip_reset,
        weight_limit_exceeded
    );
endmodule
