with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure ejercicio1 is
   -- Definición de los tipos de datos
   type A is range -40 .. 160;
   type B is range 0 .. 120;
   type C is mod 2**8;  -- Entero sin signo de 1 byte (0 a 255)

   -- Declaración de variables
   Var_A : A := 50;
   Var_B : B := 30;
   Var_C : C := 100;

   -- Variables para almacenar los resultados
   Resultado_AB : Integer;
   Resultado_AC : Integer;
   Resultado_BC : Integer;

begin
   -- Realizar las operaciones
   Resultado_AB := Integer(Var_A) + Integer(Var_B);
   Resultado_AC := Integer(Var_A) + Integer(Var_C);
   Resultado_BC := Integer(Var_B) + Integer(Var_C);

   -- Imprimir los resultados
   Put_Line("Resultado de A + B: " & Integer'Image(Resultado_AB));
   Put_Line("Resultado de A + C: " & Integer'Image(Resultado_AC));
   Put_Line("Resultado de B + C: " & Integer'Image(Resultado_BC));
end ejercicio1;
