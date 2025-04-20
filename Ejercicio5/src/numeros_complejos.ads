package Numeros_Complejos is
   -- Definici�n del tipo complejo
   type Complejo is record
      Real : Float;
      Imaginario : Float;
   end record;

   -- Operaciones b�sicas
   function "+" (C1, C2 : Complejo) return Complejo;
   function "-" (C1, C2 : Complejo) return Complejo;
   function "*" (C1, C2 : Complejo) return Complejo;
   function "/" (C1, C2 : Complejo) return Complejo;

   -- Conjugado de un n�mero complejo
   function Conj (C : Complejo) return Complejo;

   -- Mostrar un n�mero complejo
   procedure Mostrar (C : Complejo);
end Numeros_Complejos;
