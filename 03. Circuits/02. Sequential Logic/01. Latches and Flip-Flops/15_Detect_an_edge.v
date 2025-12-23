module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] previous_in;
    always @(posedge clk) begin
        pedge<=in&~previous_in;
        previous_in<=in;
    end
endmodule
