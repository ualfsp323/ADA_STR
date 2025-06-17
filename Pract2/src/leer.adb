with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body leer is
   procedure Leer_Datos(k : in Integer; Input : out Input_Data ;  Sensors : in out Sensor_Data
) is
      File : File_Type;
      Line : String(1 .. 100);  -- Buffer para leer cada línea del archivo
      Last : Natural;
      k_aux : Integer;
      SR1_aux, ST4_aux, ST3_aux : Float;
   begin
      -- Abrir el archivo de entrada
      Open(File, In_File, "input.txt");

      -- Leer línea por línea hasta encontrar la iteración k
      for i in 1 .. k loop
         Get_Line(File, Line, Last);  -- Leer una línea del archivo

         -- Extraer los valores de k, SR1, ST4 y ST3
         -- Usamos Index para encontrar las posiciones de los espacios
         declare
            First_Space : Natural := Index(Line(1 .. Last), " ");
            Second_Space : Natural := Index(Line(First_Space + 1 .. Last), " ");
            Third_Space : Natural := Index(Line(Second_Space + 1 .. Last), " ");
         begin
            -- Extraer k (entero)
            k_aux := Integer'Value(Line(1 .. First_Space - 1));

            -- Extraer SR1 (flotante)
            SR1_aux := Float'Value(Line(First_Space + 1 .. Second_Space - 1));

            -- Extraer ST4 (flotante)
            ST4_aux := Float'Value(Line(Second_Space + 1 .. Third_Space - 1));

            -- Extraer ST3 (flotante)
            ST3_aux := Float'Value(Line(Third_Space + 1 .. Last));
         end;
      end loop;

      -- Asignar los valores a la variable Input
      Input.k := k_aux;
      Input.SR1 := SR1_aux;
      Input.ST4 := ST4_aux;
      Input.ST3 := ST3_aux;
      Sensors.ST3 := Input.ST3;
      Sensors.ST4 := Input.ST4;
      Sensors.SR1 := Input.SR1;
      -- Cerrar el archivo
      Close(File);
   end Leer_Datos;
end leer;
