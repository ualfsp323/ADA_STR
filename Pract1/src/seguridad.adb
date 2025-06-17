with Ada.Text_IO; use Ada.Text_IO;
with guardar; use guardar;
with Data_Type; use Data_Type;

package body seguridad is
   procedure Controlar_Seguridad(k : in Integer; ST2 : in Float) is
   begin
      -- Verificar si la temperatura supera el límite de seguridad
      if ST2 > Max_Temperature then
         Put_Line("ALARMA: Temperatura en ST2 supera 95 °C en iteración " & Integer'Image(k));
         Guardar_Alarma(k, "Temperatura en ST2 supera 95 °C");
      end if;
   end Controlar_Seguridad;
end seguridad;
