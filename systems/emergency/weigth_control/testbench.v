module weight_control_tb;
reg weight_flip;
reg weight_flip_reset;
reg weight_limit_exceed;
reg [2:0] counter;
  
weight_control wc (
        .weight_flip(weight_flip),
        .weight_flip_reset(weight_flip_reset),
  		.weight_limit_exceeded(weight_limit_exceeded)
    );

initial begin
    weight_flip = 0;
    weight_flip_reset = 1;
  
   #200;
       
   $finish;
  
end

always #5 weight_flip = ~weight_flip;
always #50 weight_flip_reset = ~weight_flip_reset;

always @(posedge weight_flip) begin
  if (weight_limit_exceeded <= 1'b0)    
    $display("O limite de peso não foi excedido - weight_limit_exceeded: %b", weight_limit_exceeded);
    else
    $display("O limite de peso foi excedido - weight_limit_exceeded: %b", weight_limit_exceeded);
end

endmodule