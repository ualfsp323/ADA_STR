-- adb/ad_card.adb
with Ada.Text_IO; use Ada.Text_IO;
with leer; use leer;
with guardar; use guardar;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body AD_Card is
   -- Variable para simular el estado de la tarjeta (ocupada/libre)
   Is_Busy : Boolean := False;
   
   procedure Initialize_AD_Card is
   begin
      Is_Busy := False;
      Put_Line("Tarjeta A/D inicializada");
      Inicializar_Archivos; -- Reutilizando tu procedimiento existente
   end Initialize_AD_Card;
   
   procedure Access_AD_Card(
      Op : Operation_Type;
      k : in Integer;
      Sensors : in out Sensor_Data;
      Input : out Input_Data;
      Success : out Boolean
   ) is
   begin
      Success := False;
      
      -- Simular acceso exclusivo
      if Is_Busy then
         Put_Line("Error: Tarjeta A/D ocupada. Reintentando...");
         delay 0.2; -- Pequeño retardo para simular espera
         if Is_Busy then
            Put_Line("Error: No se pudo acceder a la tarjeta A/D");
            return;
         end if;
      end if;
      
      Is_Busy := True;
      
      case Op is
         when READ =>
            Leer_Datos(k, Input, Sensors);
            Put_Line("Lectura A/D completada para iteración " & Integer'Image(k));
            
         when WRITE_SC1 =>
            Guardar_Datos(k, Sensors); 
            Put_Line("Escritura A/D en SC1: ");
            Put(Sensors.SC1, Fore => 1, Aft => 2, Exp => 0);  
            Put_Line(" L/min");
            Put_Line("");

         when WRITE_SC2 =>
            Guardar_Datos(k, Sensors); 
            Put_Line("Escritura A/D en SC2: ");
            Put(Sensors.SC2, Fore => 1, Aft => 2, Exp => 0);  -- SC2 con 2 decimales
            Put_Line(" L/h");
            Put_Line("");

      end case;
      
      Success := True;
      Is_Busy := False;
   end Access_AD_Card;
end AD_Card;
