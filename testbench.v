// `include "./frequency_divisor/design.v"
`include "./design.v"

module top_tb;
    reg clk50, clk, weight_sensor, st_button, nd_button, rd_button, st_led, nd_led, rd_led, up_led, down_led, door_status, presence_sensor, keep_door_open_button, okay, is_alarm_active;
    reg [1:0] current_floor, future_floor;
    wire sos_led, weight_led, emergency_led, st_led, nd_led, rd_led, up_led, down_led;

    integer i;
    parameter clk_frequency = 500;

    top #(clk_frequency) TOP(
     .CLK_50(clk50),
     .clk(clk),
     .sos_button(sos_button),
     .weight_sensor(weight_sensor),
     .st_button(st_button),
     .nd_button(nd_button),
     .rd_button(rd_button),
     .sos_led(sos_led),
     .weight_led(weight_led),
     .emergency_led(emergency_led),
     .st_led(st_led),
     .nd_led(nd_led),
     .rd_led(rd_led)
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
