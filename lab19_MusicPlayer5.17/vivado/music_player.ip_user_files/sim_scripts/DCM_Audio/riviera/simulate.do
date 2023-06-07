onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+DCM_Audio -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.DCM_Audio xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {DCM_Audio.udo}

run -all

endsim

quit -force
