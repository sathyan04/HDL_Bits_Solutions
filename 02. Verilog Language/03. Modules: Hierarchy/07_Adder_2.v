module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire t1,t2,t3;
    add16 q1(.a(a[15:0]),.b(b[15:0]),.cin(t1),.sum(sum[15:0]),.cout(t2));
    add16 q2(.a(a[31:16]),.b(b[31:16]),.cin(t2),.sum(sum[31:16]),.cout(t3));
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(a&cin);
// Full adder module here

endmodule
