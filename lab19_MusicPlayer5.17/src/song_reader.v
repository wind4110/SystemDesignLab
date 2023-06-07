module song_reader(
	song,
	clk,
	reset,
	note_done,
	play,
	song_done,
	new_note,
	note,
	duration
	);
	input [1:0] song;
	input clk;					//100MHz
	input reset;				//复位信号，高电平有效
	input note_done;			//下级模块的应答，表示一个音符结束，一个时钟周期脉冲
	input play;					//来自mcu的控制信号，高电平播放
	output song_done;			//通知mcu，一曲播放结束
	output new_note;			//控制下级模块，高电平播放音符
	output [5:0] note;			//音符标记
	output [5:0] duration;		//音符持续时间
	
	wire co;					//计数器进位
	wire [4:0] q;				//计数器状态
	
	//控制器
	control_reader control_reader(
		.clk(clk),
		.reset(reset),
		.note_done(note_done),
		.play(play),
		.new_note(new_note)
	);
	
	//地址计数器
	counter_n #(
		.n(32),
		.counter_bits(5)
	) counter_n_reader(
		.clk(clk),
		.r(reset),
		.en(note_done),
		.co(co),
		.q(q)
	);
	
	//乐曲存储
	song_rom song_rom_reader(
		.clk(clk),
		.dout({note,duration}),
		.addr({song,q})
	);
	
	//结束判断
	// ending_judge end_reader(
	// 	.duration(duration),
	// 	.co(co),
	// 	.clk(clk),
	// 	.song_done(song_done),
	// 	.reset(reset)
	// );
	ending_change end_reader(
		.duration(duration),
		.co(co),
		.clk(clk),
		.song_done(song_done)
	);


endmodule