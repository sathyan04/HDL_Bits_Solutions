module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire c2,c3,c4;
    bcd_fadd b1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(c2),.sum(sum[3:0]));
    bcd_fadd b2(.a(a[7:4]),.b(b[7:4]),.cin(c2),.cout(c3),.sum(sum[7:4]));
    bcd_fadd b3(.a(a[11:8]),.b(b[11:8]),.cin(c3),.cout(c4),.sum(sum[11:8]));
    bcd_fadd b4(.a(a[15:12]),.b(b[15:12]),.cin(c4),.cout(cout),.sum(sum[15:12]));
endmodule
