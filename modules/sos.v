module sos(sos_flip, sos_mode);
    input sos_flip;
    output sos_mode;
	assign sos_mode = sos_flip;
endmodule