transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+E:/ap_cpld.git {E:/ap_cpld.git/mux2.sv}
vlog -sv -work work +incdir+E:/ap_cpld.git {E:/ap_cpld.git/servo_to_logic.sv}
vlog -sv -work work +incdir+E:/ap_cpld.git {E:/ap_cpld.git/freq_div.sv}
vlog -sv -work work +incdir+E:/ap_cpld.git {E:/ap_cpld.git/sync.sv}

