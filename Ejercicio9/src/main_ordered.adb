with Putter; use Putter;
with Semaphores; use Semaphores;

procedure Main_Ordered is
   Mutex : Semaphore;
   Sem_C, Sem_B, Sem_A : Semaphore;
   
   task A;
   task B;
   task C;
   
   N : constant := 5; -- Número de iteraciones
   
   task body A is
   begin
      for i in 1..N loop
         Sem_A.Wait;
         Mutex.Wait;
         Put_Line("Tarea A: " & Integer'Image(i));
         Mutex.Signal;
         Sem_C.Signal;
         delay 0.1;
      end loop;
   end A;
   
   task body B is
   begin
      for i in 1..N loop
         Sem_B.Wait;
         Mutex.Wait;
         Put_Line("Tarea B: " & Integer'Image(i));
         Mutex.Signal;
         Sem_A.Signal;
         delay 0.1;
      end loop;
   end B;
   
   task body C is
   begin
      -- Inicializar el semáforo para que C empiece primero
      Sem_C.Signal;
      
      for i in 1..N loop
         Sem_C.Wait;
         Mutex.Wait;
         Put_Line("Tarea C: " & Integer'Image(i));
         Mutex.Signal;
         Sem_B.Signal;
         delay 0.1;
      end loop;
   end C;

begin
   null;
end Main_Ordered;
