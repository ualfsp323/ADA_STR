with Ada.Text_IO; use Ada.Text_IO;
with leer; use leer;
with simulacion; use simulacion;
with controlador; use controlador;
with mostrar; use mostrar;
with guardar; use guardar;
with seguridad; use seguridad;
with Data_Type; use Data_Type;

procedure Main is
   -- Variables para almacenar los datos de entrada y salida
   Input : Input_Data;
   Sensors : Sensor_Data;
   Usar_Caudales_Optimos : Boolean := False;  -- Cambiar a False para usar caudales fijos
begin
   -- Inicializar los archivos (crear o limpiar)
   guardar.Inicializar_Archivos;

   -- Inicialización de valores iniciales
   Sensors.ST2 := ST2_Initial;
   Sensors.ST1 := ST1_Initial;
   Sensors.SC1 := SC1;
   Sensors.SC2 := SC2;

   -- Bucle de simulación
   for k in 1 .. 20 loop
      -- Leer datos de entrada
      Leer_Datos(k, Input, Sensors);

      -- Calcular caudales óptimos o usar valores fijos
      Calcular_Caudales_Optimos(k, Input, Sensors, Usar_Caudales_Optimos);

      -- Simular la planta
      Simular_Planta(k, Input, Sensors);

      -- Controlar y verificar restricciones de seguridad
      Controlar_Seguridad(k, Sensors.ST2);

      -- Visualizar datos por pantalla
      Mostrar_Datos(k, Sensors);

      -- Guardar datos en archivo
      Guardar_Datos(k, Sensors);
   end loop;
end Main;
