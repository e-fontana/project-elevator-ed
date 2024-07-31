module location
    (
        clk,
        sos_button,
        sos_mode
    );
    input clk, sos_button;
    output reg sos_mode;

    always @(posedge clk or sos_button) begin
        if ((sos_button == 1) | (sos_button == 0 & sos_mode == 1)) sos_mode <= 1;
        else sos_mode <= 0;
    end

endmodule