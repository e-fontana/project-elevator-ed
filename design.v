`include "frequency_divisor/design.v"

module top#(parameter clk_frequency_divisor = 50000000)(
    CLK_50,
    clk,
    sos_button,
    weight_sensor,
    st_floor_button,
    nd_floor_button,
    rd_floor_button,
    st_floor_led,
    nd_floor_led,
    rd_floor_led,
    sos_led,
    weight_led,
    emergency_led,
    door_status_led,
 );
    input CLK_50, sos_button, weight_sensor, st_floor_button, nd_floor_button, rd_floor_button;
    output sos_led, weight_led, emergency_led, st_floor_led, nd_floor_led, rd_floor_led, clk, door_status_led;

    reg emergency;

    frequency_divisor #(clk_frequency_divisor) FD(CLK_50, clk);
endmodule