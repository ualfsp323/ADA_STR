pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E073 : Short_Integer; pragma Import (Ada, E073, "system__os_lib_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "ada__exceptions_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__soft_links_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exception_table_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "ada__containers_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "ada__io_exceptions_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__strings__maps__constants_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "interfaces__c_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "system__exceptions_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "system__object_reader_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__dwarf_lines_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__soft_links__initialize_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "system__traceback__symbolic_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "ada__strings__utf_encoding_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "ada__tags_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "ada__strings__text_buffers_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "interfaces__c__strings_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "ada__streams_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__file_control_block_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__finalization_root_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "ada__finalization_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__file_io_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "system__task_info_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ada__calendar_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar__delays_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "ada__real_time_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "ada__text_io_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "data_type_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "controlador_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "guardar_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "leer_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ad_card_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "mostrar_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "seguridad_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "simulacion_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E107 := E107 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__file_io__finalize_body");
      begin
         E131 := E131 - 1;
         F2;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E029 := E029 + 1;
      Ada.Containers'Elab_Spec;
      E042 := E042 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E069 := E069 + 1;
      Ada.Strings'Elab_Spec;
      E054 := E054 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E056 := E056 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E060 := E060 + 1;
      Interfaces.C'Elab_Spec;
      E079 := E079 + 1;
      System.Exceptions'Elab_Spec;
      E030 := E030 + 1;
      System.Object_Reader'Elab_Spec;
      E081 := E081 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E049 := E049 + 1;
      System.Os_Lib'Elab_Body;
      E073 := E073 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E025 := E025 + 1;
      E017 := E017 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E041 := E041 + 1;
      E012 := E012 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E113 := E113 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E119 := E119 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      Ada.Strings.Text_Buffers'Elab_Body;
      E111 := E111 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E194 := E194 + 1;
      Ada.Streams'Elab_Spec;
      E109 := E109 + 1;
      System.File_Control_Block'Elab_Spec;
      E135 := E135 + 1;
      System.Finalization_Root'Elab_Spec;
      System.Finalization_Root'Elab_Body;
      E134 := E134 + 1;
      Ada.Finalization'Elab_Spec;
      E132 := E132 + 1;
      System.File_Io'Elab_Body;
      E131 := E131 + 1;
      System.Task_Info'Elab_Spec;
      E202 := E202 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E010 := E010 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E008 := E008 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E188 := E188 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E107 := E107 + 1;
      Data_Type'Elab_Spec;
      E166 := E166 + 1;
      E210 := E210 + 1;
      E159 := E159 + 1;
      E168 := E168 + 1;
      E005 := E005 + 1;
      E212 := E212 + 1;
      E214 := E214 + 1;
      E216 := E216 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\data_type.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\controlador.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\guardar.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\leer.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\ad_card.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\mostrar.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\seguridad.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\simulacion.o
   --   C:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\main.o
   --   -LC:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\
   --   -LC:\Users\Franco\Documents\ADA\ADA_STR\Pract2Concurrente\obj\
   --   -LC:/gnat/2021/lib/gcc/x86_64-w64-mingw32/10.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
