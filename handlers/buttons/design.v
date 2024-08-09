module button-to-led (st_button, nd_button, rd_button, st_led, nd_led, rd_led);
    input st_button, nd_button, rd_button;
    output st_led, nd_led, rd_led;

    always @(posedge st_button) begin
        st_led = 1'b1;
    end

    always @(posedge nd_button) begin
        nd_led = 1'b1;
    end

    always @(posedge rd_button) begin
        rd_led = 1'b1;
    end
    
endmodule