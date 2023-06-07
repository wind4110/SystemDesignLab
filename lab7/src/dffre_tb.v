`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: zju
// Engineer:qmj
// Create Date:   15:38:44 07/31/2012
// Design Name:   dffre
// Module Name:   E:/solution/lab30/DESIGN1/ise/dffre_tb.v
// Project Name:  TimerTop
// Verilog Test Fixture created by ISE for module: dffre

////////////////////////////////////////////////////////////////////////////////

module dffre_tb_v;

	// Inputs
	reg d;
	reg en;
	reg r;
	reg clk;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	dffre #(.n(1))dffreInst (
		.d(d), 
		.en(en), 
		.r(r), 
		.clk(clk), 
		.q(q)
	);
	//clk
   always #5 clk=~clk;
	initial begin
			d = 0;
			en = 0;
			r = 0;
			clk = 0;
		#6	r = 1;d = 1;
		#10	r = 0;
		#20	d = 1;
		#10  	en = 1;
		#10	d = 1;
		#20     d = 0;
		#20     d = 1;
		#20   $stop;
		

	end
      
endmodule

