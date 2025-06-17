package body Semaphores is
   procedure Wait(S: in out Semaphore) is
   begin
      S.Wait;
   end Wait;
   
   procedure Signal(S: in out Semaphore) is
   begin
      S.Signal;
   end Signal;
   
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
