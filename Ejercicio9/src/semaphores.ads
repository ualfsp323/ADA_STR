package Semaphores is
   protected type Semaphore is
      entry Wait;
      procedure Signal;
   private
      Count : Natural := 1;
   end Semaphore;
end Semaphores;
