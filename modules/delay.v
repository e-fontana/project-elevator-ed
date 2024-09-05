module delay #(
    parameter delay = 3'b111
) (
    clk,
    count,
    pass
);
    input clk;
    output reg pass;
    inout [2:0] count;

    reg [2:0] count_temp = 3'b000;
    assign count = count_temp;

    always @(count == 3'b000) begin
        count_temp = 1'b0;
    end

    always @(posedge clk) begin
        if (count_temp == delay) begin
            pass <= 1'b1;
            count_temp <= 3'b000;
        end else begin
            pass <= 1'b0;
            count_temp <= count_temp + 1;
        end
    end
endmodule
