module frequency_move #(
    parameter move_time = 10
) (
    clk,
    button1,
    button2,
    button3,
    moving,
    sos_mode,
    weight_limit_exceeded,
    move_clk
);
    input clk, button1, button2, button3, moving, sos_mode, weight_limit_exceeded;
    output reg move_clk;

    reg [31:0] counter = 0;

    always @(posedge clk) begin
        if (~moving && move_clk) begin
            counter <= 0;
        end else if (~sos_mode && ~weight_limit_exceeded) begin
			if (counter < move_time) begin
				counter <= counter + 1;
				move_clk <= 1'b0;
			end else begin
				counter <= 0;
				move_clk <= ~move_clk;
			end
		end
    end
endmodule
