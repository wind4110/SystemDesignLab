module control_mcu (
    play_pause,
    next,
    song_done,
    reset,
    clk,
    play,
    reset_play,
    NextSong
);
    input play_pause;
    input next;
    input song_done;
    input reset;
    input clk;
    output reg play;
    output reg reset_play;
    output reg NextSong;     //下一曲信号

    //状态编码
    parameter RESET = 0;    //初始复位，直接进入PAUSE
    parameter PAUSE = 1;    //暂停状态，响应play_pause, next
    parameter PLAY = 2;     //播放状态，响应play_pause, next, song_done
    parameter NEXT = 3;     //下一首，直接进入PLAY
    reg [1:0] state,nextstate;

    //时序电路
    always @(posedge clk) begin
        if(reset) state = RESET;
        else state = nextstate;
    end

    //组合电路
    always @(*) begin
        play = 0;
        NextSong = 0;
        reset_play= 1;
        case (state)
            RESET:begin
                nextstate =  PAUSE;
            end
            PAUSE:begin
                if(play_pause) nextstate = PLAY;
                else if(next) nextstate = NEXT;
                else nextstate = PAUSE;
                reset_play = 0;
            end
            PLAY:begin
                if(play_pause) nextstate = PAUSE;
                else if(next) nextstate = NEXT;
                else if(song_done) nextstate = RESET;
                else nextstate = PLAY;
                play = 1;
                reset_play = 0;
            end
            NEXT:begin
                nextstate = PLAY;
                NextSong = 1;
            end
        endcase 
    end
endmodule