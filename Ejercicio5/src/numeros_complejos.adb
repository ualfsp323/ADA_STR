with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Numeros_Complejos is

   -- Suma de dos números complejos
   function "+" (C1, C2 : Complejo) return Complejo is
      Resultado : Complejo;
   begin
      Resultado.Real := C1.Real + C2.Real;
      Resultado.Imaginario := C1.Imaginario + C2.Imaginario;
      return Resultado;
   end "+";

   -- Resta de dos números complejos
   function "-" (C1, C2 : Complejo) return Complejo is
      Resultado : Complejo;
   begin
      Resultado.Real := C1.Real - C2.Real;
      Resultado.Imaginario := C1.Imaginario - C2.Imaginario;
      return Resultado;
   end "-";

   -- Multiplicación de dos números complejos
   function "*" (C1, C2 : Complejo) return Complejo is
      Resultado : Complejo;
   begin
      Resultado.Real := C1.Real * C2.Real - C1.Imaginario * C2.Imaginario;
      Resultado.Imaginario := C1.Real * C2.Imaginario + C1.Imaginario * C2.Real;
      return Resultado;
   end "*";

   -- División de dos números complejos
   function "/" (C1, C2 : Complejo) return Complejo is
      Resultado : Complejo;
      Denominador : Float;
   begin
      Denominador := C2.Real**2 + C2.Imaginario**2;
      Resultado.Real := (C1.Real * C2.Real + C1.Imaginario * C2.Imaginario) / Denominador;
      Resultado.Imaginario := (C1.Imaginario * C2.Real - C1.Real * C2.Imaginario) / Denominador;
      return Resultado;
   end "/";

   -- Conjugado de un número complejo
   function Conj (C : Complejo) return Complejo is
      Resultado : Complejo;
   begin
      Resultado.Real := C.Real;
      Resultado.Imaginario := -C.Imaginario;
      return Resultado;
   end Conj;

   -- Mostrar un número complejo con dos decimales
   procedure Mostrar (C : Complejo) is
   begin
      Put("(");
      Put(C.Real, Fore => 1, Aft => 2, Exp => 0);  -- Parte real con 2 decimales
      Put(" + ");
      Put(C.Imaginario, Fore => 1, Aft => 2, Exp => 0);  -- Parte imaginaria con 2 decimales
      Put("i)");
   end Mostrar;

end Numeros_Complejos;
