with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure ejercicio4_pila is
   -- Tamaño máximo de la pila
   Max_Tamano : constant Natural := 10;

   -- Definición del tipo de arreglo para los datos de la pila
   type Arreglo_Enteros is array (1 .. Max_Tamano) of Integer;

   -- Definición del tipo Pila
   type Pila is record
      Datos : Arreglo_Enteros;  -- Usamos el tipo de arreglo definido
      Cima : Natural := 0;      -- Índice de la cima de la pila
   end record;

   -- Procedimiento para apilar un elemento
   procedure Apilar(P : in out Pila; Valor : Integer) is
   begin
      if P.Cima = Max_Tamano then
         Put_Line("Error: Pila llena.");
      else
         P.Cima := P.Cima + 1;
         P.Datos(P.Cima) := Valor;
      end if;
   end Apilar;

   -- Función para desapilar un elemento
   function Desapilar(P : in out Pila) return Integer is
      Valor : Integer;
   begin
      if P.Cima = 0 then
         Put_Line("Error: Pila vacía.");
         return -1;  -- Valor de error
      else
         Valor := P.Datos(P.Cima);
         P.Cima := P.Cima - 1;
         return Valor;
      end if;
   end Desapilar;

   -- Variable para la pila
   Mi_Pila : Pila;

begin
   -- 1. Generar una pila con 10 datos
   for I in 1 .. Max_Tamano loop
      Apilar(Mi_Pila, I);  -- Apilar valores del 1 al 10
   end loop;

   -- 2. Extraer y mostrar los datos de la pila
   Put_Line("Datos extraídos de la pila:");
   for I in 1 .. Max_Tamano loop
      Put(Desapilar(Mi_Pila), Width => 3);
   end loop;
   New_Line;
end ejercicio4_pila;
