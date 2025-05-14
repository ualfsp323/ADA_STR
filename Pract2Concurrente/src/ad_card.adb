with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with leer; use leer;
with guardar; use guardar;

package body AD_Card is
   procedure Initialize_AD_Card is
   begin
      Put_Line("Tarjeta A/D inicializada");
      Inicializar_Archivos;
   end Initialize_AD_Card;

   protected body AD_Card_Server is
    

      entry Request_Read(k : in Integer; Sensors : in out Sensor_Data; Input : out Input_Data)
         when not Busy is
      begin
         Busy := True;
         Leer_Datos(k, Input, Sensors);
         Put_Line("Lectura A/D completada para iteración " & Integer'Image(k));
         Busy := False;
      end Request_Read;

      entry Request_Write_SC1(k : in Integer; Sensors : in Sensor_Data)
         when not Busy is
      begin
         Busy := True;
         Guardar_Datos(k, Sensors);
         Put_Line("Escritura A/D en SC1: ");
         Put(Sensors.SC1, Fore => 1, Aft => 2, Exp => 0);
         Put_Line(" L/min");
         Busy := False;
      end Request_Write_SC1;

      entry Request_Write_SC2(k : in Integer; Sensors : in Sensor_Data)
         when not Busy is
      begin
         Busy := True;
         Guardar_Datos(k, Sensors);
         Put_Line("Escritura A/D en SC2: ");
         Put(Sensors.SC2, Fore => 1, Aft => 2, Exp => 0);
         Put_Line(" L/h");
         Busy := False;
      end Request_Write_SC2;
   end AD_Card_Server;
end AD_Card;
