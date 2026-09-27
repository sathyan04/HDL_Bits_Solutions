module top_module(
    input clk,
    input reset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg present_state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(present_state)
            B: next_state = in ? B : A ;
            A: next_state = in ? A : B ;
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(reset) present_state<=B;
        else present_state<=next_state;
    end

    // Output logic
    assign out = (present_state == B);

endmodule
