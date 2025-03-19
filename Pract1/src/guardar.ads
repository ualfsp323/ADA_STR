with Data_Type; use Data_Type;

package guardar is
   -- Procedimiento para inicializar los archivos (crear o limpiar)
   procedure Inicializar_Archivos;

   -- Procedimiento para guardar los datos en data_log.txt
   procedure Guardar_Datos(k : in Integer; Sensors : in Sensor_Data);

   -- Procedimiento para guardar alarmas en alarm_log.txt
   procedure Guardar_Alarma(k : in Integer; mensaje : in String);
end guardar;
