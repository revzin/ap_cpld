module freq_div(in, out);

input in;
output out;

reg[11 : 0] counter;

// входная частота -- 26 МГц, выходная 10 кГц, делим на 2600 
// 2600 "влезает" в 12 бит

always @(posedge in)
begin
	counter <= counter + 1;
	if (counter == 2600)
	begin
		counter <= 0;
		out <= ~out;
	end
end
endmodule
