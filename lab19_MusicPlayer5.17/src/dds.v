module dds (
    clk, 
	reset, 
	k, 
	sampling_pulse, 
	new_sample_ready, 
	sample
);

    input clk;
    input reset;
    input sampling_pulse;
    input [21:0] k;
    output [15:0] sample;
    output new_sample_ready;
    wire [21:0] raw_addr;
    wire [21:0] s1;
    wire area;
    reg [15:0] data;
    wire [15:0] raw_data;
    reg [9:0] rom_addr;

    fulladder_n #(.n(22)) adder1(.a(raw_addr), .b(k), .ci(0), .s(s1), .co());
    dffre #(.n(22)) dffre1(.d(s1), .en(sampling_pulse), .r(reset), .clk(clk), .q(raw_addr));
    dffre #(.n(1)) dffre2(.d(raw_addr[21]), .en(1), .r(0), .clk(clk), .q(area));
    dffre #(.n(1)) dffre3(.d(sampling_pulse), .en(1), .r(0), .clk(clk), .q(new_sample_ready));
    dffre #(.n(16)) dffre4(.d(data), .en(sampling_pulse), .r(0), .clk(clk), .q(sample));
    sine_rom sine(.clk(clk), .addr(rom_addr), .dout(raw_data));

    always @(*) 
    begin
        case(raw_addr[20])
            0: rom_addr = raw_addr[19:10];
            1: rom_addr = raw_addr[20:10]==1024?1023:~raw_addr[19:10]+1;
        endcase
    end

    always @(*) 
    begin
        case(area)
            0: data = raw_data;
            1: data = ~raw_data+1;
        endcase 
    end
endmodule