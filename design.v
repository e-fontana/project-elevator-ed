`include "frequency_divisor/design.v"
`include "systems/emergency/design.v"

module top#(parameter clk_frequency_divisor = 50000000)(
    CLK_50,
    clk,
    st_floor_button,
    nd_floor_button,
    rd_floor_button,
    st_floor_led,
    nd_floor_led,
    rd_floor_led,
    sos_flip,
    emergency_led,
    weight_sensor_flip,
    weight_limit_exceeded_led,
    door_status_led,
 );
    input CLK_50, sos_flip, weight_sensor_flip, st_floor_button, nd_floor_button, rd_floor_button;
    output weight_limit_exceeded_led, emergency_led, st_floor_led, nd_floor_led, rd_floor_led, clk, door_status_led;

    reg emergency;

    frequency_divisor #(clk_frequency_divisor) FD(CLK_50, clk); // Calls the frequency divisor module

    emergency_module em (
        .clk(clk),
        .sos_flip(sos_flip),
        .weight_flip(weight_sensor_flip),
        .weight_flip_reset(st_floor_button | nd_floor_button | rd_floor_button),
        .weight_limit_exceeded(weight_limit_exceeded_led)
    ); // Calls the emergency top module
endmodule