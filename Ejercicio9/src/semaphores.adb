package body Semaphores is
   protected body Semaphore is
      entry Wait when Count > 0 is
      begin
         Count := Count - 1;
      end Wait;
      
      procedure Signal is
      begin
         Count := Count + 1;
      end Signal;
   end Semaphore;
end Semaphores;
