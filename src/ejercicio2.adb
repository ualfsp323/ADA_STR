with Ada.Text_IO; use Ada.Text_IO;
procedure ejercicio2 is
   type Semaforo is (Rojo, Amarillo, Verde);

   Estado_Actual : Semaforo;
begin

   Estado_Actual := Rojo;
   Put_Line("El sem�foro est� en: " & Semaforo'Image(Estado_Actual));
   
   Estado_Actual := Verde;
   Put_Line("El sem�foro cambi� en: " & Semaforo'Image(Estado_Actual));
   
   case Estado_Actual is
      when Rojo =>
         Put_Line("!Detente�");
      when Amarillo =>
         Put_Line("!Precauci�n�");
      when Verde =>
         Put_Line("!Avanza�");
   end case;
           
end ejercicio2;
