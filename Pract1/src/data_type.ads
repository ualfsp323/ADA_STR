package Data_Type is
   -- Definici�n de constantes
   beta : constant Float := 0.13;      -- Coeficiente beta
   Leq : constant Float := 16.0;       -- Longitud equivalente
   H : constant Float := 4.0;          -- Coeficiente de transferencia de calor
   c : constant Float := 1080000.0;    -- Constante de tiempo
   Cp : constant Float := 4190.0;      -- Capacidad calor�fica
   rho : constant Float := 976.0;      -- Densidad del fluido

   -- Caudales fijos
   SC1 : constant Float := 16.0;       -- Caudal fijo para SC1 [L/min]
   SC2 : constant Float := 425.0;      -- Caudal fijo para SC2 [L/h]

   -- Valores iniciales
   ST2_Initial : constant Float := 58.0;  -- Temperatura inicial en ST2 [�C]
   ST1_Initial : constant Float := 48.0;  -- Temperatura inicial en ST1 [�C]

   -- L�mites de seguridad
   Max_Temperature : constant Float := 95.0;  -- Temperatura m�xima permitida [�C]

   -- Definici�n de tipos de datos
   type Sensor_Data is record
      ST1, ST2, ST3, ST4 : Float;  -- Sensores de temperatura [�C]
      SC1, SC2 : Float;            -- Sensores de caudal [L/min] y [L/h]
      SR1 : Float;                 -- Sensor de radiaci�n [W/m�]
      SD1 : Float;                 -- Sensor de destilado [L/h]
   end record;

   type Input_Data is record
      k : Integer;                 -- Iteraci�n
      SR1, ST4, ST3 : Float;      -- Datos de entrada: radiaci�n, temperatura ambiente, temperatura de entrada
   end record;

   -- Excepciones
   Temperature_Exceeded : exception;  -- Excepci�n para cuando se supera la temperatura m�xima
end Data_Type;
