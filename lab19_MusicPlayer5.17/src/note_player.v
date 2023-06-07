module note_player (
	clk,
	reset,
	play_enable,
	note_to_load,
	duration_to_load,
	load_new_note,
	note_done,
	sampling_pulse,
	beat,
	sample,
	sample_ready
	);
	
	input clk;						//100MHz
	input reset;					//高电平复位
	input play_enable;				//来自mcu的控制，高电平播放
	input [5:0] note_to_load;		//音符标记
	input [5:0] duration_to_load;	//音符时间
	input load_new_note;			//新的音符需要播放
	output note_done;				//给song_reader的应答信号，表示音符播放完毕
	input sampling_pulse;			//来自同步化电路的ready信号，48kHz, 表示索取新的正弦样品
	input beat;						//定时基准信号，48Hz
	output [15:0] sample;			//正弦样品输出
	output sample_ready;
	
	wire load;
	wire [5:0] addr;
	wire [19:0] dout;
	wire [21:0] k;
	wire timer_clear;
	wire timer_done;
	
    assign k = {2'b00,dout};

	//note_player控制器
	control_player control_player(
		.clk(clk),
		.reset(reset),
		.play_enable(play_enable),
		.load_new_note(load_new_note),
		.load(load),
		.note_done(note_done),
		.timer_clear(timer_clear),
		.timer_done(timer_done)
	);
	
	//音符节拍定时器
	beattimer #(
		.counter_bits(6)
	)	beattimer_player(
		.clk(clk),
		.r(timer_clear),
		.en(beat),
		.co(timer_done),
		.duration(duration_to_load)
	);
	
	//D寄存器
	dffre #(
		.n(6)
	) dffre_player(
		.d(note_to_load),
		.en(load),
		.r(~play_enable || reset),
		.clk(clk),
		.q(addr)
	);
	
	//FreqROM
	frequency_rom FreqROM_player (
		.clk(clk),
		.addr(addr),
		.dout(dout)
	);

	//DDS
	dds dds_player(
		.clk(clk),
		.reset(~play_enable || reset),
		.k(k),
		.sampling_pulse(sampling_pulse),
		.sample(sample),
		.new_sample_ready(sample_ready)
	);

endmodule