with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Data_Type; use Data_Type;
with AD_Card; use AD_Card;
with guardar; use guardar;
with controlador; use controlador;
with simulacion; use simulacion;
with mostrar; use mostrar;
with seguridad; use seguridad;
with System; use System;

procedure Main is
   Sensors : Sensor_Data;
   Input   : Input_Data;
   Num_Ciclos : constant Integer := 4;

 task Tarea_Seguridad is
      pragma Priority(15); -- Prioridad más alta, T = 25 ms
   end Tarea_Seguridad;

   task Tarea_SC1 is
      pragma Priority(10); -- Prioridad intermedia, T = 50 ms
   end Tarea_SC1;

   task Tarea_SC2 is
      pragma Priority(5);  -- Prioridad más baja, T = 100 ms
   end Tarea_SC2;

   -- Tarea de Seguridad
   task body Tarea_Seguridad is
      T       : Time := Clock;
      Periodo : constant Time_Span := Milliseconds(25);
   begin
      for Ciclo in 1 .. Num_Ciclos loop
         T := T + Periodo;
         Put_Line("");
         Put_Line("Seguridad: Ciclo " & Integer'Image(Ciclo));
         AD_Card_Server.Request_Read(Ciclo, Sensors, Input);
         Put_Line("Comprobando seguridad");
         Controlar_Seguridad(Ciclo, Sensors.ST2);
         Put_Line("");

         delay 0.1;  -- Timeout de escritura a almacenamiento

         delay until T;
      end loop;
   end Tarea_Seguridad;


   -- Tarea Control Campo Solar --
   task body Tarea_SC1 is
      T       : Time := Clock;
      Periodo : constant Time_Span := Milliseconds(50);
      Usar    : Boolean := True;
   begin
      for Ciclo in 1 .. Num_Ciclos  loop
         T := T + Periodo;
         Put_Line("SC1 (Campo solar): Ciclo " & Integer'Image(Ciclo));

         AD_Card_Server.Request_Read(Ciclo, Sensors, Input);
         Calcular_Caudales_Optimos(Ciclo, Input, Sensors, Usar);
         Simular_Campo_Solar(Ciclo, Input, Sensors);
         Put_Line("SC1 --> enviando datos (max 15 ms)...");
         AD_Card_Server.Request_Write_SC1(Ciclo, Sensors);
         Put_Line("");
         delay 0.15;  -- Timeout de almacenamiento

         delay until T;
      end loop;
   end Tarea_SC1;

   -- Tarea Control Módulo MD
   task body Tarea_SC2 is
      T       : Time := Clock;
      Periodo : constant Time_Span := Milliseconds(100);
   begin
      for Ciclo in 1 .. Num_Ciclos  loop
         T := T + Periodo;
         Put_Line("SC2 (Módulo MD): Ciclo " & Integer'Image(Ciclo));

         AD_Card_Server.Request_Read(Ciclo, Sensors, Input);
         Simular_Modulo_MD(Ciclo, Input, Sensors);
         Put_Line("SC2 --> enviando datos (max 15 ms)...");
         AD_Card_Server.Request_Write_SC2(Ciclo, Sensors);
         Put_Line("");
           Put_Line("Datos finales: ");
          Mostrar_Datos(Ciclo, Sensors);
         delay 0.15;  -- Timeout de almacenamiento

         delay until T;
      end loop;
   end Tarea_SC2;

begin
   Put_Line("Inicializando sistema...");
   Initialize_AD_Card;
   Put_Line("Sistema iniciado. Ejecutando tareas concurrentes...");

   delay Duration(Num_Ciclos) * 0.15;
   Put_Line("Ejecución concurrente completada.");
end Main;
