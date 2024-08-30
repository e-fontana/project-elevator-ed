module testbench;
    reg
        clk_50,
        button1_pushed,
        button2_pushed,
        button3_pushed,
        button_reset_pushed,
        sos_flip,
        weight_flip,
        weight_flip_reset;
    wire led1, led2, led3, floor1, floor2, floor3, door, moving, sos_mode, weight_limit_exceeded;

    integer i = 0;

    parameter clk_freq = 500;

    always #1 clk_50 <= ~clk_50;
    always #1
        $strobe(
            "led1:%b,led2:%b,led3:%b,floor1:%b,floor2:%b,floor3:%b,door:%b,sos_mode:%b,weight_limit_exceeded:%b",
            led1,
            led2,
            led3,
            floor1,
            floor2,
            floor3,
            door,
            sos_mode,
            weight_limit_exceeded
        );

    TOP #(clk_freq) TOP (
        clk_50,
        button1_pushed,
        button2_pushed,
        button3_pushed,
        button_reset_pushed,
        sos_flip,
        weight_flip,
        weight_flip_reset,
        led1,
        led2,
        led3,
        floor1,
        floor2,
        floor3,
        door,
        moving,
        sos_mode,
        weight_limit_exceeded
    );

    initial begin
        clk_50 = 1'b0;
        button1_pushed = 1'b1;
        button2_pushed = 1'b1;
        button3_pushed = 1'b1;
        button_reset_pushed = 1'b1;
        sos_flip = 1'b0;
        weight_flip = 1'b0;
        weight_flip_reset = 1'b0;
        //#10 for (i = 0; i <= 6; i = i + 1) increase_people;
        press_button_reset;
        #(clk_freq * 20) press_button3;
    end

    task reset_weight;
        begin
            #(clk_freq * 1) weight_flip_reset = ~weight_flip_reset;
            #(clk_freq * 1) weight_flip_reset = ~weight_flip_reset;
        end
    endtask

    task increase_people;
        begin
            #(clk_freq * 1) weight_flip = ~weight_flip;
            #(clk_freq * 1) weight_flip = ~weight_flip;
        end
    endtask

    task toggle_sos;
        begin
            #(clk_freq * 5) sos_flip = ~sos_flip;
        end
    endtask

    task press_button_reset;
        begin
            #(clk_freq * 0.5) button_reset_pushed = ~button_reset_pushed;
            #(clk_freq * 0.5) button_reset_pushed = ~button_reset_pushed;
        end
    endtask

    task press_button1;
        begin
            #(clk_freq * 0.5) button1_pushed = ~button1_pushed;
            #(clk_freq * 0.5) button1_pushed = ~button1_pushed;
        end
    endtask

    task press_button2;
        begin
            #(clk_freq * 0.5) button2_pushed = ~button2_pushed;
            #(clk_freq * 0.5) button2_pushed = ~button2_pushed;
        end
    endtask

    task press_button3;
        begin
            #(clk_freq * 0.5) button3_pushed = ~button3_pushed;
            #(clk_freq * 0.5) button3_pushed = ~button3_pushed;
        end
    endtask
endmodule
