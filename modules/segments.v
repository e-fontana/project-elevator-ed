module(floor1, floor2, floor3, next_floor1, next_floor2, display1, display2);
    input floor1, floor2, floor3;
    output reg [6:0] display1 = 7'b0000001, display2 = 7'b0000001, next_floor1 = 7'b0000001, next_floor2 = 7'b0000001;

    always @(posedge floor1 or posedge floor2 or posedge floor3) begin
        case({floor1, floor2, floor3})
            3'b001: begin
                display1 <= 7'b1111110;
                display2 <= 7'b1111001;
            end
            3'b010: begin
                display1 <= 7'1111110;
                display2 <= 7'b1101101;
            end
            3'b100: begin
                display1 <= 7'1111110;
                display2 <= 7'b0110000;
            end
            default: begin
                display1 <= 7'1111110;
                display2 <= 7'1111110;
            end
        endcase
    end
endmodule