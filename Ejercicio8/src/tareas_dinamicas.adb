with Ada.Text_IO; use Ada.Text_IO;

procedure tareas_dinamicas is
   N : constant Integer := 5;

   task type Tarea_Tipo is
      entry Iniciar(Nombre : Character; Iteraciones : Integer);
   end Tarea_Tipo;

   task body Tarea_Tipo is
      Nombre : Character;
      Iteraciones : Integer;
   begin
      accept Iniciar(Nombre : in Character; Iteraciones : in Integer) do
         Tarea_Tipo.Nombre := Nombre;
         Tarea_Tipo.Iteraciones := Iteraciones;
      end Iniciar;

      for i in 1..Iteraciones loop
         Put_Line("Tarea " & Nombre & ": " & Integer'Image(i));
      end loop;
   end Tarea_Tipo;

   type Puntero_Tarea is access Tarea_Tipo;
   Tarea_A : Puntero_Tarea := new Tarea_Tipo;
   Tarea_B : Puntero_Tarea := new Tarea_Tipo;
   Tarea_C : Puntero_Tarea := new Tarea_Tipo;

begin
   Tarea_A.Iniciar('A', N);
   Tarea_B.Iniciar('B', N);
   Tarea_C.Iniciar('C', N);
end tareas_dinamicas;
