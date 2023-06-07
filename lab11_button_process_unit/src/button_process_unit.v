module button_unit (
    clk,
    reset,
    ButtonIn,
    led
); 
    parameter sim = 0;
    input reset;
    input ButtonIn;
    input clk;
    output led;
    wire ButtonOut;
    wire synch_out;
    wire debouncer_out;


    // 同步器
    synch synch_inst(
        .asynch_in(ButtonIn),
        .clk(clk),
        .synch_out(synch_out)
    );

    // 按键防颤
    debouncer #(.sim(sim))debouncer_inst(
        .clk(clk),
        .reset(reset),
        .in(synch_out),
        .out(debouncer_out)
    );

    //脉宽变换
    pulsecon pulsecon_inst(
        .clk(clk),
        .in(debouncer_out),
        .out(ButtonOut)
    );

    //附加测试电路
    dffre dffre_inst(
        .clk(clk),
        .d(~led),
        .en(ButtonOut),
        .r(reset),
        .q(led)
    );

endmodule