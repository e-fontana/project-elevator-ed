`include "./handlers/sos_handler/design.v"

module sos_handler_tb;
    reg sos_flip;
    reg sos_mode;
    
  sos_handler sh(
    .sos_flip(sos_flip),
    .sos_mode(sos_mode)
    );

    initial begin
        sos_flip = 0;
      	#1;
        $display("sos_flip initial: %b", sos_flip);
        $display("sos_mode initial: %b", sos_mode);
              
        change_clk;
      	#1;
        $display("sos_flip expected 1: %b", sos_flip);
        $display("sos_mode expected 1: %b", sos_mode);
      	
        change_clk;
      	#1;
        $display("sos_flip expected 0: %b", sos_flip);
        $display("sos_mode expected 1: %b", sos_mode);
    end
	
      
    task change_clk;
        #1 sos_flip = ~sos_flip;
    endtask
endmodule