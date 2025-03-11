with Ada.Text_IO; use Ada.Text_IO;

procedure Ejercicio2 is
   -- Cadena inicial
   Cadena : constant String := "QWERTYU";

   -- Variable para almacenar la cadena de entrada (opcional)
   Entrada : String(1 .. 100);  -- Tama�o m�ximo de 100 caracteres
   Longitud : Natural;           -- Longitud real de la cadena de entrada
begin
   -- Parte 1: Procesar la cadena inicial "QWERTYU"
   Put_Line("Procesando la cadena inicial 'QWERTYU':");
   for I in Cadena'Range loop
      case Cadena(I) is
         when 'Q' | 'W' =>
            Put_Line("'" & Cadena(I) & "': Opci�n 1");
         when 'E' | 'R' | 'T' =>
            Put_Line("'" & Cadena(I) & "': Opci�n 2");
         when 'Y' =>
            Put_Line("'" & Cadena(I) & "': Opci�n 3");
         when others =>
            Put_Line("'" & Cadena(I) & "': Otra opci�n");
      end case;
   end loop;

   -- Parte 2 (Opcional): Procesar una cadena de entrada por teclado
   Put_Line("Introduce una cadena de texto (m�ximo 100 caracteres):");
   Get_Line(Entrada, Longitud);  -- Leer la cadena de entrada

   Put_Line("Procesando la cadena de entrada:");
   for I in 1 .. Longitud loop
      case Entrada(I) is
         when 'Q' | 'W' =>
            Put_Line("'" & Entrada(I) & "': Opci�n 1");
         when 'E' | 'R' | 'T' =>
            Put_Line("'" & Entrada(I) & "': Opci�n 2");
         when 'Y' =>
            Put_Line("'" & Entrada(I) & "': Opci�n 3");
         when others =>
            Put_Line("'" & Entrada(I) & "': Otra opci�n");
      end case;
   end loop;
end Ejercicio2;
