module sos_handler
    (
        sos_flip,
        sos_mode
    );

    input sos_flip;
    output reg sos_mode = 0;

    always @(sos_flip) sos_mode <= sos_flip;

endmodule
