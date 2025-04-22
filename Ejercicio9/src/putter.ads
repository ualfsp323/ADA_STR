package Putter is
   procedure Put_Line(S : String);
   procedure Dump_Output;  -- ¡Solo se llama una vez al final!
private
   -- Buffer circular para almacenar las últimas 1000 líneas
   type String_Buffer is array (1..1000) of String(1..80);
   Buffer : String_Buffer;
   Index  : Natural := 0;
end Putter;
