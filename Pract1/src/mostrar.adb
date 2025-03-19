with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body mostrar is
   procedure Mostrar_Datos(k : in Integer; Sensors : in Sensor_Data) is
   begin
      -- Mostrar el número de iteración
      Put("Iteración ");
      Put(Integer'Image(k));
      New_Line;

      -- Mostrar los valores de los sensores con 2 decimales
      Put("ST1: ");
      Put(Sensors.ST1, Fore => 1, Aft => 2, Exp => 0);  -- ST1 con 2 decimales
      Put_Line(" °C");

      Put("ST2: ");
      Put(Sensors.ST2, Fore => 1, Aft => 2, Exp => 0);  -- ST2 con 2 decimales
      Put_Line(" °C");

      Put("ST3: ");
      Put(Sensors.ST3, Fore => 1, Aft => 2, Exp => 0);  -- ST3 con 2 decimales
      Put_Line(" °C");

      Put("ST4: ");
      Put(Sensors.ST4, Fore => 1, Aft => 2, Exp => 0);  -- ST4 con 2 decimales
      Put_Line(" °C");

      Put("SC1: ");
      Put(Sensors.SC1, Fore => 1, Aft => 2, Exp => 0);  -- SC1 con 2 decimales
      Put_Line(" L/min");

      Put("SC2: ");
      Put(Sensors.SC2, Fore => 1, Aft => 2, Exp => 0);  -- SC2 con 2 decimales
      Put_Line(" L/h");

      Put("SR1: ");
      Put(Sensors.SR1, Fore => 1, Aft => 2, Exp => 0);  -- SR1 con 2 decimales
      Put_Line(" W/m²");

      Put("SD1: ");
      Put(Sensors.SD1, Fore => 1, Aft => 2, Exp => 0);  -- SD1 con 2 decimales
      Put_Line(" L/h");

      -- Nueva línea para separar las iteraciones
      New_Line;
   end Mostrar_Datos;
end mostrar;
