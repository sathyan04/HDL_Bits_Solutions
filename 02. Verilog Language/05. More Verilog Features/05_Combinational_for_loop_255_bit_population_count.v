module top_module( 
    input [254:0] in,
    output [7:0] out );
	integer i;
    reg [7:0]count;
    always @(*) begin
        count=8'b0;
        for(i=0;i<255;i++)
            if(in[i]==1'b1) 
                count=count+1;
    end
    assign out=count;
endmodule
