with Putter; use Putter;

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
   delay 1.0;  -- Espera a que terminen las tareas
   Dump_Output;  -- ¡Aquí se imprime todo de una vez!
end Main_No_Mutex;
