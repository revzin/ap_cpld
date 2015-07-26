// ============================================================
// Преобразование сигнала управления сервоприводом в логический уровень
// Крайнее левое положние считается "0", крайнее правое "1"
// Обнаруживается отсутствие сигнала или его параметры неверны
`timescale 1us / 1us

module servo_to_logic(input wire servo_rise,          // передний фронт серво
                      input wire servo_fall,          // задний фронт серво
                      input wire clk,                 // такотовый сигнал 10 кГц
                      output logic log = 0,           // выходной логический уровень
                      output logic rx_problem = 1);   // флаг проблемы с приёмом (нет сигнала/неправильный сигнал)

parameter MAX_HIGH_COUNT = 30;  // верхний предел длительности импульса servo = 0
parameter MIN_HIGH_COUNT = 5;   // нижний предел длительности  импульса servo = 1
parameter LOGIC_THRESHOLD = 15; // если servo = 1 меньше, чем это время, считаем, что импульс кодирует ноль
parameter MAX_LOW_COUNT  = 250; // верхний предел servo = 0 (сигналы не могут приходить реже)
parameter MIN_LOW_COUNT = 230;  // нижний предел servo = 0 (сигналы не могут приходить чаще)

// При входной частоте 10 кГц:
// "крайнее левое" положение: 1,1 мс, 10-11 импульсов
// "крайнее правое" положение: 1,9 мс, 18-19 импульсов
// тогда "середина" где-то на 15 счётных импульсах
// всего 240 счётных импульсов на период

logic[7 : 0] counter = 0;                      // счётчик
logic servo_state = 0;

always_ff @(posedge clk)
begin
    counter <= counter + 1;                    // считаем новый такт
 
    if (servo_rise)                            // передний фронт servo
    begin
        servo_state <= 1;
        if (counter <= MIN_LOW_COUNT)          // новый сигнал пришёл сликом быстро
            rx_problem <= 1;
        counter <= 0;                          // начинаем счёт
    end
    else if (servo_fall)                       // задний фронт servo, заканчиваем счёт
    begin
        servo_state <= 0;
        // на входе действительно управляющий сигнал сервопривода?
        if (counter > MIN_HIGH_COUNT && counter < MAX_HIGH_COUNT)
        begin
            // если да, снимаем флаг проблемы и проверяем, сколько циклов servo = 1
            rx_problem <= 0;
            if (counter > LOGIC_THRESHOLD)
                log <= 1;
            else
                log <= 0;
        end
        else
            rx_problem <= 1;                   // сигнал не является управляющим сигналом сервопривода
    end 
 
    if (!servo_state && counter > MAX_LOW_COUNT)// сигнала нет слишком долго
    begin
        counter <= 0;
        rx_problem <= 1;
    end
 
    if (servo_state && counter > MAX_HIGH_COUNT)// servo = 1 слишком долго
    begin
        counter <= 0;
        rx_problem <= 1;
    end
end

endmodule
