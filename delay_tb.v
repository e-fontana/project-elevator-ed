module delay_tb;
	reg clk_50;
	wire count, clk, pass;
	
	always #1 clk_50 <= ~clk_50;

	parameter [2:0] delay = 3'b111;
	delay #(delay) D(clk, count, pass);

	parameter clk_freq = 10;
	frequency #(clk_freq) FREQUENCY(clk_50, clk);

	initial begin
		clk_50 = 1'b0;
		$monitor("clk:%b,count:%b,pass:%b", clk, count, pass);
		#300 $finish;
	end
endmodule