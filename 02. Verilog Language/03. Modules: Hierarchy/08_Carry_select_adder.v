module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1,w2,w3,w4,w5,w6;
    wire [15:0] s1,s2,s3;
    reg [15:0]s4;
    assign w1=1'b0;
    assign w3=1'b0;
    assign w5=1'b1;
    add16 d1(.a(a[15:0]),.b(b[15:0]),.cin(w1),.sum(s1),.cout(w2));
    add16 d2(.a(a[31:16]),.b(b[31:16]),.cin(w3),.sum(s2),.cout(w4));
    add16 d3(.a(a[31:16]),.b(b[31:16]),.cin(w5),.sum(s3),.cout(w6));
    always @(*) begin
        case(w2)
            1'b0: s4=s2;
            1'b1: s4=s3;
        endcase
    end
    assign sum={s4,s1};
endmodule
