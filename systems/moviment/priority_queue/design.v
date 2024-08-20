module priority_queue #(parameter st_floor = 2'b00, nd_floor = 2'b01, rd_floor = 2'b10) (floor, st_led, nd_led, rd_led, open_when, is_mooving);

    input [1:0] floor;
    input st_led, nd_led, rd_led, is_mooving;
    output [1:0] open_when, next_floor;

    always @(negedge is_mooving or posedge st_led or posedge nd_led or posedge rd_led) begin

        if (~is_mooving) begin

            case (floor)

                st_floor: begin
                    case ({st_led, nd_led, rd_led})
                        3'b001: begin
                            open_when = rd_floor;
                            next_floor = nd_floor;
                        end
                        3'b010: begin
                            open_when = nd_floor;
                            next_floor = nd_floor;
                        end
                        3'b011: begin
                            open_when = nd_floor;
                            next_floor = nd_floor;
                        end
                        default: begin
                            open_when = st_floor;
                        end
                    endcase
                end
                
                nd_floor: begin
                    case ({st_led, nd_led, rd_led})
                        3'b001: begin
                            open_when = rd_floor;
                            next_floor = rd_floor;
                        end
                        3'b100: begin
                            open_when = st_floor;
                            next_floor = st_floor;
                        end
                        3'b101: begin
                            open_when = st_floor;
                            next_floor = st_floor;
                        end
                        default: begin
                            open_when = nd_floor;
                        end
                    endcase
                end

                rd_floor: begin
                    case ({st_led, nd_led, rd_led})
                        3'b010: begin
                            open_when = nd_floor;
                            next_floor = nd_floor;
                        end
                        3'b100: begin
                            open_when = st_floor;
                            next_floor = nd_floor;
                        end
                        3'b110: begin
                            open_when = nd_floor;
                            next_floor = nd_floor;
                        end
                        default: begin
                            open_when = rd_floor;
                        end
                    endcase
                end

                default: begin
                    next_floor = st_floor;
                end
            endcase
        end

        // TODO: SERÁ UTILIZADO NO MÓDULO DE CONTROLE DE ANDAR
        // else if (next_floor != open_when) begin
        //     floor = next_floor;
        //     next_floor = open_when;
        // end

    end
endmodule