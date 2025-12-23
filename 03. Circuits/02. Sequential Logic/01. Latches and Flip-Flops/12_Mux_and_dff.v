module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    integer s;
    always @(posedge clk) begin
        case(L)
            1: Q<=R;
            0: begin
                case(E)
                    0: Q<=Q;
                    1: Q<=w;
                endcase
            end
        endcase
    end
endmodule
