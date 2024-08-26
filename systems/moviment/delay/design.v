module delay (clk, delay, count, pass);
    input clk;
    input [2:0] delay;
    output reg pass;
    inout [2:0] count;
    
    reg [2:0] count_temp;

    always @(posedge clk) begin
        if (count == delay) begin
            pass <= 1'b1;
            count_temp <= 3'b000;
            count <= count_temp;
        end else begin
            pass <= 1'b0;
            count_temp <= count + 1;
            count <= count_temp;
        end
    end
endmodule