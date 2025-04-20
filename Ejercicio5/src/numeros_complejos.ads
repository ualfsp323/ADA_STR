package Numeros_Complejos is
   -- Definición del tipo complejo
   type Complejo is record
      Real : Float;
      Imaginario : Float;
   end record;

   -- Operaciones básicas
   function "+" (C1, C2 : Complejo) return Complejo;
   function "-" (C1, C2 : Complejo) return Complejo;
   function "*" (C1, C2 : Complejo) return Complejo;
   function "/" (C1, C2 : Complejo) return Complejo;

   -- Conjugado de un número complejo
   function Conj (C : Complejo) return Complejo;

   -- Mostrar un número complejo
   procedure Mostrar (C : Complejo);
end Numeros_Complejos;
