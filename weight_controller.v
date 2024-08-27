module weight_control
    (
       weight_flip, weight_flip_reset, weight_limit_exceeded
    );
    input weight_flip, weight_flip_reset;
    output reg weight_limit_exceeded = 1'b0;

    reg [2:0] counter = 3'b000;

    always @(posedge weight_flip_reset) begin
        counter = 3'b000;
        weight_limit_exceeded = 1'b0;
    end

    always @(posedge weight_flip) begin
        if (counter == 3'b101) begin 
            counter = counter + 1;
            weight_limit_exceeded = 1'b1;
        end
        else if (counter < 3'b101) counter = counter + 1;
    end
endmodule