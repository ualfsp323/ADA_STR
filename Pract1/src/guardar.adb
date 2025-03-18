with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body guardar is

   -- Procedimiento para inicializar los archivos
   procedure Inicializar_Archivos is
      File_Data, File_Alarm : File_Type;
   begin
      -- Inicializar data_log.txt
      begin
         Open(File_Data, Out_File, "data_log.txt");
         -- Si el archivo ya existe, se abre en modo Out_File, lo que elimina su contenido
      exception
         when Name_Error =>
            -- Si el archivo no existe, se crea
            Create(File_Data, Out_File, "data_log.txt");
      end;
      Close(File_Data);

      -- Inicializar alarm_log.txt
      begin
         Open(File_Alarm, Out_File, "alarm_log.txt");
         -- Si el archivo ya existe, se abre en modo Out_File, lo que elimina su contenido
      exception
         when Name_Error =>
            -- Si el archivo no existe, se crea
            Create(File_Alarm, Out_File, "alarm_log.txt");
      end;
      Close(File_Alarm);
   end Inicializar_Archivos;

   -- Procedimiento para guardar los datos en data_log.txt
   procedure Guardar_Datos(k : in Integer; Sensors : in Sensor_Data) is
      File : File_Type;
   begin
      -- Abrir el archivo en modo append (añadir al final)
      Open(File, Append_File, "data_log.txt");

      -- Escribir los valores en el archivo con formato controlado
      Put(File, Integer'Image(k));  -- Escribir el valor de k
      Put(File, " ");
      Put(File, Sensors.ST1, Fore => 1, Aft => 2, Exp => 0);  -- ST1 con 2 decimales
      Put(File, " ");
      Put(File, Sensors.ST2, Fore => 1, Aft => 2, Exp => 0);  -- ST2 con 2 decimales
      Put(File, " ");
      Put(File, Sensors.ST3, Fore => 1, Aft => 2, Exp => 0);  -- ST3 con 2 decimales
      Put(File, " ");
      Put(File, Sensors.ST4, Fore => 1, Aft => 2, Exp => 0);  -- ST4 con 2 decimales
      Put(File, " ");
      Put(File, Sensors.SC1, Fore => 1, Aft => 2, Exp => 0);  -- SC1 con 2 decimales
      Put(File, " ");
      Put(File, Sensors.SC2, Fore => 1, Aft => 2, Exp => 0);  -- SC2 con 2 decimales
      Put(File, " ");
      Put(File, Sensors.SR1, Fore => 1, Aft => 2, Exp => 0);  -- SR1 con 2 decimales
      Put(File, " ");
      Put(File, Sensors.SD1, Fore => 1, Aft => 2, Exp => 0);  -- SD1 con 2 decimales
      New_Line(File);  -- Nueva línea

      -- Cerrar el archivo
      Close(File);
   end Guardar_Datos;

   -- Procedimiento para guardar alarmas en alarm_log.txt
   procedure Guardar_Alarma(k : in Integer; mensaje : in String) is
      File : File_Type;
   begin
      -- Abrir el archivo en modo append (añadir al final)
      Open(File, Append_File, "alarm_log.txt");

      -- Escribir el mensaje de alarma
      Put_Line(File, "Iteración " & Integer'Image(k) & ": " & mensaje);

      -- Cerrar el archivo
      Close(File);
   end Guardar_Alarma;

end guardar;
