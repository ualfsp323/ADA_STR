with Ada.Text_IO; use Ada.Text_IO;
with Numeros_Complejos; use Numeros_Complejos;

procedure main is
   C1, C2, Suma, Resta, Producto, Division, Conjugado : Complejo;
begin
   -- Definir dos números complejos
   C1 := (Real => 3.0, Imaginario => 4.0);
   C2 := (Real => 1.0, Imaginario => 2.0);

   -- Probar la suma
   Suma := C1 + C2;
   Put("Suma: ");
   Mostrar(Suma);
   New_Line;

   -- Probar la resta
   Resta := C1 - C2;
   Put("Resta: ");
   Mostrar(Resta);
   New_Line;

   -- Probar la multiplicación
   Producto := C1 * C2;
   Put("Producto: ");
   Mostrar(Producto);
   New_Line;

   -- Probar la división
   Division := C1 / C2;
   Put("División: ");
   Mostrar(Division);
   New_Line;

   -- Probar el conjugado
   Conjugado := Conj(C1);
   Put("Conjugado de C1: ");
   Mostrar(Conjugado);
   New_Line;
end main;
