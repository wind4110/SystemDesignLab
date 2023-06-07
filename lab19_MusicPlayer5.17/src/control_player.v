module control_player(
    clk,
    reset,
    play_enable,
    load_new_note,
    load,
    note_done,
    timer_clear,
    timer_done
);
    input clk;
    input reset;
    input play_enable;
    input load_new_note;
    input timer_done;
    output reg load;
    output reg note_done;
    output reg timer_clear;

    parameter RESET = 0;        //复位未播放状态，不输出正弦杨样品
    parameter PLAY = 1;         //音符播放
    parameter DONE = 2;         //播放结束索取新音符
    parameter LOAD = 3;         //读取新音符
    reg [1:0] state, nextstate;

    always @(posedge clk) begin
        if(reset) state = RESET;
        else state = nextstate;
    end

    always @(*) begin
        timer_clear = 1;
        load = 0;
        note_done = 0;
        case (state)
            RESET:begin
                nextstate = PLAY;
            end
            PLAY:begin
                if(~play_enable) nextstate = RESET;
                else if(timer_done) nextstate = DONE;
                else if(load_new_note) nextstate = LOAD;
                else nextstate = PLAY; 
                timer_clear = 0;
            end
            DONE:begin
                nextstate = PLAY;
                note_done = 1;
            end
            LOAD:begin
                nextstate = PLAY;
                load = 1;
            end
        endcase
    end
endmodule

