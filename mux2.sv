module mux2(autopilot_signal, radio_signal, autopilot_active, muxed_signal);

input autopilot_signal;
input radio_signal;
input autopilot_active;

output muxed_signal;

always @(*)
	if (autopilot_active == 1)
		muxed_signal = autopilot_signal;
	else
		muxed_signal = radio_signal;	

endmodule
