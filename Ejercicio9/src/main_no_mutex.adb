with Putter; use Putter;
with Ada.Task_Identification; use Ada.Task_Identification;

procedure Main_No_Mutex is
   task A;
   task B;
   task C;

   N : constant := 5; -- Número de iteraciones

   task body A is
   begin
      for i in 1..N loop
         Put_Line("Tarea A: " & Integer'Image(i));
         delay 0.1;
      end loop;
   end A;

   task body B is
   begin
      for i in 1..N loop
         Put_Line("Tarea B: " & Integer'Image(i));
         delay 0.1;
      end loop;
   end B;

   task body C is
   begin
      for i in 1..N loop
         Put_Line("Tarea C: " & Integer'Image(i));
         delay 0.1;
      end loop;
   end C;

begin
   -- Espera suficiente para que todas las tareas terminen
   delay 1.5;  -- Aumentado para dar tiempo a las escrituras con delay
end Main_No_Mutex;
