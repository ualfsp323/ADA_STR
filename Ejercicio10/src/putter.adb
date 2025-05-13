with Ada.Text_IO;
package body Putter is

   procedure Put_Line (str: String) is
   begin
      for i in str'Range loop
         Ada.Text_IO.Put(str(i));
         delay 0.001;
      end loop;

      Ada.Text_IO.New_Line;
   end Put_Line;

end Putter;
