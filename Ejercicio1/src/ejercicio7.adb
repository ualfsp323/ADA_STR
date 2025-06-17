with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Ejercicio7 is
   type Fecha_Nacimiento_Data is record
      Dia  : Integer range 1 .. 31;
      Mes  : Integer range 1 .. 12;
      Anio : Integer range 1900 .. 2100;
   end record;

   type Datos_Personales is record
      Nombre          : Unbounded_String;  
      Apellidos       : Unbounded_String;  
      Fecha_Nacimiento : Fecha_Nacimiento_Data; 
   end record;

   type Nodo;
   type Puntero_Nodo is access Nodo;

   type Nodo is record
      Datos : Datos_Personales;  
      Siguiente : Puntero_Nodo;  
   end record;

 
   Mi_Nodo : Puntero_Nodo := new Nodo'(
      Datos => (
         Nombre          => To_Unbounded_String("Juan"),
         Apellidos       => To_Unbounded_String("Pérez García"),
         Fecha_Nacimiento => (Dia => 15, Mes => 8, Anio => 1990)
      ),
      Siguiente => null
   );

   -- Crear un segundo nodo
   Segundo_Nodo : Puntero_Nodo := new Nodo'(
      Datos => (
         Nombre          => To_Unbounded_String("Ana"),
         Apellidos       => To_Unbounded_String("López Martínez"),
         Fecha_Nacimiento => (Dia => 20, Mes => 5, Anio => 1985)
      ),
      Siguiente => null  
   );

begin
   -- Enlazar el primer nodo con el segundo
   Mi_Nodo.Siguiente := Segundo_Nodo;

   -- Recorrer la lista e imprimir los datos
   declare
      Nodo_Actual : Puntero_Nodo := Mi_Nodo;
   begin
      while Nodo_Actual /= null loop
         Put_Line("Nombre: " & To_String(Nodo_Actual.Datos.Nombre));
         Put_Line("Apellidos: " & To_String(Nodo_Actual.Datos.Apellidos));
         Put_Line("Fecha de nacimiento: " &
                  Integer'Image(Nodo_Actual.Datos.Fecha_Nacimiento.Dia) & "/" &
                  Integer'Image(Nodo_Actual.Datos.Fecha_Nacimiento.Mes) & "/" &
                  Integer'Image(Nodo_Actual.Datos.Fecha_Nacimiento.Anio));
         Nodo_Actual := Nodo_Actual.Siguiente;  -- Avanzar al siguiente nodo
      end loop;
   end;
end Ejercicio7;
