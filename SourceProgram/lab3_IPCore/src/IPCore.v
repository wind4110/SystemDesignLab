
module IPCore(  
    input  clk,  // 100MHz 
    input reset, 
    output [2:0] TMDSp, TMDSn,  
    output TMDSp_clk, TMDSn_clk  
);  
//DCM实例
 wire   pixel_clk,tmds_clk;   
 DCM_PLL DCM_INST(  
  .clk_in1(clk), //CLK100M IN   
  .clk_out1(pixel_clk),//CLK25M_OUT   
  .clk_out2(tmds_clk),//CLK250M_OUT   
  .locked(),  
  .reset(1'b0)  
 );  
 
//同步发生器实例
wire[9:0] PosX;
wire[8:0] PosY;
wire hSync,vSync,DE;
syncGenarator sync_inst(  
    .pixel_clk(pixel_clk), // 
    .reset(0), 
    .PosX(PosX) , 
    .PosY(PosY) , 
    .hSync(hSync) ,
    .vSync(vSync) , 
    .ActiveArea(DE));  
 
//视频数据（vga_data�?

 wire[9:0] DispX;
 wire[8:0] DispY;
 assign DispX=PosX-256;
 assign DispY=PosY-184;
 reg [11 : 0] addr; 
// assign addr={DispY[5:0],DispX[5:0]};
 
 always @(*)
  case({DispY[6],DispX[6]})
    0:addr={DispY[5:0],DispX[5:0]};
	1:addr={DispY[5:0],~DispX[5:0]};
	2:addr={~DispY[5:0],DispX[5:0]};
	3:addr={~DispY[5:0],~DispX[5:0]};
  endcase
  
 wire[7:0] Picture_red,Picture_blue,Picture_green;
 wire  PictureEN;
 assign PictureEN=(PosX>=256)&&(PosX<384)&&(PosY>=184)&&(PosY<312);
 
 //PictureROM实例
PictureROM   ROMInst (
		.a(addr),
		.clk(pixel_clk),
		.qspo( {Picture_red,Picture_blue,Picture_green}),
		.qspo_ce(1)   
		);
 //
wire[7:0] red ,green,blue;
assign red  =PictureEN?Picture_red:  8'd0;
assign blue =PictureEN?Picture_green: 8'd0;
assign green=PictureEN?Picture_blue:8'd0;

//TMDS编码实例
wire TMDSch0,TMDSch1,TMDSch2;
 
 TMDSencode  TMDS_inst(  
    //时钟
	.tmds_clk(tmds_clk),  //  
    .pixel_clk(pixel_clk), 
	//复位信号，高电平有效
	.reset(reset),
    //视频信号
    .red(red),
	.green(green),
	.blue(blue),
	.hSync(hSync),
	.vSync(vSync),
	.ActiveArea(DE),
	//TMDS通道输出数据
    .TMDSch0(TMDSch0),
	.TMDSch1(TMDSch1),
	.TMDSch2(TMDSch2)
); 
//HDMI 差分输出
OBUFDS OBUFDS_red  (.I(TMDSch2), .O(TMDSp[2]), .OB(TMDSn[2]));  
OBUFDS OBUFDS_green(.I(TMDSch1), .O(TMDSp[1]), .OB(TMDSn[1]));  
OBUFDS OBUFDS_blue (.I(TMDSch0), .O(TMDSp[0]), .OB(TMDSn[0]));  
OBUFDS OBUFDS_clk(.I(pixel_clk), .O(TMDSp_clk), .OB(TMDSn_clk));   
	  
   
endmodule   
