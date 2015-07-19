module mux2(input wire autopilot_signal, 
				input wire radio_signal, 
				input wire autopilot_active, 
				output logic muxed_signal = 0);

always @(*)
	if (autopilot_active == 1)
		muxed_signal <= autopilot_signal;
	else
		muxed_signal <= radio_signal;	

endmodule
