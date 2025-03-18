package body simulacion is
   procedure Simular_Planta(
      k : in Integer;
      Input : in Input_Data;
      Sensors : in out Sensor_Data
   ) is
      Tt : Float;
      ST1_Previous, ST2_Previous : Float;  -- Valores anteriores de ST1 y ST2
   begin
      -- Guardar los valores anteriores de ST1 y ST2
      if k = 1 then
         ST1_Previous := ST1_Initial;  -- Valor inicial para la primera iteraci�n
         ST2_Previous := ST2_Initial;  -- Valor inicial para la primera iteraci�n
      else
         ST1_Previous := Sensors.ST1;
         ST2_Previous := Sensors.ST2;
      end if;

      -- Ecuaci�n (2): Calcular Tt
      Tt := (ST1_Previous + ST2_Previous) / 2.0;

      -- Ecuaci�n (1): Calcular ST2(k)
      Sensors.ST2 := ST1_Previous +
                     (((beta * Leq * Input.SR1) * c) / (Sensors.SC1  * Cp * rho)) -
                    (((H * (Tt - Input.ST4)) * c) / (Sensors.SC1 * Cp * rho));

      -- Ecuaci�n (3): Calcular ST1(k)
      Sensors.ST1 := Sensors.ST2 - 10.0;

      -- Ecuaci�n (4): Calcular SD1(k)
      Sensors.SD1 := 24.0 * (0.135 + 0.003 * ST2_Previous - 0.0203 * Input.ST3 -
                            0.001 * Sensors.SC2 + 0.00004 * ST2_Previous * Sensors.SC2);
   end Simular_Planta;
end simulacion;
