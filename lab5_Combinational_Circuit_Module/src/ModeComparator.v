module ModeComparator (a,b,m,out);
  input [7:0] a, b;
  input m;
  output [7:0] out;
  wire agb;
  comp #(.n(8))comp_1(.a(a), .b(b), .agb(agb), .aeb(), .alb());
  mux_2to1 #(.n(8))mux_1(.out(out), .in0(a), .in1(b), .addr((m && agb || ~m && ~agb)));
endmodule