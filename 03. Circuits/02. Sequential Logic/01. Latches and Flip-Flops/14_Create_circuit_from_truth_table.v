module top_module (
    input clk,
    input j,
    input k,
    output Q); 
reg w;
    always @(posedge clk) begin
        w<=(j&~Q)|(~k&Q);
    end
    assign Q=w;
endmodule
