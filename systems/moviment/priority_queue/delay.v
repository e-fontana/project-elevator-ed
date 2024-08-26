module delay (clk, delay, count, pass);
    input clk;
    input [2:0] delay;
    inout reg pass;
    inout reg [2:0] count;
    
    always @(posedge clk) begin
        if (count == delay) begin
            pass = 1'b1;
            count = 3'b000;
        end else begin
            pass = 1'b0;
            count = count + 1;
        end
    end
endmodule