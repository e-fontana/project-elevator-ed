`include "./handlers/sos_handler/design.v"

module sos_handler_tb;
    reg clk;
    reg sos_button;
    wire sos_mode;
    
    location LOCATION(clk, sos_button, sos_mode);

    initial begin
        sos_button = 0;
        change_clk;
        $display("sos_button initial: %b", sos_button);
        $display("sos_mode initial: %b", sos_mode);
        
        sos_button = 1;
        change_clk;
        $display("sos_button final: %b", sos_button);
        $display("sos_mode final: %b", sos_mode);

        sos_button = 0;
        change_clk;
        $display("sos_button final: %b", sos_button);
        $display("sos_mode final: %b", sos_mode);
    end

    task display;
        $display("sos_mode: %b", sos_mode);
    endtask

    task change_clk;
        #1 clk = ~clk;
    endtask
endmodule