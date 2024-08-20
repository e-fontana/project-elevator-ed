module door_status #(parameter st_floor = 2'b00, nd_floor = 2'b01, rd_floor = 2'b10) (floor, next_floor, st_led, nd_led, rd_led, door_status, is_mooving, open_when);
    
    input [1:0] floor;
    output st_led, nd_led, rd_led;
    output reg door_status;
    inout is_mooving;

    // TODO: Call emergency module to verify door status

    always @(next_floor) begin

        if (open_when == st_floor & floor == st_floor) begin
            is_mooving = 0;
            door_status = 2'b01; // opening door
            door_status = 2'b10; // open door
            door_status = 2'b11; // closing door
            door_status = 2'b00; // door closed
            st_led = 0;
            is_mooving = 1;
        end
        
        else if (open_when == nd_floor & floor == nd_floor) begin
            is_mooving = 0;
            door_status = 2'b01; // opening door
            door_status = 2'b10; // open door
            door_status = 2'b11; // closing door
            door_status = 2'b00; // door closed
            nd_led = 0;            
            is_mooving = 1;
        end
        
        else if (open_when == rd_floor & floor == rd_floor) begin
            is_mooving = 0;
            door_status = 2'b01; // opening door
            door_status = 2'b10; // open door
            door_status = 2'b11; // closing door
            door_status = 2'b00; // door closed
            rd_led = 0;
            is_mooving = 1;
        end
        
        else begin
            door_status = 2'b00;
        end
    end

endmodule