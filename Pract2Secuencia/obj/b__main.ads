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
   u00001 : constant Version_32 := 16#7253036a#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#2e11c0b1#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#664ecad3#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#70feca75#;
   pragma Export (C, u00004, "ad_cardB");
   u00005 : constant Version_32 := 16#0a8dac78#;
   pragma Export (C, u00005, "ad_cardS");
   u00006 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#ffaa9e94#;
   pragma Export (C, u00007, "ada__calendar__delaysB");
   u00008 : constant Version_32 := 16#d86d2f1d#;
   pragma Export (C, u00008, "ada__calendar__delaysS");
   u00009 : constant Version_32 := 16#48583e4e#;
   pragma Export (C, u00009, "ada__calendarB");
   u00010 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00010, "ada__calendarS");
   u00011 : constant Version_32 := 16#f75ad8f1#;
   pragma Export (C, u00011, "ada__exceptionsB");
   u00012 : constant Version_32 := 16#eb3857a3#;
   pragma Export (C, u00012, "ada__exceptionsS");
   u00013 : constant Version_32 := 16#19b42e05#;
   pragma Export (C, u00013, "ada__exceptions__last_chance_handlerB");
   u00014 : constant Version_32 := 16#fc9377ef#;
   pragma Export (C, u00014, "ada__exceptions__last_chance_handlerS");
   u00015 : constant Version_32 := 16#2ffa5114#;
   pragma Export (C, u00015, "systemS");
   u00016 : constant Version_32 := 16#adf22619#;
   pragma Export (C, u00016, "system__soft_linksB");
   u00017 : constant Version_32 := 16#63b0b7fe#;
   pragma Export (C, u00017, "system__soft_linksS");
   u00018 : constant Version_32 := 16#e10050ae#;
   pragma Export (C, u00018, "system__secondary_stackB");
   u00019 : constant Version_32 := 16#de516690#;
   pragma Export (C, u00019, "system__secondary_stackS");
   u00020 : constant Version_32 := 16#896564a3#;
   pragma Export (C, u00020, "system__parametersB");
   u00021 : constant Version_32 := 16#68a895df#;
   pragma Export (C, u00021, "system__parametersS");
   u00022 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00022, "system__storage_elementsB");
   u00023 : constant Version_32 := 16#02391b10#;
   pragma Export (C, u00023, "system__storage_elementsS");
   u00024 : constant Version_32 := 16#ce3e0e21#;
   pragma Export (C, u00024, "system__soft_links__initializeB");
   u00025 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00025, "system__soft_links__initializeS");
   u00026 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00026, "system__stack_checkingB");
   u00027 : constant Version_32 := 16#a1453afc#;
   pragma Export (C, u00027, "system__stack_checkingS");
   u00028 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00028, "system__exception_tableB");
   u00029 : constant Version_32 := 16#3cc6bdbe#;
   pragma Export (C, u00029, "system__exception_tableS");
   u00030 : constant Version_32 := 16#7134ce8f#;
   pragma Export (C, u00030, "system__exceptionsS");
   u00031 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00031, "system__exceptions__machineB");
   u00032 : constant Version_32 := 16#59a6462e#;
   pragma Export (C, u00032, "system__exceptions__machineS");
   u00033 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00033, "system__exceptions_debugB");
   u00034 : constant Version_32 := 16#1fe22d38#;
   pragma Export (C, u00034, "system__exceptions_debugS");
   u00035 : constant Version_32 := 16#9f73225f#;
   pragma Export (C, u00035, "system__img_intS");
   u00036 : constant Version_32 := 16#01838199#;
   pragma Export (C, u00036, "system__tracebackB");
   u00037 : constant Version_32 := 16#6f77a74f#;
   pragma Export (C, u00037, "system__tracebackS");
   u00038 : constant Version_32 := 16#1f08c83e#;
   pragma Export (C, u00038, "system__traceback_entriesB");
   u00039 : constant Version_32 := 16#09528275#;
   pragma Export (C, u00039, "system__traceback_entriesS");
   u00040 : constant Version_32 := 16#8dd2b87e#;
   pragma Export (C, u00040, "system__traceback__symbolicB");
   u00041 : constant Version_32 := 16#4f57b9be#;
   pragma Export (C, u00041, "system__traceback__symbolicS");
   u00042 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00042, "ada__containersS");
   u00043 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00043, "ada__exceptions__tracebackB");
   u00044 : constant Version_32 := 16#bba159a5#;
   pragma Export (C, u00044, "ada__exceptions__tracebackS");
   u00045 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00045, "system__bounded_stringsB");
   u00046 : constant Version_32 := 16#5807700d#;
   pragma Export (C, u00046, "system__bounded_stringsS");
   u00047 : constant Version_32 := 16#66134eae#;
   pragma Export (C, u00047, "system__crtlS");
   u00048 : constant Version_32 := 16#13176495#;
   pragma Export (C, u00048, "system__dwarf_linesB");
   u00049 : constant Version_32 := 16#881894a3#;
   pragma Export (C, u00049, "system__dwarf_linesS");
   u00050 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00050, "ada__charactersS");
   u00051 : constant Version_32 := 16#ba03ad8f#;
   pragma Export (C, u00051, "ada__characters__handlingB");
   u00052 : constant Version_32 := 16#21df700b#;
   pragma Export (C, u00052, "ada__characters__handlingS");
   u00053 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00053, "ada__characters__latin_1S");
   u00054 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00054, "ada__stringsS");
   u00055 : constant Version_32 := 16#24ece25f#;
   pragma Export (C, u00055, "ada__strings__mapsB");
   u00056 : constant Version_32 := 16#ac61938c#;
   pragma Export (C, u00056, "ada__strings__mapsS");
   u00057 : constant Version_32 := 16#1db72f30#;
   pragma Export (C, u00057, "system__bit_opsB");
   u00058 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00058, "system__bit_opsS");
   u00059 : constant Version_32 := 16#04fd2587#;
   pragma Export (C, u00059, "system__unsigned_typesS");
   u00060 : constant Version_32 := 16#20c3a773#;
   pragma Export (C, u00060, "ada__strings__maps__constantsS");
   u00061 : constant Version_32 := 16#edec285f#;
   pragma Export (C, u00061, "interfacesS");
   u00062 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00062, "system__address_imageB");
   u00063 : constant Version_32 := 16#8e16cc2e#;
   pragma Export (C, u00063, "system__address_imageS");
   u00064 : constant Version_32 := 16#58ecb7ed#;
   pragma Export (C, u00064, "system__img_unsS");
   u00065 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00065, "system__ioB");
   u00066 : constant Version_32 := 16#b1b8a65b#;
   pragma Export (C, u00066, "system__ioS");
   u00067 : constant Version_32 := 16#c1351856#;
   pragma Export (C, u00067, "system__mmapB");
   u00068 : constant Version_32 := 16#45fa04ea#;
   pragma Export (C, u00068, "system__mmapS");
   u00069 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00069, "ada__io_exceptionsS");
   u00070 : constant Version_32 := 16#6c9b7dbc#;
   pragma Export (C, u00070, "system__mmap__os_interfaceB");
   u00071 : constant Version_32 := 16#52ab6463#;
   pragma Export (C, u00071, "system__mmap__os_interfaceS");
   u00072 : constant Version_32 := 16#c7b29a75#;
   pragma Export (C, u00072, "system__os_libB");
   u00073 : constant Version_32 := 16#1c53dcbe#;
   pragma Export (C, u00073, "system__os_libS");
   u00074 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00074, "system__case_utilB");
   u00075 : constant Version_32 := 16#102fe740#;
   pragma Export (C, u00075, "system__case_utilS");
   u00076 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00076, "system__stringsB");
   u00077 : constant Version_32 := 16#63b7b2c6#;
   pragma Export (C, u00077, "system__stringsS");
   u00078 : constant Version_32 := 16#fb01eaa4#;
   pragma Export (C, u00078, "interfaces__cB");
   u00079 : constant Version_32 := 16#7300324d#;
   pragma Export (C, u00079, "interfaces__cS");
   u00080 : constant Version_32 := 16#a2bb689b#;
   pragma Export (C, u00080, "system__object_readerB");
   u00081 : constant Version_32 := 16#7d8b329a#;
   pragma Export (C, u00081, "system__object_readerS");
   u00082 : constant Version_32 := 16#f21a80dd#;
   pragma Export (C, u00082, "system__val_lliS");
   u00083 : constant Version_32 := 16#197f7a7d#;
   pragma Export (C, u00083, "system__val_lluS");
   u00084 : constant Version_32 := 16#879d81a3#;
   pragma Export (C, u00084, "system__val_utilB");
   u00085 : constant Version_32 := 16#835ae7ea#;
   pragma Export (C, u00085, "system__val_utilS");
   u00086 : constant Version_32 := 16#992dbac1#;
   pragma Export (C, u00086, "system__exception_tracesB");
   u00087 : constant Version_32 := 16#2dd6549f#;
   pragma Export (C, u00087, "system__exception_tracesS");
   u00088 : constant Version_32 := 16#e3e8dc36#;
   pragma Export (C, u00088, "system__win32S");
   u00089 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00089, "system__wch_conB");
   u00090 : constant Version_32 := 16#348773c6#;
   pragma Export (C, u00090, "system__wch_conS");
   u00091 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00091, "system__wch_stwB");
   u00092 : constant Version_32 := 16#19965fc7#;
   pragma Export (C, u00092, "system__wch_stwS");
   u00093 : constant Version_32 := 16#1f681dab#;
   pragma Export (C, u00093, "system__wch_cnvB");
   u00094 : constant Version_32 := 16#3b30c935#;
   pragma Export (C, u00094, "system__wch_cnvS");
   u00095 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00095, "system__wch_jisB");
   u00096 : constant Version_32 := 16#bb40d014#;
   pragma Export (C, u00096, "system__wch_jisS");
   u00097 : constant Version_32 := 16#24ec69e6#;
   pragma Export (C, u00097, "system__os_primitivesB");
   u00098 : constant Version_32 := 16#280734e2#;
   pragma Export (C, u00098, "system__os_primitivesS");
   u00099 : constant Version_32 := 16#2f9cb76c#;
   pragma Export (C, u00099, "system__arith_64B");
   u00100 : constant Version_32 := 16#9d9eabfb#;
   pragma Export (C, u00100, "system__arith_64S");
   u00101 : constant Version_32 := 16#05c60a38#;
   pragma Export (C, u00101, "system__task_lockB");
   u00102 : constant Version_32 := 16#4e70667a#;
   pragma Export (C, u00102, "system__task_lockS");
   u00103 : constant Version_32 := 16#b8c476a4#;
   pragma Export (C, u00103, "system__win32__extS");
   u00104 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00104, "ada__float_text_ioB");
   u00105 : constant Version_32 := 16#39060f6c#;
   pragma Export (C, u00105, "ada__float_text_ioS");
   u00106 : constant Version_32 := 16#d8bb58e0#;
   pragma Export (C, u00106, "ada__text_ioB");
   u00107 : constant Version_32 := 16#1eb2ee39#;
   pragma Export (C, u00107, "ada__text_ioS");
   u00108 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00108, "ada__streamsB");
   u00109 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00109, "ada__streamsS");
   u00110 : constant Version_32 := 16#8c178268#;
   pragma Export (C, u00110, "ada__strings__text_buffersB");
   u00111 : constant Version_32 := 16#0800bb5e#;
   pragma Export (C, u00111, "ada__strings__text_buffersS");
   u00112 : constant Version_32 := 16#cd3494c7#;
   pragma Export (C, u00112, "ada__strings__utf_encodingB");
   u00113 : constant Version_32 := 16#37e3917d#;
   pragma Export (C, u00113, "ada__strings__utf_encodingS");
   u00114 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00114, "ada__strings__utf_encoding__wide_stringsB");
   u00115 : constant Version_32 := 16#103ad78c#;
   pragma Export (C, u00115, "ada__strings__utf_encoding__wide_stringsS");
   u00116 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00116, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00117 : constant Version_32 := 16#91eda35b#;
   pragma Export (C, u00117, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00118 : constant Version_32 := 16#b3f0dfa6#;
   pragma Export (C, u00118, "ada__tagsB");
   u00119 : constant Version_32 := 16#cb8ac80c#;
   pragma Export (C, u00119, "ada__tagsS");
   u00120 : constant Version_32 := 16#5534feb6#;
   pragma Export (C, u00120, "system__htableB");
   u00121 : constant Version_32 := 16#ab38e2fe#;
   pragma Export (C, u00121, "system__htableS");
   u00122 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00122, "system__string_hashB");
   u00123 : constant Version_32 := 16#09668980#;
   pragma Export (C, u00123, "system__string_hashS");
   u00124 : constant Version_32 := 16#5fc04ee2#;
   pragma Export (C, u00124, "system__put_imagesB");
   u00125 : constant Version_32 := 16#52d4e162#;
   pragma Export (C, u00125, "system__put_imagesS");
   u00126 : constant Version_32 := 16#e264263f#;
   pragma Export (C, u00126, "ada__strings__text_buffers__utilsB");
   u00127 : constant Version_32 := 16#608bd105#;
   pragma Export (C, u00127, "ada__strings__text_buffers__utilsS");
   u00128 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00128, "interfaces__c_streamsB");
   u00129 : constant Version_32 := 16#066a78a0#;
   pragma Export (C, u00129, "interfaces__c_streamsS");
   u00130 : constant Version_32 := 16#30f1a29e#;
   pragma Export (C, u00130, "system__file_ioB");
   u00131 : constant Version_32 := 16#888bb071#;
   pragma Export (C, u00131, "system__file_ioS");
   u00132 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00132, "ada__finalizationS");
   u00133 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00133, "system__finalization_rootB");
   u00134 : constant Version_32 := 16#60082284#;
   pragma Export (C, u00134, "system__finalization_rootS");
   u00135 : constant Version_32 := 16#d265cbbc#;
   pragma Export (C, u00135, "system__file_control_blockS");
   u00136 : constant Version_32 := 16#7a00bb28#;
   pragma Export (C, u00136, "ada__text_io__generic_auxB");
   u00137 : constant Version_32 := 16#48b7189e#;
   pragma Export (C, u00137, "ada__text_io__generic_auxS");
   u00138 : constant Version_32 := 16#ecc88e78#;
   pragma Export (C, u00138, "system__fat_fltS");
   u00139 : constant Version_32 := 16#6424aad3#;
   pragma Export (C, u00139, "system__img_fltS");
   u00140 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00140, "system__float_controlB");
   u00141 : constant Version_32 := 16#cf061228#;
   pragma Export (C, u00141, "system__float_controlS");
   u00142 : constant Version_32 := 16#2549028f#;
   pragma Export (C, u00142, "system__img_utilB");
   u00143 : constant Version_32 := 16#44802e3b#;
   pragma Export (C, u00143, "system__img_utilS");
   u00144 : constant Version_32 := 16#690df0ad#;
   pragma Export (C, u00144, "system__powten_fltS");
   u00145 : constant Version_32 := 16#c90890af#;
   pragma Export (C, u00145, "system__img_lfltS");
   u00146 : constant Version_32 := 16#cafa8775#;
   pragma Export (C, u00146, "system__fat_lfltS");
   u00147 : constant Version_32 := 16#b684afd1#;
   pragma Export (C, u00147, "system__img_lluS");
   u00148 : constant Version_32 := 16#0be1c959#;
   pragma Export (C, u00148, "system__powten_lfltS");
   u00149 : constant Version_32 := 16#1422974c#;
   pragma Export (C, u00149, "system__img_llfS");
   u00150 : constant Version_32 := 16#b02a299f#;
   pragma Export (C, u00150, "system__fat_llfS");
   u00151 : constant Version_32 := 16#b6fa998a#;
   pragma Export (C, u00151, "system__powten_llfS");
   u00152 : constant Version_32 := 16#18ee5867#;
   pragma Export (C, u00152, "system__val_fltS");
   u00153 : constant Version_32 := 16#8aea7eed#;
   pragma Export (C, u00153, "system__exn_fltS");
   u00154 : constant Version_32 := 16#0414e57b#;
   pragma Export (C, u00154, "system__val_lfltS");
   u00155 : constant Version_32 := 16#34ab9f34#;
   pragma Export (C, u00155, "system__exn_lfltS");
   u00156 : constant Version_32 := 16#de111da4#;
   pragma Export (C, u00156, "system__val_llfS");
   u00157 : constant Version_32 := 16#19055f44#;
   pragma Export (C, u00157, "system__exn_llfS");
   u00158 : constant Version_32 := 16#547023e2#;
   pragma Export (C, u00158, "guardarB");
   u00159 : constant Version_32 := 16#6b391b83#;
   pragma Export (C, u00159, "guardarS");
   u00160 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00160, "system__concat_4B");
   u00161 : constant Version_32 := 16#519e7a34#;
   pragma Export (C, u00161, "system__concat_4S");
   u00162 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00162, "system__concat_3B");
   u00163 : constant Version_32 := 16#248a0db1#;
   pragma Export (C, u00163, "system__concat_3S");
   u00164 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00164, "system__concat_2B");
   u00165 : constant Version_32 := 16#2d5a86c4#;
   pragma Export (C, u00165, "system__concat_2S");
   u00166 : constant Version_32 := 16#6c56296f#;
   pragma Export (C, u00166, "data_typeS");
   u00167 : constant Version_32 := 16#377a4b2b#;
   pragma Export (C, u00167, "leerB");
   u00168 : constant Version_32 := 16#4f9fea54#;
   pragma Export (C, u00168, "leerS");
   u00169 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00169, "ada__integer_text_ioB");
   u00170 : constant Version_32 := 16#2ec7c168#;
   pragma Export (C, u00170, "ada__integer_text_ioS");
   u00171 : constant Version_32 := 16#3720d920#;
   pragma Export (C, u00171, "system__img_biuS");
   u00172 : constant Version_32 := 16#7a7e1efe#;
   pragma Export (C, u00172, "system__img_llbS");
   u00173 : constant Version_32 := 16#15e60e4c#;
   pragma Export (C, u00173, "system__img_lliS");
   u00174 : constant Version_32 := 16#0d8feb8c#;
   pragma Export (C, u00174, "system__img_lllbS");
   u00175 : constant Version_32 := 16#7e360bb4#;
   pragma Export (C, u00175, "system__img_llliS");
   u00176 : constant Version_32 := 16#07fbf280#;
   pragma Export (C, u00176, "system__img_lllwS");
   u00177 : constant Version_32 := 16#264c6bf5#;
   pragma Export (C, u00177, "system__img_llwS");
   u00178 : constant Version_32 := 16#08fa6212#;
   pragma Export (C, u00178, "system__img_wiuS");
   u00179 : constant Version_32 := 16#ae4beccb#;
   pragma Export (C, u00179, "system__val_intS");
   u00180 : constant Version_32 := 16#a5b55d2f#;
   pragma Export (C, u00180, "system__val_unsS");
   u00181 : constant Version_32 := 16#e37e7d10#;
   pragma Export (C, u00181, "system__val_llliS");
   u00182 : constant Version_32 := 16#f82486d6#;
   pragma Export (C, u00182, "system__val_llluS");
   u00183 : constant Version_32 := 16#0de7ae30#;
   pragma Export (C, u00183, "ada__strings__fixedB");
   u00184 : constant Version_32 := 16#64881af1#;
   pragma Export (C, u00184, "ada__strings__fixedS");
   u00185 : constant Version_32 := 16#bb264ce2#;
   pragma Export (C, u00185, "ada__strings__searchB");
   u00186 : constant Version_32 := 16#73987e07#;
   pragma Export (C, u00186, "ada__strings__searchS");
   u00187 : constant Version_32 := 16#91809229#;
   pragma Export (C, u00187, "ada__real_timeB");
   u00188 : constant Version_32 := 16#1ad7dfc0#;
   pragma Export (C, u00188, "ada__real_timeS");
   u00189 : constant Version_32 := 16#96c62183#;
   pragma Export (C, u00189, "system__taskingB");
   u00190 : constant Version_32 := 16#256a579d#;
   pragma Export (C, u00190, "system__taskingS");
   u00191 : constant Version_32 := 16#0c334715#;
   pragma Export (C, u00191, "system__task_primitivesS");
   u00192 : constant Version_32 := 16#4e3ebb7e#;
   pragma Export (C, u00192, "system__os_interfaceS");
   u00193 : constant Version_32 := 16#0039537b#;
   pragma Export (C, u00193, "interfaces__c__stringsB");
   u00194 : constant Version_32 := 16#eda3d306#;
   pragma Export (C, u00194, "interfaces__c__stringsS");
   u00195 : constant Version_32 := 16#cc709166#;
   pragma Export (C, u00195, "system__task_primitives__operationsB");
   u00196 : constant Version_32 := 16#9723968e#;
   pragma Export (C, u00196, "system__task_primitives__operationsS");
   u00197 : constant Version_32 := 16#6387a759#;
   pragma Export (C, u00197, "system__interrupt_managementB");
   u00198 : constant Version_32 := 16#26aedc33#;
   pragma Export (C, u00198, "system__interrupt_managementS");
   u00199 : constant Version_32 := 16#7bca5a8d#;
   pragma Export (C, u00199, "system__multiprocessorsB");
   u00200 : constant Version_32 := 16#1756ce67#;
   pragma Export (C, u00200, "system__multiprocessorsS");
   u00201 : constant Version_32 := 16#ce7dfb56#;
   pragma Export (C, u00201, "system__task_infoB");
   u00202 : constant Version_32 := 16#5a49699d#;
   pragma Export (C, u00202, "system__task_infoS");
   u00203 : constant Version_32 := 16#4ddebf0b#;
   pragma Export (C, u00203, "system__tasking__debugB");
   u00204 : constant Version_32 := 16#d3b35c55#;
   pragma Export (C, u00204, "system__tasking__debugS");
   u00205 : constant Version_32 := 16#617d5887#;
   pragma Export (C, u00205, "system__stack_usageB");
   u00206 : constant Version_32 := 16#8d63b971#;
   pragma Export (C, u00206, "system__stack_usageS");
   u00207 : constant Version_32 := 16#97d7e40a#;
   pragma Export (C, u00207, "ada__real_time__delaysB");
   u00208 : constant Version_32 := 16#0a5c26d7#;
   pragma Export (C, u00208, "ada__real_time__delaysS");
   u00209 : constant Version_32 := 16#95658ed1#;
   pragma Export (C, u00209, "controladorB");
   u00210 : constant Version_32 := 16#68b25189#;
   pragma Export (C, u00210, "controladorS");
   u00211 : constant Version_32 := 16#12af50fd#;
   pragma Export (C, u00211, "mostrarB");
   u00212 : constant Version_32 := 16#0e847325#;
   pragma Export (C, u00212, "mostrarS");
   u00213 : constant Version_32 := 16#57dc4eb4#;
   pragma Export (C, u00213, "seguridadB");
   u00214 : constant Version_32 := 16#6bb651ab#;
   pragma Export (C, u00214, "seguridadS");
   u00215 : constant Version_32 := 16#9b2ec661#;
   pragma Export (C, u00215, "simulacionB");
   u00216 : constant Version_32 := 16#710bc610#;
   pragma Export (C, u00216, "simulacionS");
   u00217 : constant Version_32 := 16#eca5ecae#;
   pragma Export (C, u00217, "system__memoryB");
   u00218 : constant Version_32 := 16#76873720#;
   pragma Export (C, u00218, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_int%s
   --  system.img_lli%s
   --  system.img_llli%s
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
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_llb%s
   --  system.img_lllb%s
   --  system.img_lllw%s
   --  system.img_llu%s
   --  system.img_llw%s
   --  system.img_uns%s
   --  system.img_util%s
   --  system.img_util%b
   --  system.img_wiu%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
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
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
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
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.arith_64%s
   --  system.arith_64%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.img_flt%s
   --  system.img_lflt%s
   --  system.img_llf%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
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
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.task_primitives%s
   --  system.val_flt%s
   --  system.val_lflt%s
   --  system.val_llf%s
   --  system.val_lllu%s
   --  system.val_llli%s
   --  system.val_uns%s
   --  system.val_int%s
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  data_type%s
   --  controlador%s
   --  controlador%b
   --  guardar%s
   --  guardar%b
   --  leer%s
   --  leer%b
   --  ad_card%s
   --  ad_card%b
   --  mostrar%s
   --  mostrar%b
   --  seguridad%s
   --  seguridad%b
   --  simulacion%s
   --  simulacion%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
