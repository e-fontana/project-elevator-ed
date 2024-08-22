module sos_handler
    (
        clk,
        sos_mode,
        sos_flip,
    );

    input clk, sos_flip;
    output reg sos_mode;

    always @(posedge clk or posedge sos_flip) begin
        if ((sos_flip == 1) | (sos_flip == 0 & sos_mode == 1)) sos_mode <= 1;
        else sos_mode <= 0;
    end

endmodule