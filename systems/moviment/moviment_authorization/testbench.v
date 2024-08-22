`include "systems/moviment/moviment_authorization/design.v"

module moviment_authorization_tb;
    reg clk, emergency_mode;
    wire moviment_authorization;

    moviment_authorization mv_a(clk, emergency_mode, moviment_authorization);

    initial begin
        // Quando o modo de emergencia virar 1, a autorização de movimento deve ser 0 instananeamente.
        // Assim, parando o sistema.
    end
endmodule