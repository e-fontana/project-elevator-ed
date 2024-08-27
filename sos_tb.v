`include "./systems/emergency/sos_handler/design.v"

module sos_handler_tb;
    reg sos_flip;
    wire sos_mode;
    
  sos_handler sh(
    .sos_flip(sos_flip),
    .sos_mode(sos_mode)
    );

    initial begin
        sos_flip = 1'b0;
        $monitor("sos_flip: %b, sos_mode: %b", sos_flip, sos_mode);

        changle_sos_flip;
        $monitor("sos_flip: %b, sos_mode: %b", sos_flip, sos_mode);

        changle_sos_flip;
        $monitor("sos_flip: %b, sos_mode: %b", sos_flip, sos_mode);
    end
	
      
    task changle_sos_flip;
        #1 sos_flip = ~sos_flip;
    endtask
endmodule