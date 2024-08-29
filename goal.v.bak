module goal #(parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10) (floor, led1, led2, led3, move_handler, gf);
	input [1:0] floor;
	input led1, led2, led3, move_handler;
	output reg [1:0] gf = labelF1;

	always @(led1 or led2 or led3) begin
		if (~move_handler) begin
			case (floor)
				labelF1: begin
					if (led1) gf = labelF1;
					else if (led2) gf = labelF2;
					else if (led3) gf = labelF3;
				end
				labelF2: begin
					if (led2) gf = labelF2;
					else if (led1) gf = labelF1;
					else if (led3) gf = labelF3;
				end
				labelF3: begin
					if (led3) gf = labelF3;
					else if (led2) gf = labelF2;
					else if (led1) gf = labelF1;
				end
				default: gf = gf;
			endcase
		end
	end
endmodule