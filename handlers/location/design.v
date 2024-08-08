module location
    (
        clk,
        st_button,
        nd_button,
        rd_button,
        st_sign,
        nd_sign,
        rd_sign
    );
    always @((st_button or nd_button or rd_button) and posedge clk)
        begin
            if (st_button) st_sign <= 1;
            else if (nd_button) nd_sign <= 1;
            else if (rd_button) rd_sign <= 1;
        end
endmodule