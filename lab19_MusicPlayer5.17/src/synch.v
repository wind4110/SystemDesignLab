module synch_music (
    in,
    clk,
    out,
);
    //同步器+脉冲变换电路
    input in;
    input clk;
    output out;

    wire q1;
    wire q2;

    dffre dffre_synch1(
        .d(in),
        .en(1),
        .clk(clk),
        .r(0),
        .q(q1)
    );

    dffre dffre_synch2(
        .d(q1),
        .en(1),
        .clk(clk),
        .r(0),
        .q(q2)
    );

    assign out = q1 && ~q2;

endmodule