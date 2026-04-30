module top_module ();
    reg clk, reset, t;
    wire q;
    tff dut(clk,reset,t,q);
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    initial begin
        reset = 1;
        t = 0;
        #20;
        reset = 0;
        t = 1;
    end
endmodule
