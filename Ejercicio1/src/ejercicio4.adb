with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure ejercicio4 is
   
   type A is array (1 .. 24) of Float;
   
   type B is array (1 .. 13, 1 .. 13, 1 .. 13) of Integer;
   
   type C is array (Positive range <>) of Float;
   
   Var_A : A := (others => 0.0);
   Var_B : B := (others => (others => (others => 0)));
   Var_C : C(1 .. 20) := (others => 0.0);
   
begin

   Put_Line("Contenido de Var_A (vector de 24 posiciones):");
   for I in Var_A'Range loop
      Put(Var_A(I), Fore => 1, Aft => 2, Exp => 0);
      Put(" ");
   end loop;
   New_Line(2);
   
   Put_Line("Contenido de Var_B (matriz 13x13x13, mostrando solo una porción):");
   for I in 1 .. 5 loop
      for J in 1 .. 5 loop
         for k in 1 .. 5 loop
            Put(Var_B(I, J, K), Width => 4);
         end loop;
         New_Line;
      end loop;
      New_Line;
   end loop;
   
   Put_Line("Contenido de Var_C (vector de tamaño 10):");
   for I in Var_C'Range loop
      Put(Var_C(I), Fore => 1, Aft => 2, Exp => 0);
      Put(" ");
   end loop;
   New_Line;
   
end ejercicio4;
