module goal #(
    parameter labelF1 = 2'b00,
    labelF2 = 2'b01,
    labelF3 = 2'b10
) (
    floor,
    led1,
    led2,
    led3,
    move_handler,
    gf
);
    input [1:0] floor;
    input led1, led2, led3, move_handler;
    output reg [1:0] gf = labelF1;

    always @(move_handler or led1 or led2 or led3) begin

        if (~move_handler) begin

            case (floor)

                labelF1: begin
                    case ({
                        led1, led2, led3
                    })
                        3'b001:  gf = labelF3;
                        3'b010:  gf = labelF2;
                        3'b011:  gf = labelF2;
                        default: gf = labelF1;
                    endcase
                end

                labelF2: begin
                    case ({
                        led1, led2, led3
                    })
                        3'b001:  gf = labelF3;
                        3'b100:  gf = labelF1;
                        3'b101:  gf = labelF1;
                        default: gf = labelF2;
                    endcase
                end

                labelF3: begin
                    case ({
                        led1, led2, led3
                    })
                        3'b010:  gf = labelF2;
                        3'b100:  gf = labelF1;
                        3'b110:  gf = labelF2;
                        default: gf = labelF3;
                    endcase
                end

                default: gf = labelF1;

            endcase

        end else gf = gf;
    end
endmodule
