module ending_change (
    co,
    clk,
    duration,
    song_done
);
    input co;
    input clk;
    input [5:0] duration;
    output song_done;

    wire in;
    wire q;

    assign in = co || (duration==0);
    assign song_done = in && ~q;

    dffre dffre_ending(
        .d(in),
        .en(1),
        .r(0),
        .clk(clk),
        .q(q)
    );

endmodule
    