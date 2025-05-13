with PutterGetterServer; use PutterGetterServer;

procedure Main is
   -- Crear instancias de las tareas cliente
   Task_A : PutterGetter_Client;
   Task_B : PutterGetter_Client;
   Task_C : PutterGetter_Client;
begin
   -- Iniciar las tareas con sus parámetros (2 iteraciones cada una para no hacerlo muy largo)
   Task_A.Start('A', 2);
   Task_B.Start('B', 2);
   Task_C.Start('C', 2);
end Main;
