set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN Y13 [get_ports {led[7]}]
set_property PACKAGE_PIN W15 [get_ports {led[6]}]
set_property PACKAGE_PIN W16 [get_ports {led[5]}]
set_property PACKAGE_PIN V15 [get_ports {led[4]}]
set_property PACKAGE_PIN U16 [get_ports {led[3]}]
set_property PACKAGE_PIN T16 [get_ports {led[2]}]
set_property PACKAGE_PIN T15 [get_ports {led[1]}]
set_property PACKAGE_PIN T14 [get_ports {led[0]}]
set_property PACKAGE_PIN R4 [get_ports clk]
set_property PACKAGE_PIN E22 [get_ports direction]
set_property PACKAGE_PIN B22 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports direction]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]