with Data_Type; use Data_Type;

package simulacion is
   -- Procedimiento para simular el campo solar (ST2)
   procedure Simular_Campo_Solar(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   );

   -- Procedimiento para simular el módulo MD (SD1)
   procedure Simular_Modulo_MD(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   );

   -- Procedimiento que engloba ambas simulaciones (para compatibilidad)
   procedure Simular_Planta(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   );

end simulacion;
