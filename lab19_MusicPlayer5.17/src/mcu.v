module mcu  (
    clk,
    reset,
    play_pause,
    next,
    play,
    reset_play,
    song_done,
    song
);
    input clk;          //100MHz
    input reset;        //高电平有效?
    input play_pause;   //播放/暂停，一个时钟周期脉�?
    input next;         //下一曲，�?个时钟周期脉�? 
    output play;        //输出控制，高电平播放
    output reset_play;  //高电平复位，�?个时钟周期脉�?
    input song_done;    //下级模块的应答，表示�?曲结束，�?个时钟周期脉�?
    output [1:0] song;  //序号

    wire NextSong;


    control_mcu control_mcu(
        .play_pause(play_pause),
        .next(next),
        .song_done(song_done),
        .reset(reset),
        .clk(clk),
        .play(play),
        .reset_play(reset_play),
        .NextSong(NextSong)
    );

    counter_n #(
        .n(4),
        .counter_bits(2)
    ) counter_n_mcu(
        .clk(clk),
        .r(reset),
        .en(NextSong),
        .co(),
        .q(song)
    );


endmodule