`timescale 1ns / 1ps

module synch_tb;
    parameter  delay = 10 ;
    //Inputs
    reg clk;
    reg in;

    //Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    synch_music uut(
        .clk(clk),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        in = 0;

        repeat (40)
		begin 
        #(delay*2)  in = 1;
		  #(delay*2)   in = 0;
		end 
        
    end

    always #(delay/2) clk=~clk;

endmodule