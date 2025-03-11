with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Ejercicio3 is
   -- Tamaño de la matriz (ajusta según el archivo input.txt)
   Filas : constant Natural := 5;
   Columnas : constant Natural := 10;

   -- Definición de la matriz
   type Matriz is array (1 .. Filas, 1 .. Columnas) of Integer;

   -- Variables para la matriz original y su transpuesta
   Matriz_Original : Matriz;
   Matriz_Transpuesta : array (1 .. Columnas, 1 .. Filas) of Integer;

   -- Archivos de entrada y salida
   Fichero_Entrada : File_Type;
   Fichero_Salida : File_Type;

begin
   -- Abrir el archivo de entrada
   Open(Fichero_Entrada, In_File, "input.txt");

   -- Leer la matriz desde el archivo
   for I in 1 .. Filas loop
      for J in 1 .. Columnas loop
         Get(Fichero_Entrada, Matriz_Original(I, J));
      end loop;
   end loop;

   -- Cerrar el archivo de entrada
   Close(Fichero_Entrada);

   -- Calcular la matriz transpuesta
   for I in 1 .. Filas loop
      for J in 1 .. Columnas loop
         Matriz_Transpuesta(J, I) := Matriz_Original(I, J);
      end loop;
   end loop;

   -- Abrir el archivo de salida
   Create(Fichero_Salida, Out_File, "output.txt");

   -- Escribir la matriz transpuesta en el archivo de salida
   for I in 1 .. Columnas loop
      for J in 1 .. Filas loop
         Put(Fichero_Salida, Matriz_Transpuesta(I, J), Width => 3);
      end loop;
      New_Line(Fichero_Salida);
   end loop;

   -- Cerrar el archivo de salida
   Close(Fichero_Salida);

   Put_Line("Matriz transpuesta guardada en 'output.txt'.");
end Ejercicio3;
