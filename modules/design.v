// `include "./modules/frequency.v"
// `include "./modules/button_handler.v"
// `include "./modules/movement.v"
// `include "./modules/emergency.v"

module TOP #(
    parameter clk_freq = 50000000
) (
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
    weight_limit_exceeded,
    // display1
    display10,
    display11,
    display12,
    display13,
    display14,
    display15,
    display16,
    //display2
    display20,
    display21,
    display22,
    display23,
    display24,
    display25,
    display26
);
    input clk_50, button1_pushed, button2_pushed, button3_pushed, button_reset_pushed, sos_flip, weight_flip, weight_flip_reset;
    output led1, led2, led3, floor1, floor2, floor3, door, moving, sos_mode, weight_limit_exceeded;

    output display10, display11, display12, display13, display14, display15, display16;
    output display20, display21, display22, display23, display24, display25, display26;

    wire clk, button1, button2, button3, button_reset;

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
        button_reset,
        led1,
        led2,
        led3,
        floor1,
        floor2,
        floor3,
        door,
        moving,
        sos_mode,
        weight_limit_exceeded,
        display10,
        display11,
        display12,
        display13,
        display14,
        display15,
        display16,
        display20,
        display21,
        display22,
        display23,
        display24,
        display25,
        display26
    );
    emergency EMERGENCY (
        button_reset,
        sos_flip,
        sos_mode,
        door,
        weight_flip,
        weight_flip_reset,
        weight_limit_exceeded
    );
endmodule
