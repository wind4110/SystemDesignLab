module beattimer (
    clk,
    r, 
    en, 
    co, 
    duration
);
    parameter counter_bits = 1;
    input r;
    input clk;
    input en;
    input [5:0] duration; 
    output co;
    reg [counter_bits-1:0] q;
    
    assign co=(q==(duration-1))&&en;
    always @(posedge clk) begin
        if(r) q=0;
        else begin
            if(en) begin
                if(q==duration-1) q=0;
                else q = q + 1;
            end
        end
    end
endmodule