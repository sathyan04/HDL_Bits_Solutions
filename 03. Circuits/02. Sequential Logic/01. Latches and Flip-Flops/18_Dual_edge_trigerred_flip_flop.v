module top_module (
    input clk,
    input d,
    output q
);
    reg [1:0] a;
    always @(posedge clk) begin
        a[0]<=d;
    end
    always @(negedge clk) begin
        a[1]<=d;
    end
    assign q = (clk) ? a[0] : a[1];
endmodule
