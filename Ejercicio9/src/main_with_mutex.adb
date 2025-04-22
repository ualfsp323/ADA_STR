with Putter; use Putter;
with Semaphores; use Semaphores;

procedure Main_With_Mutex is
   Mutex : Semaphore;
   
   task A;
   task B;
   task C;
   
   N : constant := 5; -- Número de iteraciones
   
   task body A is
   begin
      for i in 1..N loop
         Mutex.Wait;
         Put_Line("Tarea A: " & Integer'Image(i));
         Mutex.Signal;
         delay 0.1;
      end loop;
   end A;
   
   task body B is
   begin
      for i in 1..N loop
         Mutex.Wait;
         Put_Line("Tarea B: " & Integer'Image(i));
         Mutex.Signal;
         delay 0.1;
      end loop;
   end B;
   
   task body C is
   begin
      for i in 1..N loop
         Mutex.Wait;
         Put_Line("Tarea C: " & Integer'Image(i));
         Mutex.Signal;
         delay 0.1;
      end loop;
   end C;

begin
   null;
end Main_With_Mutex;
