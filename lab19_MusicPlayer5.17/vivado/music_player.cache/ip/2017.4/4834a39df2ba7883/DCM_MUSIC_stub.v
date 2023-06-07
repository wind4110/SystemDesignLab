// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed May 24 16:39:35 2023
// Host        : DESKTOP-FE9FEV0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ DCM_MUSIC_stub.v
// Design      : DCM_MUSIC
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(sys_clk, audio_clk, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="sys_clk,audio_clk,reset,locked,clk_in1" */;
  output sys_clk;
  output audio_clk;
  input reset;
  output locked;
  input clk_in1;
endmodule
