module timer (
    clk, r, en, done
);
    parameter n = 2;
    parameter counter_bits = 1;
    input clk, r, en;
    output done;
    reg [counter_bits-1:0] q;
    assign done = (q==n-1) && en;
    always @(posedge clk) begin
        if(r) q=0;
        else begin
            if(en) q=q+1;
        end
    end
endmodule