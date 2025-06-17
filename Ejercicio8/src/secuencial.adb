with Ada.Text_IO; use Ada.Text_IO;

procedure Secuencial is
   N : constant Integer := 5; -- Número de iteraciones
begin
   for i in 1..N loop
      Put_Line("Tarea A: " & Integer'Image(i));
      Put_Line("Tarea B: " & Integer'Image(i));
      Put_Line("Tarea C: " & Integer'Image(i));
   end loop;
end Secuencial;
