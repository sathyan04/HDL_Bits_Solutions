module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0] shift;
    always @(posedge clk) begin
        if(!resetn)
            shift<=4'd0;
        else
            shift<={shift[2:0],in};
    end
    assign out=shift[3];
endmodule
