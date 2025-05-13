package body PutterServer is
   -- Servidor protegido para gestionar las impresiones
   protected Print_Server is
      entry Request_Print(Message : in String);
   private
      Busy : Boolean := False;
   end Print_Server;

   protected body Print_Server is
      entry Request_Print(Message : in String) when not Busy is
      begin
         Busy := True;
         Put_Line(Message);
         Busy := False;
      end Request_Print;
   end Print_Server;

   -- Implementación del procedimiento público
   procedure Request_Print(Message : in String) is
   begin
      Print_Server.Request_Print(Message);
   end Request_Print;
   
   -- Implementación del tipo de tarea Putter_Client
   task body Putter_Client is
      Task_Name : Character;
      N_Iterations : Positive;
   begin
      accept Start(Name : in Character; Iterations : in Positive) do
         Task_Name := Name;
         N_Iterations := Iterations;
      end Start;
      
      for i in 1..N_Iterations loop
         Request_Print("Tarea " & Task_Name & ": " & Integer'Image(i));
         delay 0.1; -- Pequeño retardo para permitir alternancia
      end loop;
   end Putter_Client;
end PutterServer;
