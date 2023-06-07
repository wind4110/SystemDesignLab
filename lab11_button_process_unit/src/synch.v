module synch (
    asynch_in,
    clk,
    synch_out,
);
    // // 当异步脉冲宽度小于时钟周期的电路
    // input clk;
    // input asynch_in;
    // output synch_out;

    // wire q1;
    // wire q2;

    // assign r = synch_out || 0;

    // dffre dffre_synch1(
    //     .d(1),
    //     .en(1),
    //     .r(r),
    //     .clk(asynch_in),
    //     .q(q1)
    // );

    // dffre dffre_synch2(
    //     .d(q1),
    //     .en(1),
    //     .r(0),
    //     .clk(clk),
    //     .q(q2)
    // );

    // dffre dffre_synch3(
    //     .d(q2),
    //     .en(1),
    //     .r(0),
    //     .clk(clk),
    //     .q(synch_out)
    // );

    // 当异步脉冲宽度大于时钟周期的电路
    input clk;
    input asynch_in;
    output synch_out;

    wire q1;

    dffre dffre_synch1(
        .d(asynch_in),
        .en(1),
        .r(0),
        .clk(clk),
        .q(q1)
    );

    dffre dffre_synch2(
        .d(q1),
        .en(1),
        .r(0),
        .clk(clk),
        .q(synch_out)
    );

endmodule