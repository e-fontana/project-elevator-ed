module door_status #(parameter st_floor = 2'b00, nd_floor = 2'b01, rd_floor = 2'b10) (state, st_led, nd_led, rd_led, open_door);
    
    input [1:0] state;
    inout reg st_button, nd_button, rd_button;
    output open_door;

    always @(state or st_button or nd_button or rd_button) begin

        if (state == st_floor & st_led) begin
            open_door <= 1;
            #2 open_door <= 0;
            st_led <= 0;
        end
        
        elif (state == nd_floor & nd_led) begin
            open_door <= 1;
            #2 open_door <= 0;
            nd_led <= 0;
        end
        
        elif (state == rd_floor & rd_led) begin
            open_door <= 1;
            #2 open_door <= 0;
            rd_led <= 0;
        end
        
        else begin
            open_door <= 0;
        end
    end


endmodule