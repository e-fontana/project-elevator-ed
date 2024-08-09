module priority_queue(state, st_led, nd_led, rd_led, next_state);
    always @(posedge st_led or posedge nd_led or posedge rd_led)
        begin
            case (state)

                2'b00: begin
                    case ({st_led, nd_led, rd_led})
                        3'b001: begin
                            next_state <= 2'b10;
                        end
                        3'b010: begin
                            next_state <= 2'b01;
                        end
                        3'b011: begin
                            next_state <= 2'b01;
                        end
                        default: begin
                            next_state <= 2'b00;
                        end
                    endcase
                end
                
                2'b01: begin
                    case ({st_led, nd_led, rd_led})
                        3'b001: begin
                            next_state <= 2'b10;
                        end
                        3'b100: begin
                            next_state <= 2'b00;
                        end
                        3'b101: begin
                            next_state <= 2'b00;
                        end
                        default: begin
                            next_state <= 2'b01;
                        end
                    endcase
                end

                2'b10: begin
                    case ({st_led, nd_led, rd_led})
                        3'b010: begin
                            next_state <= 2'b01;
                        end
                        3'b100: begin
                            next_state <= 2'b00;
                        end
                        3'b110: begin
                            next_state <= 2'b01;
                        end
                        default: begin
                            next_state <= 2'b10;
                        end
                    endcase
                end

                default: begin
                    next_state <= 2'b00;
                end
                
            endcase
        end
endmodule