with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Data_Type; use Data_Type;
with controlador; use controlador;
with guardar; use guardar;
with leer; use leer;
with mostrar; use mostrar;
with seguridad; use seguridad;
with simulacion; use simulacion;

procedure Main is
   -- Variables del sistema
   Sensors : Sensor_Data;
   Input : Input_Data;
   Usar_Caudales_Optimos : Boolean := True;

   -- Variables para el control del tiempo
   Start_Time : Time;
   Next_Solar_Control : Time;
   Next_MD_Control : Time;
   Next_Safety_Check : Time;
   Next_Display_Update : Time;
   Period_Solar_Control : constant Time_Span := Milliseconds(50);
   Period_MD_Control : constant Time_Span := Milliseconds(100);
   Period_Safety_Check : constant Time_Span := Milliseconds(25);
   Period_Display_Update : constant Time_Span := Milliseconds(100);

   -- Timeouts
   Timeout_Data_Storage : constant Time_Span := Milliseconds(15);
   Timeout_Alarm_Storage : constant Time_Span := Milliseconds(10);
   Timeout_Display : constant Time_Span := Milliseconds(15);

   -- Flags para controlar ejecuciones pendientes
   Solar_Control_Pending : Boolean := False;
   MD_Control_Pending : Boolean := False;
   Safety_Check_Pending : Boolean := False;
   Display_Update_Pending : Boolean := False;

   -- Contador de iteraciones
   k : Integer := 20;

   -- Variables para el almacenamiento de datos
   Data_Storage_Start : Time;
   Alarm_Storage_Start : Time;
   Display_Start : Time;

   -- Función para verificar timeout
   function Timeout_Expired(Start : Time; Timeout : Time_Span) return Boolean is
   begin
      return Clock > Start + Timeout;
   end Timeout_Expired;

begin
   -- Inicialización
   Put_Line("Inicializando sistema...");
   Inicializar_Archivos;

   -- Configurar tiempos iniciales
   Start_Time := Clock;
   Next_Solar_Control := Start_Time;
   Next_MD_Control := Start_Time;
   Next_Safety_Check := Start_Time;
   Next_Display_Update := Start_Time;

   -- Bucle principal del ejecutivo cíclico
   for k in 1 .. 20 loop
      -- Leer datos de entrada (simulado)
      Leer_Datos(k, Input, Sensors);

      -- Verificar tiempos de ejecución para cada tarea
      if Clock >= Next_Solar_Control then
         Solar_Control_Pending := True;
         Next_Solar_Control := Next_Solar_Control + Period_Solar_Control;
      end if;

      if Clock >= Next_MD_Control then
         MD_Control_Pending := True;
         Next_MD_Control := Next_MD_Control + Period_MD_Control;
      end if;

      if Clock >= Next_Safety_Check then
         Safety_Check_Pending := True;
         Next_Safety_Check := Next_Safety_Check + Period_Safety_Check;
      end if;

      if Clock >= Next_Display_Update then
         Display_Update_Pending := True;
         Next_Display_Update := Next_Display_Update + Period_Display_Update;
      end if;

      -- Ejecutar tareas pendientes según prioridad

      -- 1. Control del campo solar (50ms)
      if Solar_Control_Pending then
         Put_Line("--- Ejecutando Control del Campo Solar (50ms) ---");
         Put_Line("Leyendo datos de sensores (A/D) para control solar...");

         -- Calcular y aplicar control para SC1
         Calcular_Caudales_Optimos(k, Input, Sensors, Usar_Caudales_Optimos);

         Put("Enviando señal de control a SC1: ");
         Put(Sensors.SC1, Fore => 1, Aft => 2, Exp => 0);  -- SC1 con 2 decimales
         Put_Line(" L/min");

         -- Simular solo el campo solar
         Simular_Campo_Solar(k, Input, Sensors);
         Put("ST2 actualizado:  ");
         Put(Sensors.ST2, Fore => 1, Aft => 2, Exp => 0);  -- ST2 con 2 decimales
         Put_Line(" °C");

         -- Enviar datos a visualización y almacenamiento
         Display_Update_Pending := True;
         Put_Line("Intentando enviar datos a almacenamiento...");
         Data_Storage_Start := Clock;
         if not Timeout_Expired(Data_Storage_Start, Timeout_Data_Storage) then
            Guardar_Datos(k, Sensors);
            Put_Line("Datos almacenados correctamente.");
            New_Line;
         else
            Put_Line("Timeout: No se pudo almacenar datos (15ms excedidos).");
            New_Line;
         end if;

         Solar_Control_Pending := False;
      end if;

      -- 2. Control del módulo MD (100ms)
      if MD_Control_Pending then
         Put_Line("--- Ejecutando Control del Módulo MD (100ms) ---");
         Put_Line("Leyendo datos de sensores (A/D) para control MD...");

         -- Calcular y aplicar control para SC2
         Calcular_Caudales_Optimos(k, Input, Sensors, Usar_Caudales_Optimos);
         Put("Enviando señal de control a SC2: ");
         Put(Sensors.SC2, Fore => 1, Aft => 2, Exp => 0);  -- SC2 con 2 decimales
         Put_Line(" L/h");


         -- Simular solo el módulo MD
         Simular_Modulo_MD(k, Input, Sensors);
         Put("SD1 actualizado:  ");
         Put(Sensors.SD1, Fore => 1, Aft => 2, Exp => 0);  -- SD1 con 2 decimales
         Put_Line(" L/h");

         -- Enviar datos a visualización y almacenamiento
         Display_Update_Pending := True;
         Put_Line("Intentando enviar datos a almacenamiento...");
         Data_Storage_Start := Clock;
         if not Timeout_Expired(Data_Storage_Start, Timeout_Data_Storage) then
            Guardar_Datos(k, Sensors);
            Put_Line("Datos almacenados correctamente.");
            New_Line;
         else
            Put_Line("Timeout: No se pudo almacenar datos (15ms excedidos).");
            New_Line;
         end if;

         MD_Control_Pending := False;
      end if;

      -- 3. Comprobación de seguridad (25ms)
      if Safety_Check_Pending then
         Put_Line("--- Ejecutando Comprobación de Seguridad (25ms) ---");
         Put_Line("Leyendo datos de sensores (A/D) para seguridad...");

         -- Comprobar límites de seguridad
         Controlar_Seguridad(k, Sensors.ST2);

         -- Enviar información a visualización
         Display_Update_Pending := True;

         -- Enviar alarmas si es necesario
         if Sensors.ST2 > Max_Temperature then
            Put_Line("Intentando enviar alarma a almacenamiento...");
            Alarm_Storage_Start := Clock;
            if not Timeout_Expired(Alarm_Storage_Start, Timeout_Alarm_Storage) then
               Guardar_Alarma(k, "Temperatura en ST2 supera 95 °C");
               Put_Line("Alarma almacenada correctamente.");
            else
               Put_Line("Timeout: No se pudo almacenar alarma (10ms excedidos).");
            end if;
         end if;

         Safety_Check_Pending := False;
      end if;

      -- 4. Actualización de pantalla (100ms)
      if Display_Update_Pending then
         Put_Line("--- Actualizando Pantalla (100ms) ---");
         Display_Start := Clock;
         if not Timeout_Expired(Display_Start, Timeout_Display) then
            Put_Line("Mostrando información por pantalla...");
            Mostrar_Datos(k, Sensors);
            Put_Line("Visualización completada en 10ms.");
         else
            Put_Line("Timeout: Visualización abortada (15ms excedidos).");
         end if;
         Display_Update_Pending := False;
      end if;


      delay 1.001;
   end loop;
end Main;
