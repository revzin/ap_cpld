onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /servo_to_logic/counter
add wave -noupdate /servo_to_logic/log
add wave -noupdate /servo_to_logic/rx_problem
add wave -noupdate /servo_to_logic/servo_rise
add wave -noupdate /servo_to_logic/servo_fall
add wave -noupdate /servo_to_logic/clk
add wave -noupdate /servo_to_logic/servo_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {26000 us} 1} {{Cursor 3} {50000 us} 1} {{Cursor 4} {74000 us} 1} {{Cursor 5} {98000 us} 1} {{Cursor 6} {122000 us} 1} {{Cursor 7} {2000 us} 1} {Work {26069 us} 0}
quietly wave cursor active 7
configure wave -namecolwidth 281
configure wave -valuecolwidth 39
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
configure wave -timelineunits ms
update
WaveRestoreZoom {24278 us} {33886 us}
view wave 
wave clipboard store
wave create -pattern none -portmode input -language vlog /servo_to_logic/servo_rise 
wave create -pattern none -portmode input -language vlog /servo_to_logic/servo_fall 
wave create -pattern none -portmode input -language vlog /servo_to_logic/clk 
wave create -pattern none -portmode output -language vlog /servo_to_logic/log 
wave create -pattern none -portmode output -language vlog /servo_to_logic/rx_problem 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ms -endtime 250ms Edit:/servo_to_logic/servo_fall 
wave edit invert -start 3900us -end 4000us Edit:/servo_to_logic/servo_fall 
wave edit invert -start 27100 -end 27200 Edit:/servo_to_logic/servo_fall 
wave create -pattern none -portmode input -language vlog /servo_to_logic/servo_rise 
wave create -pattern none -portmode input -language vlog /servo_to_logic/servo_fall 
wave create -pattern none -portmode input -language vlog /servo_to_logic/clk 
wave create -pattern none -portmode output -language vlog /servo_to_logic/log 
wave create -pattern none -portmode output -language vlog /servo_to_logic/rx_problem 
wave modify -driver freeze -pattern clock -initialvalue (no value) -period 100us -dutycycle 10 -starttime 0ms -endtime 250ms Edit:/servo_to_logic/clk 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ms -endtime 250ms Edit:/servo_to_logic/servo_rise 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ms -endtime 250ms Edit:/servo_to_logic/servo_fall 
wave edit invert -start 2ms -end 2100us Edit:/servo_to_logic/servo_rise 
wave edit invert -start 3900us -end 4000us Edit:/servo_to_logic/servo_fall 
wave edit invert -start 26000 -end 26100 Edit:/servo_to_logic/servo_rise 
wave edit invert -start 27100 -end 27200 Edit:/servo_to_logic/servo_fall 
wave edit invert -start 50ms -end 50100us Edit:/servo_to_logic/servo_rise 
wave edit invert -start 51300us -end 51400us Edit:/servo_to_logic/servo_fall 
wave edit invert -start 74ms -end 74100us Edit:/servo_to_logic/servo_rise 
wave edit invert -start 75800us -end 75900us Edit:/servo_to_logic/servo_fall 
WaveCollapseAll -1
wave clipboard restore
