module ending_judge(
	duration,
	co,
	clk,
	song_done,
	reset,
	);
	input [5:0] duration;
	input co;
	input reset;
	input clk;
	output reg song_done;
	
	parameter RST = 0;
	parameter PLAY = 1;     //正常播放状态
	parameter ENDING = 2;   //乐曲结束状态，输出结束判断
	reg [1:0] state,nextstate;
	
	//时序电路
	always @(posedge clk) begin
		if(reset) state = RST;
		else state = nextstate;
	end

	//组合电路
	always @(*) begin
		song_done = 0;
		case (state)
			RST:begin
				if(duration != 0) nextstate = PLAY;
				else nextstate = RST;
			end
			PLAY:begin
				if(co || duration==0)	nextstate = ENDING;
				else nextstate = PLAY;
			end
			ENDING:begin
				nextstate = RST;
				song_done = 1;
			end
			default:nextstate = RST;
		endcase
	end
endmodule