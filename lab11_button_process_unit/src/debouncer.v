module debouncer  (
    clk,
    reset,
    in,
    out
);
    parameter sim = 0;
    input clk;
    input reset;
    input in;
    output out;

    wire timer_clr;
    wire timer_done;
    wire pulse1kHz;
    
    counter_n #(
        .n(sim?32:10**5),
        .counter_bits(sim?5:17)
    ) Div(
        .clk(clk),
        .r(0),
        .en(1),
        .co(pulse1kHz),
        .q()
    );

    timer #(
        .n(10),
        .counter_bits(4)
    ) TimerInst(
        .clk(clk),
        .r(timer_clr),
        .en(pulse1kHz),
        .done(timer_done)
    );

    control control_inst(
        .clk(clk),
        .in(in),
        .reset(reset),
        .timer_done(timer_done),
        .timer_clr(timer_clr),
        .out(out)
    );
endmodule