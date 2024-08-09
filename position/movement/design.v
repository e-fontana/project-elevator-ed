module movement #(parameter st_floor = 2'b00, nd_floor = 2'b01, rd_floor = 2'b10) (clk, st_led, nd_led, rd_led, up_led, down_led, current_floor);

  input clk, current_floor, st_led, nd_led, rd_led;
  output up_led, down_led;

  reg [1:0] future_floor;

  always @(posedge clk) current_floor <= future_floor;

  always @(current_floor or st_led or nd_led or rd_led) begin
    case (current_floor)
      st_floor:
        case ({st_led, nd_led, rd_led})
          3'b000: begin
            future_floor = st_floor;
            up_led = 1'b0; 
            down_led = 1'b0;
          end
          3'b001: begin
            future_floor = nd_floor;
            up_led = 1'b1;
            down_led = 1'b0;
          end
          3'b010: begin
            future_floor = nd_floor;
            up_led = 1'b1;
            down_led = 1'b0;
          end
          3'b011: begin
            future_floor = nd_floor;
            up_led = 1'b1;
            down_led = 1'b0;
          end
          3'b100: begin
            future_floor = st_floor;
            up_led = 1'b0;
            down_led = 1'b0;
          end
          3'b101: begin
            future_floor = st_floor;
            up_led = 1'b1;
            down_led = 1'b0;
          end
          3'b110: begin
            future_floor = st_floor; 
            up_led = 1'b1;
            down_led = 1'b0;
          end
          3'b111: begin
            future_floor = st_floor;
            up_led = 1'b1;
            down_led = 1'b0;
          end
        endcase

      nd_floor:
        case ({st_led, nd_led, rd_led})
          3'b000: begin
            future_floor = nd_floor;
            up_led = 1'b0;
            down_led = 1'b0;
          end
          3'b001: begin
            future_floor = rd_floor;
            up_led = 1'b1;
            down_led = 1'b0;
          end
          3'b010: begin
            future_floor = nd_floor;
            up_led = 1'b0;
            down_led = 1'b0;
          end
          3'b011: begin
            future_floor = nd_floor;
            up_led = 1'b1;
            down_led = 1'b0;
          end
          3'b100: begin
            future_floor = st_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b101: begin
            future_floor = st_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b110: begin
            future_floor = nd_floor; 
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b111: begin
            future_floor = nd_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
        endcase

      rd_floor:
        case ({st_led, nd_led, rd_led})
          3'b000: begin
            future_floor = rd_floor;
            up_led = 1'b0;
            down_led = 1'b0;
          end
          3'b001: begin
            future_floor = rd_floor;
            up_led = 1'b0;
            down_led = 1'b0;
          end
          3'b010: begin
            future_floor = nd_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b011: begin
            future_floor = rd_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b100: begin
            future_floor = nd_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b101: begin
            future_floor = rd_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b110: begin
            future_floor = nd_floor; 
            up_led = 1'b0;
            down_led = 1'b1;
          end
          3'b111: begin
            future_floor = rd_floor;
            up_led = 1'b0;
            down_led = 1'b1;
          end
        endcase
    endcase
  end

endmodule