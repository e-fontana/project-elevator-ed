always @(EmMovimento or ChamandoAndar1 or ChamandoAndar2 or ChamandoAndar3) begin

    if (~EmMovimento) begin

        case (floor)

            Andar1: beginA
                case ({
                    ChamandoAndar1, ChamandoAndar2, ChamandoAndar3
                })
                    3'b001:  AndarDestino = Andar3;
                    3'b010:  AndarDestino = Andar2;
                    3'b011:  AndarDestino = Andar2;
                    default: AndarDestino = Andar1;
                endcase
            end

            Andar2: begin
                case ({
                    ChamandoAndar1, ChamandoAndar2, ChamandoAndar3
                })
                    3'b001:  AndarDestino = Andar3;
                    3'b100:  AndarDestino = Andar1;
                    3'b101:  AndarDestino = Andar1;
                    default: AndarDestino = Andar2;
                endcase
            end

            Andar3: begin
                case ({
                    ChamandoAndar1, ChamandoAndar2, ChamandoAndar3
                })
                    3'b010:  AndarDestino = Andar2;
                    3'b100:  AndarDestino = Andar1;
                    3'b110:  AndarDestino = Andar2;
                    default: AndarDestino = Andar3;
                endcase
            end

            default: AndarDestino = Andar1;

        endcase

    end else AndarDestino = AndarDestino;
end
