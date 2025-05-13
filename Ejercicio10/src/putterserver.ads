with Putter; use Putter;

package PutterServer is
   -- Procedimiento para solicitar impresión
   procedure Request_Print(Message : in String);
   
   -- Definición del tipo de tarea PutterClient dentro del paquete
   task type Putter_Client is
      entry Start(Name : in Character; Iterations : in Positive);
   end Putter_Client;
end PutterServer;
