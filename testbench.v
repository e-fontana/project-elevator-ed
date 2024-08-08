// `include "./frequency_divisor/design.v"
`include "./design.v"

module top_tb;
    wire sos_led, weight_led, emergency_led, st_floor_led, nd_floor_led, rd_floor_led, clk, door_status_led;
    
    reg CLK_50, sos_button, weight_sensor, st_floor_button, nd_floor_button, rd_floor_button;

    integer i;
    parameter clk_frequency = 500;

    top #(clk_frequency) TOP(
     .CLK_50(clk50),
     .clk(clk),
     .sos_button(sos_button),
     .weight_sensor(weight_sensor),
     .st_floor_button(st_floor_button),
     .nd_floor_button(nd_floor_button),
     .rd_floor_button(rd_floor_button),
     .sos_led(sos_led),
     .weight_led(weight_led),
     .emergency_led(emergency_led),
     .st_floor_led(st_floor_led),
     .nd_floor_led(nd_floor_led),
     .rd_floor_led(rd_floor_led),
     .door_status_led(door_status_led)
    );

    initial begin
        clock_test;
    end

    always @(clk) begin
        #1 display_clock;
    end
  
    task display_clock;
        #1 $display("clk: %b", clk);
    endtask

    task change_clock;
        #1 clk50 = ~clk50;
    endtask

    task clock_test; 
        #1 begin
            clk50 = 0;
            for (i = 0; i < clk_frequency * 5 + 1; i = i + 1) begin
                change_clock;
            end
        end
    endtask
endmodule
