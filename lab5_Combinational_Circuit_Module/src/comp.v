module comp (
    a,
    b,
    agb,
    aeb,
    alb
);
    parameter n = 1;// 参数表示比较器的位数
    input [n-1:0] a,b;
    output agb; // a大于b
    output aeb; // a等于b
    output alb; // a小于b
    reg agb, aeb, alb;
    always @(a or b) begin
        if (a > b)  begin
            agb = 1;
            aeb = 0;
            alb = 0;
        end
        else if (a == b) begin
            agb = 0;
            aeb = 1;
            alb = 0;
        end
        else begin
            agb = 0;
            aeb = 0;
            alb = 1;
        end
    end
endmodule