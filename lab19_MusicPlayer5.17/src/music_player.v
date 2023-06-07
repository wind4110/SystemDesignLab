module music_player (
    clk,
    reset,
    play_pause,
    next,
    NewFrame,
    sample,
    play,
    song
);
    parameter sim = 0;
    input clk;              //sys时钟
    input reset;            //高电平复�?
    input play_pause;       //“播�?/暂停”输�?
    input next;             //“下�?首�?�输�?
    input NewFrame;         //高电平非同步脉冲，索取新的样�?
    output [15:0] sample;   //正弦样品输出
    output play;            //播放状�?�指�?
    output [1:0] song;      //曲号指示

    wire reset_play;
    wire song_done;
    wire note_done;
    wire new_note;
    wire [5:0] note;
    wire [5:0] duration;
    wire ready;
    wire beat;
    wire sample_ready;

    //mcu
    mcu mcu_music(
        .clk(clk),
        .reset(reset),
        .play_pause(play_pause),
        .next(next),
        .play(play),
        .reset_play(reset_play),
        .song_done(song_done),
        .song(song)
    );

    //song_reader
    song_reader song_reader_music(
        .song(song),
        .clk(clk),
        .reset(reset_play),
        .note_done(note_done),
        .play(play),
        .song_done(song_done),
        .new_note(new_note),
        .note(note),
        .duration(duration)
    );

    //note_player
    note_player note_player_music(
        .clk(clk),
        .reset(reset_play),
        .play_enable(play),
        .note_to_load(note),
        .duration_to_load(duration),
        .load_new_note(new_note),
        .note_done(note_done),
        .sampling_pulse(ready),
        .beat(beat),
        .sample(sample),
        .sample_ready(sample_ready)
    );

    //synch
    synch_music synch_music(
        .in(NewFrame),
        .clk(clk),
        .out(ready)
    );

    //beat generation
    counter_n #(
        .n(sim?64:1000),
        .counter_bits(sim?6:10)
    ) counter_n_music(
        .clk(clk),
        .r(0),
        .en(ready),
        .co(beat),
        .q()
    );

endmodule