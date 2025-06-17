with Putter; use Putter;
with Semaphores; use Semaphores;

procedure Main_With_Mutex is
   Mutex : Semaphore(Initial => 1);  -- Semáforo binario para exclusión mutua
   
   task A;
   task B;
   task C;
   
   N : constant := 5; -- Número de iteraciones
   
   task body A is
   begin
      for i in 1..N loop
         Wait(Mutex);    -- Adquiere el mutex
         Put_Line("Tarea A: " & Integer'Image(i));
         Signal(Mutex);  -- Libera el mutex
         delay 0.1;
      end loop;
   end A;
   
   task body B is
   begin
      for i in 1..N loop
         Wait(Mutex);    -- Adquiere el mutex
         Put_Line("Tarea B: " & Integer'Image(i));
         Signal(Mutex);  -- Libera el mutex
         delay 0.1;
      end loop;
   end B;
   
   task body C is
   begin
      for i in 1..N loop
         Wait(Mutex);    -- Adquiere el mutex
         Put_Line("Tarea C: " & Integer'Image(i));
         Signal(Mutex);  -- Libera el mutex
         delay 0.1;
      end loop;
   end C;

begin
   -- Esperar a que todas las tareas terminen
   delay 2.0;
end Main_With_Mutex;
