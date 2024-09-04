module moving (
    clk,
    f1,
    f2,
    f3,
    door,
    moving
);
    input clk, f1, f2, f3, door;
    output moving;
    assign moving = ~door & ((~f1 & ~f2 & f3) | (~f1 & f2 & ~f3) | (f1 & ~f2 & ~f3));
endmodule
