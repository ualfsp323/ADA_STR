package Semaphores is
   type Semaphore(Initial: Natural := 1) is limited private;
   procedure Wait(S: in out Semaphore);
   procedure Signal(S: in out Semaphore);
private
   protected type Semaphore(Initial: Natural := 1) is
      entry Wait;
      procedure Signal;
   private
      Count: Natural := Initial;
   end Semaphore;
end Semaphores;
