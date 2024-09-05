module segments (
    floor1,
    floor2,
    floor3,
    display10,display11,display12,display13,display14,display15,display16,
    display20,display21,display22,display23,display24,display25,display26
);
    input floor1, floor2, floor3;
    output display10, display11, display12, display13, display14, display15, display16, display20, display21, display22, display23, display24, display25, display26;
    reg [6:0] display1 = 7'b0000001, display2 = 7'b0000001;

    assign display10 = ~display2[6];
    assign display11 = ~display2[5];
    assign display12 = ~display2[4];
    assign display13 = ~display2[3];
    assign display14 = ~display2[2];
    assign display15 = ~display2[1];
    assign display16 = ~display2[0];

    assign display20 = ~display1[6];
    assign display21 = ~display1[5];
    assign display22 = ~display1[4];
    assign display23 = ~display1[3];
    assign display24 = ~display1[2];
    assign display25 = ~display1[1];
    assign display26 = ~display1[0];

    always @(posedge floor1 or posedge floor2 or posedge floor3) begin
        case ({
            floor1, floor2, floor3
        })
            3'b001: begin
                display1 <= 7'b1111110;
                display2 <= 7'b1111001;
            end
            3'b010: begin
                display1 <= 7'b1111110;
                display2 <= 7'b1101101;
            end
            3'b100: begin
                display1 <= 7'b1111110;
                display2 <= 7'b0110000;
            end
            default: begin
                display1 <= 7'b1111110;
                display2 <= 7'b1111110;
            end
        endcase
    end
endmodule
