with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body controlador is
   procedure Calcular_Caudales_Optimos(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data;
      Usar_Caudales_Optimos : in Boolean
   ) is
      ST1_Previous, ST2_Previous : Float;
      Tt : Float;
   begin
      -- Valores anteriores de ST1 y ST2
      if k = 1 then
         ST1_Previous := ST1_Initial;
         ST2_Previous := ST2_Initial;
      else
         ST1_Previous := Sensors.ST1;
         ST2_Previous := Sensors.ST2;
      end if;

      -- Calcular Tt
      Tt := (ST1_Previous + ST2_Previous) / 2.0;

      -- Ejercicio 2: Calcular caudales óptimos
      if Usar_Caudales_Optimos then
         -- Calcular SC1 óptimo
         Sensors.SC1 := ((beta * Leq * Input.SR1) - H * (Tt - Input.ST4)) * c /
                        ((Sensors.ST2 - ST1_Previous) * Cp * rho);

         -- Asegurarse de que SC1 esté dentro del rango permitido
         if Sensors.SC1 < 7.5 then
            Sensors.SC1 := 7.5;
         elsif Sensors.SC1 > 25.0 then
            Sensors.SC1 := 25.0;
         end if;

         -- Calcular SC2 óptimo
         Sensors.SC2 := (Sensors.SD1 / 24.0 - 0.135 - 0.003 * ST2_Previous + 0.0203 * Input.ST3) /
                        (-0.001 + 0.00004 * ST2_Previous);

         -- Asegurarse de que SC2 esté dentro del rango permitido
         if Sensors.SC2 < 150.0 then
            Sensors.SC2 := 150.0;
         elsif Sensors.SC2 > 620.0 then
            Sensors.SC2 := 620.0;
         end if;
      else
         -- Ejercicio 1: Usar caudales fijos
         Sensors.SC1 := 16.0;  -- Caudal fijo para SC1
         Sensors.SC2 := 425.0; -- Caudal fijo para SC2
      end if;
   end Calcular_Caudales_Optimos;
end controlador;
