module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_;
    always @(posedge clk) begin
        in_<=in;
        if (reset) begin
            out<=0;
        end
        else out<=out | (in_&~in); // SR Logic = Q* = S + ( Q & ~R ) 
    end
endmodule
