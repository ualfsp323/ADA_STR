with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure ejercicio4_cola is
   -- Tamaño máximo de la cola
   Max_Tamano : constant Natural := 10;

   -- Definición del tipo de arreglo para los datos de la cola
   type Arreglo_Enteros is array (1 .. Max_Tamano) of Integer;

   -- Definición del tipo Cola
   type Cola is record
      Datos : Arreglo_Enteros;  -- Usamos el tipo de arreglo definido
      Frente : Natural := 1;    -- Índice del frente de la cola
      Final : Natural := 1;     -- Índice del final de la cola
      Tamano : Natural := 0;    -- Número de elementos en la cola
   end record;

   -- Procedimiento para encolar un elemento
   procedure Encolar(C : in out Cola; Valor : Integer) is
   begin
      if C.Tamano = Max_Tamano then
         Put_Line("Error: Cola llena.");
      else
         C.Datos(C.Final) := Valor;
         C.Final := (C.Final mod Max_Tamano) + 1;  -- Circular
         C.Tamano := C.Tamano + 1;
      end if;
   end Encolar;

   -- Función para desencolar un elemento
   function Desencolar(C : in out Cola) return Integer is
      Valor : Integer;
   begin
      if C.Tamano = 0 then
         Put_Line("Error: Cola vacía.");
         return -1;  -- Valor de error
      else
         Valor := C.Datos(C.Frente);
         C.Frente := (C.Frente mod Max_Tamano) + 1;  -- Circular
         C.Tamano := C.Tamano - 1;
         return Valor;
      end if;
   end Desencolar;

   -- Variable para la cola
   Mi_Cola : Cola;

begin
   -- 1. Generar una cola con 10 datos
   for I in 1 .. Max_Tamano loop
      Encolar(Mi_Cola, I);  -- Encolar valores del 1 al 10
   end loop;

   -- 2. Extraer y mostrar los datos de la cola
   Put_Line("Datos extraídos de la cola:");
   for I in 1 .. Max_Tamano loop
      Put(Desencolar(Mi_Cola), Width => 3);
   end loop;
   New_Line;
end ejercicio4_cola;
