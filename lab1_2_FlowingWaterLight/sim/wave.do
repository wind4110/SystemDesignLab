onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FlowingWateLight_tb/clk
add wave -noupdate /FlowingWateLight_tb/reset
add wave -noupdate /FlowingWateLight_tb/direction
add wave -noupdate -radix binary /FlowingWateLight_tb/led
add wave -noupdate /FlowingWateLight_tb/FlowingWateLight_inst/pulse2Hz
add wave -noupdate /FlowingWateLight_tb/FlowingWateLight_inst/q
add wave -noupdate /FlowingWateLight_tb/FlowingWateLight_inst/decode_inst/out
add wave -noupdate /FlowingWateLight_tb/FlowingWateLight_inst/decode_inst/din
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1715254 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 406
configure wave -valuecolwidth 60
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {650658 ps}
