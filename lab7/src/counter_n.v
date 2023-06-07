module counter_n (
    clk, r, en, co, q
);
    parameter n = 2;
    parameter counter_bits = 1;
    input r,clk,en;
    output co;
    output [counter_bits-1:0] q;
    reg [counter_bits-1:0] q=0;
    
    assign co=(q==(n-1))&&en;
    always @(posedge clk) begin
        if(r) q=0;
        else begin
            if(en) begin
                if(q==n-1) q=0;
                else q = q+1;
            end
        end
    end
endmodule