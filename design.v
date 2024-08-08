`include "frequency_divisor/design.v"

module top#(parameter clk_frequency_divisor = 50000000)(CLK_50, clk);
    input CLK_50;
    output clk;

    frequency_divisor #(clk_frequency_divisor) FD(CLK_50, clk);
endmodule