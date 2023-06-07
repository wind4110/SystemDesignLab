// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed May 24 16:42:48 2023
// Host        : DESKTOP-FE9FEV0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/MyFiles/sophomore2/SystemDesignLab/lab19_MusicPlayer5.17/vivado/music_player.srcs/sources_1/ip/DCM_MUSIC/DCM_MUSIC_stub.v
// Design      : DCM_MUSIC
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module DCM_MUSIC(clk_out1, clk_out2, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,reset,locked,clk_in1" */;
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1;
endmodule
