module location
    (
        clk,
        sos_button,
        sos_mode
    );
    input sos_button;
    output sos_mode;
    always @(sos_button and posedge clk)
        begin
            sos_mode <= 1;
        end
endmodule