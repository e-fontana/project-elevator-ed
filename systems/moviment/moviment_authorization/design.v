module moviment_authorization(clk, emergency_mode, moviment_authorization);
    input clk, emergency_mode;
    output reg moviment_authorization;

    always @(posedge clk) begin
        if (emergency_mode) moviment_authorization <= 0;
        else moviment_authorization <= 1;
    end
endmodule