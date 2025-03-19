with Data_Type; use Data_Type;

package simulacion is
   procedure Simular_Planta(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   );
end simulacion;
