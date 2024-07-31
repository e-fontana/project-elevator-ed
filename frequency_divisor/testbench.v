`include "./frequency_divisor/design.v"

module test;
    wire clk;
    reg clk50;
    
    integer i;
    parameter clk_frequency = 500;

    frequency_divisor #(clk_frequency) FD(clk50, clk);

    always @(clk) begin
        display;
    end

    initial begin
        clk50 = 0;
        for (i = 0; i < clk_frequency * 5 + 1; i = i + 1) begin
            change_clock;
        end
    end
  
    task display;
        #1 $display("clk50: %b, clk: %b", clk50, clk);
    endtask

    task change_clock;
        #1 clk50 = ~clk50;
    endtask
endmodule
