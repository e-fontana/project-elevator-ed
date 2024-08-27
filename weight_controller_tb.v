module weight_control_tb;
    reg clk = 1'b0,
    weight_flip = 1'b0,
    weight_flip_reset = 1'b0;

    wire weight_limit_exceeded;

    weight_control wc (
      .weight_flip(weight_flip),
      .weight_flip_reset(weight_flip_reset),
      .weight_limit_exceeded(weight_limit_exceeded)
    );
  
    initial begin
      #200;
      $finish;
    end

    always #1 clk = ~clk;
    always #5 weight_flip = ~weight_flip;

  always @(posedge weight_flip) begin
      if (weight_limit_exceeded <= 0)
        $monitor("O limite de peso não foi excedido - weight_limit_exceeded: %b", weight_limit_exceeded);
        else begin
	$monitor("O limite de peso foi excedido - weight_limit_exceeded: %b", weight_limit_exceeded);
	#1 weight_flip_reset <= ~weight_flip_reset;
	#1 weight_flip_reset <= ~weight_flip_reset;
        end
    end
endmodule
