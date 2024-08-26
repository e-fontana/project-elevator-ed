module sos_handler
    (
        sos_flip,
        sos_mode
    );

    input sos_flip;
    output reg sos_mode = 0;

    always @(posedge sos_flip) begin
        if ((sos_flip == 1) | (sos_flip == 0 & sos_mode == 1)) sos_mode <= 1;
        else sos_mode <= 0;
    end

endmodule