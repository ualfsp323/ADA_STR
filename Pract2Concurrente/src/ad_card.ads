-- ads/ad_card.ads
with Data_Type; use Data_Type;

package AD_Card is
   -- Tipos de operación permitidas
   type Operation_Type is (READ, WRITE_SC1, WRITE_SC2);
   
   -- Procedimiento para acceder a la tarjeta A/D
   procedure Access_AD_Card(
      Op : Operation_Type;
      k : in Integer;
      Sensors : in out Sensor_Data;
      Input : out Input_Data;
      Success : out Boolean
   );
   
   -- Procedimiento para simular la inicialización de la tarjeta
   procedure Initialize_AD_Card;
end AD_Card;
