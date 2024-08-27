module door_status(moving, f1, f2, f3, door);
	input moving, f1, f2, f3;
	output door;
	assign door = ~moving & ((~f1 & ~f2 & f3) | (~f1 & f2 & ~f3) | (f1 & ~f2 & ~f3));
endmodule
