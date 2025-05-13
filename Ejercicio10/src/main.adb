with PutterServer; use PutterServer;

procedure Main is
   -- Crear instancias de las tareas cliente
   Task_A : Putter_Client;
   Task_B : Putter_Client;
   Task_C : Putter_Client;
begin
   -- Iniciar las tareas con sus parámetros (5 iteraciones cada una)
   Task_A.Start('A', 5);
   Task_B.Start('B', 5);
   Task_C.Start('C', 5);
end Main;
