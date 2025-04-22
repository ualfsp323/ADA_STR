package body Putter is
   procedure Put_Line(S : String) is
   begin
      Index := Index + 1;
      if Index > Buffer'Last then
         Index := 1;  -- Sobrescribe las l�neas m�s antiguas (buffer circular)
      end if;
      Buffer(Index)(1 .. S'Length) := S;  -- Almacena el mensaje
   end Put_Line;

   -- Esta funci�n S� usa Ada.Text_IO, pero solo se llama 1 vez al final
   procedure Dump_Output is
      use Ada.Text_IO;  -- Solo aqu�, de manera controlada
   begin
      Put_Line("=== SALIDA DEL PROGRAMA ===");
      for I in 1 .. Index loop
         Put_Line(Buffer(I)(1 .. 80));  -- Imprime cada l�nea almacenada
      end loop;
   end Dump_Output;
end Putter;
