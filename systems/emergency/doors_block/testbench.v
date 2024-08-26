`include "systems/emergency/doors_block/design.v"

module door_block_tb;
    reg sos_mode;
    wire door_block;

    door_block DB(.sos_mode(sos_mode), .door_block(door_block));

    always #1 sos_mode = ~sos_mode;

    initial begin
        sos_mode = 1'b0;
        $monitor("door_block = %b, sos_mode = %b", door_block, sos_mode);
        #10 $finish;
    end

endmodule