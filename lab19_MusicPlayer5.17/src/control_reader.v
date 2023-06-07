module control_reader(
	clk,
	reset,
	note_done,
	play,
	new_note
	);
	
	input clk;
	input reset;
	input note_done;
	input play;
	output  reg new_note;
	
	parameter RESET = 0;
	parameter NEW_NOTE = 1;
	parameter WAIT = 2;
	parameter NEXT_NOTE = 3;
	reg [1:0] state, nextstate;
	
	always @(posedge clk) begin
		if(reset) state = RESET;
		else state = nextstate;
	end
	
	always @(*) begin
		new_note = 0;
		case (state)
			RESET:begin
				if(play) nextstate = NEW_NOTE;
				else nextstate = RESET;
			end
			NEW_NOTE:begin
				nextstate = WAIT;
				new_note = 1;
			end
			WAIT:begin
				if(~play) nextstate = RESET;
				else if(note_done) nextstate = NEXT_NOTE;
				else nextstate = WAIT;
			end
			NEXT_NOTE:begin
				nextstate = NEW_NOTE;
			end
		endcase
	end
endmodule