onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib PictureROM_opt

do {wave.do}

view wave
view structure
view signals

do {PictureROM.udo}

run -all

quit -force
