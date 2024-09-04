
module floor_types_tb;
	reg [1:0] floor;
	wire floor1, floor2, floor3;

	floor_types FT(floor, floor1, floor2, floor3);

	initial begin
		step(2'b00);
		step(2'b01);
		step(2'b10);
		step(2'b11);
	end

	task step(input [1:0] f); begin
		#1 floor = f;
		#1 $strobe("floor:%b,floor1:%b,floor2:%b,floor3:%b", floor, floor1, floor2, floor3);
	end endtask
endmodule