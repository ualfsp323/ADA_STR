with Data_Type; use Data_Type;

package controlador is
   procedure Calcular_Caudales_Optimos(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data;
      Usar_Caudales_Optimos : in Boolean
   );
end controlador;
