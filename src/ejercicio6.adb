with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure ejercicio6 is

   type Fecha_Nacimiento1 is record
      Dia  : Integer range 1 .. 31;
      Mes  : Integer range 1 .. 12;
      Anio : Integer range 1900 .. 2100;
   end record;

  
   type Datos_Personales is record
      Nombre          : Unbounded_String; 
      Apellidos       : Unbounded_String; 
      Fecha_Nacimiento : Fecha_Nacimiento1; 
   end record;

   
   Mis_Datos : Datos_Personales := (
      Nombre          => To_Unbounded_String("Franco Sergio"),
      Apellidos       => To_Unbounded_String("Pereyra"),
      Fecha_Nacimiento => (Dia => 28, Mes => 8, Anio => 2002)
   );

begin
   -- Imprimir los datos personales
   Put_Line("Nombre: " & To_String(Mis_Datos.Nombre));
   Put_Line("Apellidos: " & To_String(Mis_Datos.Apellidos));
   Put_Line("Fecha de nacimiento: " &
            Integer'Image(Mis_Datos.Fecha_Nacimiento.Dia) & "/" &
            Integer'Image(Mis_Datos.Fecha_Nacimiento.Mes) & "/" &
            Integer'Image(Mis_Datos.Fecha_Nacimiento.Anio));
end ejercicio6;
