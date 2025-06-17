with Ada.Text_IO; use Ada.Text_IO;

package body simulacion is

   -- Función auxiliar para obtener valores anteriores
   procedure Obtener_Valores_Anteriores(
      k : in Integer;
      Sensors : in Sensor_Data;
      ST1_Previous : out Float;
      ST2_Previous : out Float
   ) is
   begin
      if k = 1 then
         ST1_Previous := ST1_Initial;
         ST2_Previous := ST2_Initial;
      else
         ST1_Previous := Sensors.ST1;
         ST2_Previous := Sensors.ST2;
      end if;
   end Obtener_Valores_Anteriores;

   -- Simulación del campo solar (ST2)
   procedure Simular_Campo_Solar(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   ) is
      ST1_Previous, ST2_Previous : Float;
      Tt : Float;
   begin
      Obtener_Valores_Anteriores(k, Sensors, ST1_Previous, ST2_Previous);

      -- Calcular temperatura media (Tt)
      Tt := (ST1_Previous + ST2_Previous) / 2.0;

      -- Calcular nueva temperatura de salida (ST2)
      Sensors.ST2 := ST1_Previous +
                   (((beta * Leq * Input.SR1) * c) / (Sensors.SC1 * Cp * rho)) -
                   (((H * (Tt - Input.ST4)) * c) / (Sensors.SC1 * Cp * rho));

      -- Calcular temperatura de entrada (ST1)
      Sensors.ST1 := Sensors.ST2 - 10.0;
   end Simular_Campo_Solar;

   -- Simulación del módulo MD (SD1)
   procedure Simular_Modulo_MD(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   ) is
      ST1_Previous, ST2_Previous : Float;
   begin
      Obtener_Valores_Anteriores(k, Sensors, ST1_Previous, ST2_Previous);

      -- Calcular producción de destilado (SD1)
      Sensors.SD1 := 24.0 * (0.135 + 0.003 * ST2_Previous - 0.0203 * Input.ST3 -
                           0.001 * Sensors.SC2 + 0.00004 * ST2_Previous * Sensors.SC2);
   end Simular_Modulo_MD;

   -- Procedimiento combinado (para compatibilidad con código existente)
   procedure Simular_Planta(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   ) is
   begin
      Simular_Campo_Solar(k, Input, Sensors);
      Simular_Modulo_MD(k, Input, Sensors);
   end Simular_Planta;

end simulacion;
