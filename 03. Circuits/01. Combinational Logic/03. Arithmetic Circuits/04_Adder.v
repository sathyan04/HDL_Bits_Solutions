module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    reg [4:0] carry;
    integer i;
    always @(*) begin
        carry[0]=1'b0;
        for(i=0;i<4;i++)begin
            {carry[i+1],sum[i]}=x[i]+y[i]+carry[i];
        end
    end
    assign sum[4]=carry[4];
endmodule
