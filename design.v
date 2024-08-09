`include "frequency_divisor/design.v"
`include "position/movement/design.v"

module top #(parameter clk_frequency_divisor = 50000000) (
    CLK_50,
    clk,
    sos_button,
    weight_sensor,
    st_button,
    nd_button,
    rd_button,
    st_led,
    nd_led,
    rd_led,
    sos_led,
    up_led,
    down_led,
    weight_led,
    emergency_led,
 );
    input CLK_50, sos_button, weight_sensor, st_button, nd_button, rd_button;
    output sos_led, weight_led, emergency_led, st_led, nd_led, rd_led, up_led, down_led;
    inout clk;

    parameter st_floor = 2'b00, nd_floor = 2'b01, rd_floor = 2'b10;

    reg emergency;

    reg [1:0] current_floor;

    movement movement(clk, st_led, nd_led, rd_led, up_led, down_led, current_floor);

    frequency_divisor #(clk_frequency_divisor) FD(CLK_50, clk);
endmodule