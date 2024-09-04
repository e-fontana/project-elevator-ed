module button_handler (
    button1_pushed,
    button2_pushed,
    button3_pushed,
    button_reset_pushed,
    button1,
    button2,
    button3,
    button_reset
);
    input button1_pushed, button2_pushed, button3_pushed, button_reset_pushed;
    output button1, button2, button3, button_reset;

    assign button1 = ~button1_pushed;
    assign button2 = ~button2_pushed;
    assign button3 = ~button3_pushed;
    assign button_reset = ~button_reset_pushed;
endmodule
