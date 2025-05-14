with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Data_Type; use Data_Type;
with controlador; use controlador;
with mostrar; use mostrar;
with seguridad; use seguridad;
with simulacion; use simulacion;
with AD_Card; use AD_Card;
with guardar; use guardar;

procedure Main is
   -- Variables del sistema
   Sensors : Sensor_Data;
   Input : Input_Data;
   Usar_Caudales_Optimos : Boolean := False;
   AD_Success : Boolean;

   -- Variables para el control del tiempo
   T : Time;
   Periodo : constant Time_Span := Milliseconds(25);
   Contador_Ciclos : Integer := 1;

begin
   Put_Line("Inicializando sistema...");
   Initialize_AD_Card; -- Inicializa la tarjeta A/D y archivos

   T := Clock;

   loop


      Access_AD_Card(READ, Contador_Ciclos, Sensors, Input, AD_Success);
      if not AD_Success then
         Guardar_Alarma(Contador_Ciclos, "Fallo lectura A/D");
         exit;
      end if;

      Put_Line("");-- Ciclo 0 (0ms)
      Put_Line("-------------------Ciclo 0-------------------------");
      T := T + Periodo;
      delay until(T);
      Calcular_Caudales_Optimos(Contador_Ciclos, Input, Sensors, Usar_Caudales_Optimos);

      Simular_Campo_Solar(Contador_Ciclos, Input, Sensors);
      Access_AD_Card(WRITE_SC1, Contador_Ciclos, Sensors, Input, AD_Success);
      if not AD_Success then
         Guardar_Alarma(Contador_Ciclos, "Fallo escritura SC1");
      end if;


      Simular_Modulo_MD(Contador_Ciclos, Input, Sensors);
      Access_AD_Card(WRITE_SC2, Contador_Ciclos, Sensors, Input, AD_Success);
      if not AD_Success then
         Guardar_Alarma(Contador_Ciclos, "Fallo escritura SC1");
      end if;

      Put_Line("");
      Put_Line("Comprobando seguridad");
      Controlar_Seguridad(Contador_Ciclos, Sensors.ST2);

      Put_Line("");-- Ciclo 1 (25ms)
      Put_Line("-------------------Ciclo 1-------------------------");
      T := T + Periodo;
      delay until(T);

      Put_Line("");
      Put_Line("Comprobando seguridad");
      Controlar_Seguridad(Contador_Ciclos, Sensors.ST2);


      Put_Line("");-- Ciclo 2 (50ms)
      Put_Line("-------------------Ciclo 2-------------------------");
      T := T + Periodo;
      delay until(T);

      Simular_Campo_Solar(Contador_Ciclos, Input, Sensors);
      Access_AD_Card(WRITE_SC1, Contador_Ciclos, Sensors, Input, AD_Success);
      if not AD_Success then
         Guardar_Alarma(Contador_Ciclos, "Fallo escritura SC1");
      end if;

      Put_Line("");
      Put_Line("Comprobando seguridad");
      Controlar_Seguridad(Contador_Ciclos, Sensors.ST2);

      Put_Line(""); -- Ciclo 3 (75ms)
      Put_Line("-------------------Ciclo 3-------------------------");
      T := T + Periodo;
      delay until(T);

      Simular_Campo_Solar(Contador_Ciclos, Input, Sensors);
      Access_AD_Card(WRITE_SC1, Contador_Ciclos, Sensors, Input, AD_Success);
      if not AD_Success then
         Guardar_Alarma(Contador_Ciclos, "Fallo escritura SC1");
      end if;

      Simular_Modulo_MD(Contador_Ciclos, Input, Sensors);
      Access_AD_Card(WRITE_SC2, Contador_Ciclos, Sensors, Input, AD_Success);
      if not AD_Success then
         Guardar_Alarma(Contador_Ciclos, "Fallo escritura SC1");
      end if;

      Put_Line("");
      Put_Line("Comprobando seguridad");
      Controlar_Seguridad(Contador_Ciclos, Sensors.ST2);




      Put_Line("");
      Put_Line("Datos finales: ");

      Mostrar_Datos(Contador_Ciclos, Sensors);
      Contador_Ciclos := Contador_Ciclos + 1;

      -- Salir después de 4 ciclos completos (2000ms) para el ejemplo
      exit when Contador_Ciclos >= 4;
   end loop;

   Put_Line("Ejecución completada");
end main;
