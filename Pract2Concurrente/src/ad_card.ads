with Data_Type; use Data_Type;

package AD_Card is
   type Operation_Type is (READ, WRITE_SC1, WRITE_SC2);

   procedure Initialize_AD_Card;

   -- Servidor protegido para acceso exclusivo
   protected AD_Card_Server is
      entry Request_Read(k : in Integer; Sensors : in out Sensor_Data; Input : out Input_Data);
      entry Request_Write_SC1(k : in Integer; Sensors : in Sensor_Data);
      entry Request_Write_SC2(k : in Integer; Sensors : in Sensor_Data);
   private
      Busy : Boolean := False; 
   end AD_Card_Server;
end AD_Card;
