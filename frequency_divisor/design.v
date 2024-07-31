module frequency_divisor #(parameter clk_frequency = 50000000) (clk_50, clk);
    input clk_50;
    output reg clk;
    reg [25:0] counter;

    always @(posedge clk_50) begin
        if (counter < clk_frequency) begin
            counter <= counter + 1;
            clk <= 0;
        end else begin
            counter <= 0;
            clk <= ~clk;
        end
    end

endmodule