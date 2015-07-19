// Детектор/синхронизатор переднего и заднего фронтов асинхронного импульса
module sync(input wire signal, // асинхронный сигнал 
            input logic clk,   // часы
			   output wire rise,  // выход активен один такт при наличии передн. фронта
			   output wire fall   // выход активен один такт при наличии задн. фронта
				);

logic signal_sync = 0;
logic prev = 0;

always_ff @(posedge clk)
begin
   signal_sync <= signal;		// делаем фронты сигнала синхронным с часами
   prev <= signal_sync;			// сохраняем предыдущее значение сигнала
end

assign fall = !signal_sync & prev; // задний фронт
assign rise = signal_sync & !prev; // передний фронт

endmodule
