`include "door_status.v"

module door_tb;
	reg moving, f1, f2, f3;
	wire door;

	door_status D(moving, f1, f2, f3, door);

	initial begin
		test(0,0,0,0);
		test(0,0,0,1);
		test(0,0,1,0);
		test(0,0,1,1);
		test(0,1,0,0);
		test(0,1,0,1);
		test(0,1,1,0);
		test(0,1,1,1);
		test(1,0,0,0);
		test(1,0,0,1);
		test(1,0,1,0);
		test(1,0,1,1);
		test(1,1,0,0);
		test(1,1,0,1);
		test(1,1,1,0);
		test(1,1,1,1);
	end

	task test(input m, a, b, c); begin
		#1 begin
			moving = m;
			f1 = a;
			f2 = b;
			f3 = c;
		end
		#1 $strobe("moving:%b,f1:$b,f2:%b,f3:%b,door:%b", moving, f1, f2, f3, door);
	end endtask
endmodule