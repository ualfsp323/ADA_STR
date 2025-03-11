with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;

procedure ejercicio5 is
   Hora_Actual : Time := Clock;
   
   Hora_Formateada : constant String := Image(Hora_Actual);
begin
   Put_Line("La hora actual es: " & Hora_Formateada);
end ejercicio5;
