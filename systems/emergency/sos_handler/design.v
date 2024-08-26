module sos_handler
    (
        sos_flip,
        sos_mode
    );

    input sos_flip;
    output reg sos_mode = 0;

    always @(posedge sos_flip or negedge sos_flip) begin
        if (sos_flip) sos_mode = 1'b1;
        else sos_mode = 1'b0;
    end

endmodule