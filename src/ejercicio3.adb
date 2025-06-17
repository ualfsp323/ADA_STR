with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure ejercicio3 is
   
   type A is delta 0.01 range -30.0 .. 70.0;
   
   type B is delta 0.01 range -200.0 .. 220.0;
      
   Var_A : A :=25.75;
   Var_B : B :=-150.25;
   
   Resultado: Float;

begin
   
   Resultado := Float(Var_A) + Float(Var_B);
   
   Put("El resultado de A + B es: ");
   Put(Resultado, Fore => 1, Aft => 3, Exp => 0);
   New_Line;
   
end ejercicio3;
