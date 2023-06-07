module control (
    clk,
    in,
    reset,
    timer_done,
    timer_clr,
    out,
);
    input clk;
    input in;
    input reset;
    input timer_done;
    output reg timer_clr;
    output reg out;

    //状态编码
    parameter LOW = 0;             //一般情况下等待
    parameter WAIT_HIGH = 1;       //检测到in=1，按键按下的不稳定状态
    parameter HIGH = 2;            //10ms后，按键的稳定状态
    parameter WAIT_LOW = 3;        // 检测到in=0，按键放开后的第二个不稳定状态
    reg [1:0] state,nextstate;

    //第一段时序电路：D寄存器
    always @(posedge clk) begin
        if(reset) state = LOW;
        else state = nextstate; 
    end

    //第二段组合电路：下一状态和输出电路
    always @(*) begin
        timer_clr = 1; //重置计时器
        out = 0; //防颤按键输出
        case (state)
            LOW:begin
                if(in) nextstate = WAIT_HIGH;
                else nextstate = LOW;
            end
            WAIT_HIGH:begin
                if(timer_done) nextstate = HIGH;
                else nextstate = WAIT_HIGH;
                timer_clr = 0;
                out = 1;
            end
            HIGH:begin
                if(~in) nextstate = WAIT_LOW;
                else nextstate = HIGH;
                out = 1;
            end
            WAIT_LOW:begin
                if(timer_done) nextstate = LOW;
                else nextstate = WAIT_LOW;
                timer_clr = 0;
                out = 1;
            end
        endcase
    end

endmodule