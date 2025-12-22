module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0]couts;
  
    generate 
        genvar i;
        for (i=0; i<100; i=i+1) begin: bcdadd
        if(i==0) begin
            bcd_fadd inst(a[3:0], b[3:0], cin, couts[0],sum[3:0]);
	    end
        else begin
            bcd_fadd insta(a[(4*i+3):(4*i)], b[(4*i+3):(4*i)], couts[i-1],couts[i],sum[(4*i+3):(4*i)]); 
	    end
        end
    assign cout=couts[99];
    endgenerate
endmodule
