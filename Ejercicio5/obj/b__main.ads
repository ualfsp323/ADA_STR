pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2021 (20210519-103)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#6cfcf9ad#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#2e11c0b1#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#664ecad3#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#8c178268#;
   pragma Export (C, u00005, "ada__strings__text_buffersB");
   u00006 : constant Version_32 := 16#0800bb5e#;
   pragma Export (C, u00006, "ada__strings__text_buffersS");
   u00007 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00007, "ada__stringsS");
   u00008 : constant Version_32 := 16#2ffa5114#;
   pragma Export (C, u00008, "systemS");
   u00009 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00009, "system__exception_tableB");
   u00010 : constant Version_32 := 16#3cc6bdbe#;
   pragma Export (C, u00010, "system__exception_tableS");
   u00011 : constant Version_32 := 16#adf22619#;
   pragma Export (C, u00011, "system__soft_linksB");
   u00012 : constant Version_32 := 16#63b0b7fe#;
   pragma Export (C, u00012, "system__soft_linksS");
   u00013 : constant Version_32 := 16#e10050ae#;
   pragma Export (C, u00013, "system__secondary_stackB");
   u00014 : constant Version_32 := 16#de516690#;
   pragma Export (C, u00014, "system__secondary_stackS");
   u00015 : constant Version_32 := 16#f75ad8f1#;
   pragma Export (C, u00015, "ada__exceptionsB");
   u00016 : constant Version_32 := 16#eb3857a3#;
   pragma Export (C, u00016, "ada__exceptionsS");
   u00017 : constant Version_32 := 16#19b42e05#;
   pragma Export (C, u00017, "ada__exceptions__last_chance_handlerB");
   u00018 : constant Version_32 := 16#fc9377ef#;
   pragma Export (C, u00018, "ada__exceptions__last_chance_handlerS");
   u00019 : constant Version_32 := 16#7134ce8f#;
   pragma Export (C, u00019, "system__exceptionsS");
   u00020 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00020, "system__exceptions__machineB");
   u00021 : constant Version_32 := 16#59a6462e#;
   pragma Export (C, u00021, "system__exceptions__machineS");
   u00022 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00022, "system__exceptions_debugB");
   u00023 : constant Version_32 := 16#1fe22d38#;
   pragma Export (C, u00023, "system__exceptions_debugS");
   u00024 : constant Version_32 := 16#9f73225f#;
   pragma Export (C, u00024, "system__img_intS");
   u00025 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00025, "system__storage_elementsB");
   u00026 : constant Version_32 := 16#02391b10#;
   pragma Export (C, u00026, "system__storage_elementsS");
   u00027 : constant Version_32 := 16#01838199#;
   pragma Export (C, u00027, "system__tracebackB");
   u00028 : constant Version_32 := 16#6f77a74f#;
   pragma Export (C, u00028, "system__tracebackS");
   u00029 : constant Version_32 := 16#1f08c83e#;
   pragma Export (C, u00029, "system__traceback_entriesB");
   u00030 : constant Version_32 := 16#09528275#;
   pragma Export (C, u00030, "system__traceback_entriesS");
   u00031 : constant Version_32 := 16#8dd2b87e#;
   pragma Export (C, u00031, "system__traceback__symbolicB");
   u00032 : constant Version_32 := 16#4f57b9be#;
   pragma Export (C, u00032, "system__traceback__symbolicS");
   u00033 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00033, "ada__containersS");
   u00034 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00034, "ada__exceptions__tracebackB");
   u00035 : constant Version_32 := 16#bba159a5#;
   pragma Export (C, u00035, "ada__exceptions__tracebackS");
   u00036 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00036, "system__bounded_stringsB");
   u00037 : constant Version_32 := 16#5807700d#;
   pragma Export (C, u00037, "system__bounded_stringsS");
   u00038 : constant Version_32 := 16#66134eae#;
   pragma Export (C, u00038, "system__crtlS");
   u00039 : constant Version_32 := 16#896564a3#;
   pragma Export (C, u00039, "system__parametersB");
   u00040 : constant Version_32 := 16#68a895df#;
   pragma Export (C, u00040, "system__parametersS");
   u00041 : constant Version_32 := 16#13176495#;
   pragma Export (C, u00041, "system__dwarf_linesB");
   u00042 : constant Version_32 := 16#881894a3#;
   pragma Export (C, u00042, "system__dwarf_linesS");
   u00043 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00043, "ada__charactersS");
   u00044 : constant Version_32 := 16#ba03ad8f#;
   pragma Export (C, u00044, "ada__characters__handlingB");
   u00045 : constant Version_32 := 16#21df700b#;
   pragma Export (C, u00045, "ada__characters__handlingS");
   u00046 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00046, "ada__characters__latin_1S");
   u00047 : constant Version_32 := 16#24ece25f#;
   pragma Export (C, u00047, "ada__strings__mapsB");
   u00048 : constant Version_32 := 16#ac61938c#;
   pragma Export (C, u00048, "ada__strings__mapsS");
   u00049 : constant Version_32 := 16#1db72f30#;
   pragma Export (C, u00049, "system__bit_opsB");
   u00050 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00050, "system__bit_opsS");
   u00051 : constant Version_32 := 16#04fd2587#;
   pragma Export (C, u00051, "system__unsigned_typesS");
   u00052 : constant Version_32 := 16#20c3a773#;
   pragma Export (C, u00052, "ada__strings__maps__constantsS");
   u00053 : constant Version_32 := 16#edec285f#;
   pragma Export (C, u00053, "interfacesS");
   u00054 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00054, "system__address_imageB");
   u00055 : constant Version_32 := 16#8e16cc2e#;
   pragma Export (C, u00055, "system__address_imageS");
   u00056 : constant Version_32 := 16#58ecb7ed#;
   pragma Export (C, u00056, "system__img_unsS");
   u00057 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00057, "system__ioB");
   u00058 : constant Version_32 := 16#b1b8a65b#;
   pragma Export (C, u00058, "system__ioS");
   u00059 : constant Version_32 := 16#c1351856#;
   pragma Export (C, u00059, "system__mmapB");
   u00060 : constant Version_32 := 16#45fa04ea#;
   pragma Export (C, u00060, "system__mmapS");
   u00061 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00061, "ada__io_exceptionsS");
   u00062 : constant Version_32 := 16#6c9b7dbc#;
   pragma Export (C, u00062, "system__mmap__os_interfaceB");
   u00063 : constant Version_32 := 16#52ab6463#;
   pragma Export (C, u00063, "system__mmap__os_interfaceS");
   u00064 : constant Version_32 := 16#c7b29a75#;
   pragma Export (C, u00064, "system__os_libB");
   u00065 : constant Version_32 := 16#1c53dcbe#;
   pragma Export (C, u00065, "system__os_libS");
   u00066 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00066, "system__case_utilB");
   u00067 : constant Version_32 := 16#102fe740#;
   pragma Export (C, u00067, "system__case_utilS");
   u00068 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00068, "system__stringsB");
   u00069 : constant Version_32 := 16#63b7b2c6#;
   pragma Export (C, u00069, "system__stringsS");
   u00070 : constant Version_32 := 16#fb01eaa4#;
   pragma Export (C, u00070, "interfaces__cB");
   u00071 : constant Version_32 := 16#7300324d#;
   pragma Export (C, u00071, "interfaces__cS");
   u00072 : constant Version_32 := 16#a2bb689b#;
   pragma Export (C, u00072, "system__object_readerB");
   u00073 : constant Version_32 := 16#7d8b329a#;
   pragma Export (C, u00073, "system__object_readerS");
   u00074 : constant Version_32 := 16#f21a80dd#;
   pragma Export (C, u00074, "system__val_lliS");
   u00075 : constant Version_32 := 16#197f7a7d#;
   pragma Export (C, u00075, "system__val_lluS");
   u00076 : constant Version_32 := 16#879d81a3#;
   pragma Export (C, u00076, "system__val_utilB");
   u00077 : constant Version_32 := 16#835ae7ea#;
   pragma Export (C, u00077, "system__val_utilS");
   u00078 : constant Version_32 := 16#992dbac1#;
   pragma Export (C, u00078, "system__exception_tracesB");
   u00079 : constant Version_32 := 16#2dd6549f#;
   pragma Export (C, u00079, "system__exception_tracesS");
   u00080 : constant Version_32 := 16#e3e8dc36#;
   pragma Export (C, u00080, "system__win32S");
   u00081 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00081, "system__wch_conB");
   u00082 : constant Version_32 := 16#348773c6#;
   pragma Export (C, u00082, "system__wch_conS");
   u00083 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00083, "system__wch_stwB");
   u00084 : constant Version_32 := 16#19965fc7#;
   pragma Export (C, u00084, "system__wch_stwS");
   u00085 : constant Version_32 := 16#1f681dab#;
   pragma Export (C, u00085, "system__wch_cnvB");
   u00086 : constant Version_32 := 16#3b30c935#;
   pragma Export (C, u00086, "system__wch_cnvS");
   u00087 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00087, "system__wch_jisB");
   u00088 : constant Version_32 := 16#bb40d014#;
   pragma Export (C, u00088, "system__wch_jisS");
   u00089 : constant Version_32 := 16#ce3e0e21#;
   pragma Export (C, u00089, "system__soft_links__initializeB");
   u00090 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00090, "system__soft_links__initializeS");
   u00091 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00091, "system__stack_checkingB");
   u00092 : constant Version_32 := 16#a1453afc#;
   pragma Export (C, u00092, "system__stack_checkingS");
   u00093 : constant Version_32 := 16#cd3494c7#;
   pragma Export (C, u00093, "ada__strings__utf_encodingB");
   u00094 : constant Version_32 := 16#37e3917d#;
   pragma Export (C, u00094, "ada__strings__utf_encodingS");
   u00095 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00095, "ada__strings__utf_encoding__wide_stringsB");
   u00096 : constant Version_32 := 16#103ad78c#;
   pragma Export (C, u00096, "ada__strings__utf_encoding__wide_stringsS");
   u00097 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00097, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00098 : constant Version_32 := 16#91eda35b#;
   pragma Export (C, u00098, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00099 : constant Version_32 := 16#b3f0dfa6#;
   pragma Export (C, u00099, "ada__tagsB");
   u00100 : constant Version_32 := 16#cb8ac80c#;
   pragma Export (C, u00100, "ada__tagsS");
   u00101 : constant Version_32 := 16#5534feb6#;
   pragma Export (C, u00101, "system__htableB");
   u00102 : constant Version_32 := 16#ab38e2fe#;
   pragma Export (C, u00102, "system__htableS");
   u00103 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00103, "system__string_hashB");
   u00104 : constant Version_32 := 16#09668980#;
   pragma Export (C, u00104, "system__string_hashS");
   u00105 : constant Version_32 := 16#d8bb58e0#;
   pragma Export (C, u00105, "ada__text_ioB");
   u00106 : constant Version_32 := 16#1eb2ee39#;
   pragma Export (C, u00106, "ada__text_ioS");
   u00107 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00107, "ada__streamsB");
   u00108 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00108, "ada__streamsS");
   u00109 : constant Version_32 := 16#5fc04ee2#;
   pragma Export (C, u00109, "system__put_imagesB");
   u00110 : constant Version_32 := 16#52d4e162#;
   pragma Export (C, u00110, "system__put_imagesS");
   u00111 : constant Version_32 := 16#e264263f#;
   pragma Export (C, u00111, "ada__strings__text_buffers__utilsB");
   u00112 : constant Version_32 := 16#608bd105#;
   pragma Export (C, u00112, "ada__strings__text_buffers__utilsS");
   u00113 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00113, "interfaces__c_streamsB");
   u00114 : constant Version_32 := 16#066a78a0#;
   pragma Export (C, u00114, "interfaces__c_streamsS");
   u00115 : constant Version_32 := 16#30f1a29e#;
   pragma Export (C, u00115, "system__file_ioB");
   u00116 : constant Version_32 := 16#888bb071#;
   pragma Export (C, u00116, "system__file_ioS");
   u00117 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00117, "ada__finalizationS");
   u00118 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00118, "system__finalization_rootB");
   u00119 : constant Version_32 := 16#60082284#;
   pragma Export (C, u00119, "system__finalization_rootS");
   u00120 : constant Version_32 := 16#d265cbbc#;
   pragma Export (C, u00120, "system__file_control_blockS");
   u00121 : constant Version_32 := 16#cc860d43#;
   pragma Export (C, u00121, "numeros_complejosB");
   u00122 : constant Version_32 := 16#799cfc0c#;
   pragma Export (C, u00122, "numeros_complejosS");
   u00123 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00123, "ada__float_text_ioB");
   u00124 : constant Version_32 := 16#39060f6c#;
   pragma Export (C, u00124, "ada__float_text_ioS");
   u00125 : constant Version_32 := 16#7a00bb28#;
   pragma Export (C, u00125, "ada__text_io__generic_auxB");
   u00126 : constant Version_32 := 16#48b7189e#;
   pragma Export (C, u00126, "ada__text_io__generic_auxS");
   u00127 : constant Version_32 := 16#ecc88e78#;
   pragma Export (C, u00127, "system__fat_fltS");
   u00128 : constant Version_32 := 16#6424aad3#;
   pragma Export (C, u00128, "system__img_fltS");
   u00129 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00129, "system__float_controlB");
   u00130 : constant Version_32 := 16#cf061228#;
   pragma Export (C, u00130, "system__float_controlS");
   u00131 : constant Version_32 := 16#2549028f#;
   pragma Export (C, u00131, "system__img_utilB");
   u00132 : constant Version_32 := 16#44802e3b#;
   pragma Export (C, u00132, "system__img_utilS");
   u00133 : constant Version_32 := 16#690df0ad#;
   pragma Export (C, u00133, "system__powten_fltS");
   u00134 : constant Version_32 := 16#c90890af#;
   pragma Export (C, u00134, "system__img_lfltS");
   u00135 : constant Version_32 := 16#cafa8775#;
   pragma Export (C, u00135, "system__fat_lfltS");
   u00136 : constant Version_32 := 16#b684afd1#;
   pragma Export (C, u00136, "system__img_lluS");
   u00137 : constant Version_32 := 16#0be1c959#;
   pragma Export (C, u00137, "system__powten_lfltS");
   u00138 : constant Version_32 := 16#1422974c#;
   pragma Export (C, u00138, "system__img_llfS");
   u00139 : constant Version_32 := 16#b02a299f#;
   pragma Export (C, u00139, "system__fat_llfS");
   u00140 : constant Version_32 := 16#b6fa998a#;
   pragma Export (C, u00140, "system__powten_llfS");
   u00141 : constant Version_32 := 16#18ee5867#;
   pragma Export (C, u00141, "system__val_fltS");
   u00142 : constant Version_32 := 16#8aea7eed#;
   pragma Export (C, u00142, "system__exn_fltS");
   u00143 : constant Version_32 := 16#0414e57b#;
   pragma Export (C, u00143, "system__val_lfltS");
   u00144 : constant Version_32 := 16#34ab9f34#;
   pragma Export (C, u00144, "system__exn_lfltS");
   u00145 : constant Version_32 := 16#de111da4#;
   pragma Export (C, u00145, "system__val_llfS");
   u00146 : constant Version_32 := 16#19055f44#;
   pragma Export (C, u00146, "system__exn_llfS");
   u00147 : constant Version_32 := 16#eca5ecae#;
   pragma Export (C, u00147, "system__memoryB");
   u00148 : constant Version_32 := 16#76873720#;
   pragma Export (C, u00148, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_int%s
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_flt%s
   --  system.powten_lflt%s
   --  system.powten_llf%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_llu%s
   --  system.img_uns%s
   --  system.img_util%s
   --  system.img_util%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.exn_flt%s
   --  system.exn_lflt%s
   --  system.exn_llf%s
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.win32%s
   --  ada.characters.handling%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.img_flt%s
   --  system.img_lflt%s
   --  system.img_llf%s
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_flt%s
   --  system.val_lflt%s
   --  system.val_llf%s
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  numeros_complejos%s
   --  numeros_complejos%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
