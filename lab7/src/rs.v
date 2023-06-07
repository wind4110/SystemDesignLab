module rsff (
    clk, r, s, q
);
    input clk, r, s;
    output q;
    reg q;
    always @(posedge clk) begin
        if(r==1&&s==1) q=1'bx;
	else if(r==1&&s==0) q=1'b0;
	else if(r==0&&s==1) q=1'b1;
    end
endmodule