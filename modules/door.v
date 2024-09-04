module door (
    clk,
    moving,
    f1,
    f2,
    f3,
    door,
    weight_limit_exceeded
);
    input weight_limit_exceeded, clk, moving, f1, f2, f3;
    output door;
    assign door = (~moving & ((~f1 & ~f2 & f3) | (~f1 & f2 & ~f3) | (f1 & ~f2 & ~f3))) | weight_limit_exceeded;
endmodule
