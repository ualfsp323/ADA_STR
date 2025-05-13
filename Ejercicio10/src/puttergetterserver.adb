with Ada.Text_IO;         use Ada.Text_IO;
with Putter;              use Putter;

package body PutterGetterServer is

   ---------------------------------
   --  Servidor protegido (candado)
   ---------------------------------
   protected Console_Lock is
      entry Acquire;
      procedure Release;
   private
      Busy : Boolean := False;
   end Console_Lock;

   protected body Console_Lock is
      entry Acquire when not Busy is
      begin
         Busy := True;
      end Acquire;

      procedure Release is
      begin
         Busy := False;
      end Release;
   end Console_Lock;

   ---------------------------------
   --  API pública
   ---------------------------------
   procedure Request_Access is
   begin
      Console_Lock.Acquire;
   end Request_Access;

   procedure Release_Access is
   begin
      Console_Lock.Release;
   end Release_Access;

   procedure Safe_Print (Msg : in String) is
   begin
      Request_Access;
      Putter.Put_Line (Msg);  
      Release_Access;
   end Safe_Print;

   ---------------------------------
   --  Tarea cliente
   ---------------------------------
   task body PutterGetter_Client is
      Task_Name    : Character;
      N_Iterations : Positive;
      Buffer       : String (1 .. 100);
      Last         : Natural;
   begin
      accept Start (Name : in Character; Iterations : in Positive) do
         Task_Name    := Name;
         N_Iterations := Iterations;
      end Start;

      for I in 1 .. N_Iterations loop
         Safe_Print ("Tarea " & Task_Name & ": Escritura" & Integer'Image (I));

         --  Mostrar prompt y leer
         Request_Access;
         Putter.Put_Line
           ("Tarea " & Task_Name & ": Introduce texto para iteración" & Integer'Image (I) & " --> ");
         Get_Line (Buffer, Last);
         Release_Access;

         Safe_Print ("Tarea " & Task_Name & ": Leíste: '" & Buffer (1 .. Last) & "'");
         delay 0.1;
      end loop;
   end PutterGetter_Client;

end PutterGetterServer;
