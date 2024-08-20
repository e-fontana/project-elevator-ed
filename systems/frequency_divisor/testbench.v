`include "./frequency_divisor/design.v"

module test;
    wire clk;
    reg clk50;

    integer i;
    parameter clk_frequency = 500;

    frequency_divisor #(clk_frequency) FD(clk50, clk);

    always #1 clk50 = ~clk50;

    initial begin
        clk50 = 0;
        $monitor("clk: %b", clk);
        #(clk_frequency * 10) $finish;
    end
endmodule
