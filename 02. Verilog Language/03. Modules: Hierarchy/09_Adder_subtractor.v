module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] sub1,b_;
    wire w2,w3;
    assign sub1={32{sub}};
    assign b_=b^sub1;
    add16 a1(.a(a[15:0]),.b(b_[15:0]),.cin(sub),.sum(sum[15:0]),.cout(w2));
    add16 a2(.a(a[31:16]),.b(b_[31:16]),.cin(w2),.sum(sum[31:16]),.cout(w3));
endmodule
