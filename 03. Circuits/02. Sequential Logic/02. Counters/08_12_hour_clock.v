module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    always @(posedge clk) begin
        
        if (reset) begin
            pm<=0;
            hh<=8'h12;
            mm<=8'h00;
            ss<=8'h00;
        end
        
        else begin
            if (ena) begin
                // seconds
                if (ss[3:0] == 4'd9) begin // Since it is a BCD, I cannot state it as 59 directly
                    ss[3:0] <= 4'd0; // So we are separating them as two nimbles
                    if (ss[7:4] == 4'd5) begin
                        ss[7:4] <= 4'd0;
                        // if 60 seconds completed, a minute will fall, thats what Im trying to prove here
                        // Minutes
                        if (mm[3:0] == 4'd9) begin 
                            mm[3:0] <= 4'd0; 
                            if (mm[7:4] == 4'd5) begin
                                mm[7:4] <= 4'd0;
                                //Hours - same as the above, but here after 12, 01 must be updated
                                if (hh == 8'h12) begin
                                    hh <= 8'h01;
                                end
                                else if (hh == 8'h11) begin
                                    hh <= 8'h12;
                                    pm <= ~pm;
                                end
                                else begin
                                    if (hh[3:0] == 4'd9) begin
                                        hh[3:0] <= 4'd0;
                                        hh[7:4] <= hh[7:4] + 4'd1;
                                    end
                                    else begin
                                        hh[3:0] <= hh[3:0] + 4'd1;
                                    end
                                end
                            end
                            else begin
                                mm[7:4] <= mm[7:4] + 4'd1;
                            end
                        end
                    
                        else begin
                            mm[3:0] <= mm[3:0] + 4'd1;
                        end
                        
                    end
                    else begin
                        ss[7:4] <= ss[7:4] + 4'd1;
                    end
                end
                else begin
                    ss[3:0] <= ss[3:0] + 4'd1;
                end
                
            end
        end
        
    end
                
endmodule
