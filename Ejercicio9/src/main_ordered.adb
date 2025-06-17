with Putter; use Putter;
with Semaphores; use Semaphores;

procedure Main_Ordered is
   Mutex : Semaphore(Initial => 1);  -- Semáforo binario para exclusión mutua
   Sem_C : Semaphore(Initial => 1);  -- Control para tarea C (inicia primero)
   Sem_B : Semaphore(Initial => 0);  -- Control para tarea B
   Sem_A : Semaphore(Initial => 0);  -- Control para tarea A
   
   task A;
   task B;
   task C;
   
   N : constant := 5; -- Número de iteraciones
   
   task body A is
   begin
      for i in 1..N loop
         Wait(Sem_A);    -- Espera señal de B
         Wait(Mutex);    -- Entra en sección crítica
         Put_Line("Tarea A: " & Integer'Image(i));
         Signal(Mutex);  -- Sale de sección crítica
         Signal(Sem_C);  -- Señal a C para reiniciar ciclo
         delay 0.1;
      end loop;
   end A;
   
   task body B is
   begin
      for i in 1..N loop
         Wait(Sem_B);    -- Espera señal de C
         Wait(Mutex);    -- Entra en sección crítica
         Put_Line("Tarea B: " & Integer'Image(i));
         Signal(Mutex);  -- Sale de sección crítica
         Signal(Sem_A);  -- Señal a A para continuar
         delay 0.1;
      end loop;
   end B;
   
   task body C is
   begin
      for i in 1..N loop
         Wait(Sem_C);    -- Espera señal de A (o inicio)
         Wait(Mutex);    -- Entra en sección crítica
         Put_Line("Tarea C: " & Integer'Image(i));
         Signal(Mutex);  -- Sale de sección crítica
         Signal(Sem_B);  -- Señal a B para continuar
         delay 0.1;
      end loop;
   end C;

begin
   -- No necesitamos señal inicial porque Sem_C empieza en 1
   delay 2.0;  -- Esperar a que terminen
end Main_Ordered;
