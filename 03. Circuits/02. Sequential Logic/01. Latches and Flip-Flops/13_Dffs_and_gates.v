module top_module (
    input clk,
    input x,
    output z
); 
    parameter [2:0] s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7;
    reg [2:0] state,next;
    always @(posedge clk) begin
        state<=next;
    end
    always @(*) begin
        case(state)
            s0 : next = x ? s7 : s1 ;
            s1 : next = x ? s7 : s0 ;
            s2 : next = x ? s5 : s1 ;
            s3 : next = x ? s5 : s0 ;
            s4 : next = x ? s3 : s5 ;
            s5 : next = x ? s3 : s4 ;
            s6 : next = x ? s1 : s5 ;
            s7 : next = x ? s1 : s4 ;
        endcase
    end
    assign z = (state==s0);
endmodule
