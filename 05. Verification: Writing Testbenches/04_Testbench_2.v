module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    q7 dut(.clk(clk),.in(in),.s(s));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        in = 0;
        s = 3'd2;
        @(negedge clk);
        s = 3'd6;
        @(negedge clk);
        in = 1;
        s = 3'd2;
        @(negedge clk);
        in = 0;
        s = 3'd7;
        @(negedge clk);
        in = 1;
        s = 3'd0;
        repeat (3) @(negedge clk);
        in = 0;
    end
endmodule
