module door_block(sos_mode, door_block);
    input sos_mode;
    output reg door_block = 1;

    always @(sos_mode) door_block = sos_mode;
    

endmodule