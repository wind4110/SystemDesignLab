module pulsecon (
    clk,
    in,
    out,
);
    // 脉宽变换，把输入信号宽度变换为一个时钟周期
    input clk;
    input in;
    output out;

    wire q;
    
    assign out = ~q && in;

    dffre dffre_pulse(
        .d(in),
        .en(1),
        .r(0),
        .clk(clk),
        .q(q)
    );
endmodule