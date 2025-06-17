with Putter;  

package PutterGetterServer is
   --  Sincroniza el acceso a la consola
   procedure Request_Access;
   procedure Release_Access;

   --  Escribe de forma segura usando Putter
   procedure Safe_Print (Msg : in String);

   --  Tarea cliente que hace N lecturas/escrituras
   task type PutterGetter_Client is
      entry Start (Name : in Character; Iterations : in Positive);
   end PutterGetter_Client;
end PutterGetterServer;
