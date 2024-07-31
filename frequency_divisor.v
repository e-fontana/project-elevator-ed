module frequency_divisor(clk, clk_div);
    input clk;
    output clk_div;

    reg [23:0] counter;
    reg clk_div_reg;

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 0) begin
            clk_div_reg <= ~clk_div_reg;
        end
    end

    assign clk_div = clk_div_reg;

endmodule