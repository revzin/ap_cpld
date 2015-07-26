module freq_div(input wire in, output logic out = 0);

logic[11 : 0] counter = 0;

// входная частота -- 26 МГц, выходная 10 кГц, делим на 2600 
// 2600 "влезает" в 12 бит

always_ff @(posedge in)
begin
   counter <= counter + 1;
   if (counter == 2600)
	begin
      counter <= 0;
      out <= ~out;
   end
end
endmodule
