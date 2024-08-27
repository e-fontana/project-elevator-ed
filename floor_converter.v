module floor_converter #(parameter labelF1 = 2'b00, labelF2 = 2'b01, labelF3 = 2'b10) (floor, floor1, floor2, floor3);
	input [1:0] floor;
	output floor1, floor2, floor3;

	assign floor1 = floor == labelF1;
	assign floor2 = floor == labelF2;
	assign floor3 = floor == labelF3;
endmodule