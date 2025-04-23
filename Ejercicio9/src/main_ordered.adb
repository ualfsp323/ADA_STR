with Putter; use Putter;
with Semaphores; use Semaphores;

procedure Main_Ordered is
   Mutex : Semaphore(Initial => 1);  -- Sem�foro binario para exclusi�n mutua
   Sem_C : Semaphore(Initial => 1);  -- Control para tarea C (inicia primero)
   Sem_B : Semaphore(Initial => 0);  -- Control para tarea B
   Sem_A : Semaphore(Initial => 0);  -- Control para tarea A
   
   task A;
   task B;
   task C;
   
   N : constant := 5; -- N�mero de iteraciones
   
   task body A is
   begin
      for i in 1..N loop
         Wait(Sem_A);    -- Espera se�al de B
         Wait(Mutex);    -- Entra en secci�n cr�tica
         Put_Line("Tarea A: " & Integer'Image(i));
         Signal(Mutex);  -- Sale de secci�n cr�tica
         Signal(Sem_C);  -- Se�al a C para reiniciar ciclo
         delay 0.1;
      end loop;
   end A;
   
   task body B is
   begin
      for i in 1..N loop
         Wait(Sem_B);    -- Espera se�al de C
         Wait(Mutex);    -- Entra en secci�n cr�tica
         Put_Line("Tarea B: " & Integer'Image(i));
         Signal(Mutex);  -- Sale de secci�n cr�tica
         Signal(Sem_A);  -- Se�al a A para continuar
         delay 0.1;
      end loop;
   end B;
   
   task body C is
   begin
      for i in 1..N loop
         Wait(Sem_C);    -- Espera se�al de A (o inicio)
         Wait(Mutex);    -- Entra en secci�n cr�tica
         Put_Line("Tarea C: " & Integer'Image(i));
         Signal(Mutex);  -- Sale de secci�n cr�tica
         Signal(Sem_B);  -- Se�al a B para continuar
         delay 0.1;
      end loop;
   end C;

begin
   -- No necesitamos se�al inicial porque Sem_C empieza en 1
   delay 2.0;  -- Esperar a que terminen
end Main_Ordered;
