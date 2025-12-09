module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire x,y,a,b;
    and(x,p1a,p1b,p1c);
    and(y,p1f,p1e,p1d);
    or(p1y,x,y);
    and(a,p2a,p2b);
    and(b,p2c,p2d);
    or(p2y,a,b);
endmodule
