with Ada.Text_IO; use Ada.Text_IO;

procedure tareas_estaticas is
   N : constant Integer := 5;

   task Tarea_A;
   task Tarea_B;
   task Tarea_C;

   task body Tarea_A is
   begin
      for i in 1..N loop
         Put_Line("Tarea A: " & Integer'Image(i));
      end loop;
   end Tarea_A;

   task body Tarea_B is
   begin
      for i in 1..N loop
         Put_Line("Tarea B: " & Integer'Image(i));
      end loop;
   end Tarea_B;

   task body Tarea_C is
   begin
      for i in 1..N loop
         Put_Line("Tarea C: " & Integer'Image(i));
      end loop;
   end Tarea_C;

begin
   null; -- Las tareas se ejecutan automáticamente
end tareas_estaticas;
