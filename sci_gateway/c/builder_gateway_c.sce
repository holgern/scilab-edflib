// ====================================================================
// Allan CORNET
// Simon LIPP
// INRIA 2008
// This file is released into the public domain
// ====================================================================

CURRENT_PATH = strsubst(get_absolute_file_path("builder_gateway_c.sce"), "\", "/");

INCLUDES_PATHS = "-I" + CURRENT_PATH + "../../src/c"; // -D__USE_DEPRECATED_STACK_FUNCTIONS__";

// PutLhsVar managed by user in sci_sum and in sci_sub
// if you do not this variable, PutLhsVar is added
// in gateway generated (default mode in scilab 4.x and 5.x)
WITHOUT_AUTO_PUTLHSVAR = %T;

FUNCTIONS_GATEWAY = ["edfread_physical_samples","sci_edfread_physical_samples";"edf_get_annotation","sci_edf_get_annotation";"edfopen_file_writeonly","sci_edfopen_file_writeonly";..
"edf_close","sci_edfclose";"edf_set_patient_info","sci_edf_set_patient_additional"; ..
"edf_set_admincode", "sci_edf_set_admincode" ;"edf_set_birthdate", "sci_edf_set_birthdate" ;"edf_set_digital_maximum", "sci_edf_set_digital_maximum" ;"edf_set_digital_minimum", "sci_edf_set_digital_minimum" ;..
"edf_set_equipment", "sci_edf_set_equipment" ;"edf_set_gender", "sci_edf_set_gender" ;"edf_set_label", "sci_edf_set_label" ;"edf_set_patientcode", "sci_edf_set_patientcode" ; ..
"edf_set_patientname", "sci_edf_set_patientname" ;"edf_set_physical_dim", "sci_edf_set_physical_dimension" ;"edf_set_physical_maximum", "sci_edf_set_physical_maximum" ;..
"edf_set_physical_minimum", "sci_edf_set_physical_minimum" ;"edf_set_prefilter", "sci_edf_set_prefilter" ;"edf_set_recording_info", "sci_edf_set_recording_additional"; ..
"edf_set_samplefrequency", "sci_edf_set_samplefrequency" ;"edf_set_startdatetime", "sci_edf_set_startdatetime" ;"edf_set_technician", "sci_edf_set_technician" ;"edf_set_transducer", "sci_edf_set_transducer"; ..
"edf_blockwrite_psamples", "sci_edf_blockwrite_physical_samples";"edfwrite_psamples", "sci_edfwrite_physical_samples";..
"edfwrite_annotation_utf8","sci_edfwrite_annotation_utf8";"edfwrite_annotation_latin1","sci_edfwrite_annotation_latin1";..
"edfopen_file_readonly","sci_edfopen_file_readonly";"edfseek","sci_edfseek";"edfrewind","sci_edfrewind";"edftell","sci_edftell";"edf_set_record_duration","sci_edf_set_datarecord_duration";..
"edf_is_file_used","sci_edf_is_file_used";"edf_get_open_files","sci_edf_get_open_files"];

FILES_GATEWAY= ["sci_edfread_physical_samples.c","sci_edf_get_annotation.c","sci_edfopen_file_writeonly.c","sci_edfclose.c","sci_edf_set_patient_additional.c","sci_edf_set_admincode.c","sci_edf_set_birthdate.c","sci_edf_set_digital_maximum.c", ..
"sci_edf_set_digital_minimum.c","sci_edf_set_equipment.c","sci_edf_set_gender.c","sci_edf_set_label.c","sci_edf_set_patientcode.c","sci_edf_set_patientname.c","sci_edf_set_physical_dimension.c",..
"sci_edf_set_physical_maximum.c","sci_edf_set_physical_minimum.c","sci_edf_set_prefilter.c","sci_edf_set_recording_additional.c","sci_edf_set_samplefrequency.c","sci_edf_set_startdatetime.c",..
"sci_edf_set_technician.c","sci_edf_set_transducer.c","sci_edfwrite_physical_samples.c","sci_edf_blockwrite_physical_samples.c",..
"sci_edfwrite_annotation_utf8.c","sci_edfwrite_annotation_latin1.c","sci_edfopen_file_readonly.c","sci_edfseek.c","sci_edfrewind.c","sci_edftell.c","sci_edf_set_datarecord_duration.c",..
"sci_edf_is_file_used.c","sci_edf_get_open_files.c"];


LIBS_PATHS =["../../src/c/libedf"];

tbx_build_gateway("edflib_c", FUNCTIONS_GATEWAY, FILES_GATEWAY, CURRENT_PATH, LIBS_PATHS,"",INCLUDES_PATHS);

clear WITHOUT_AUTO_PUTLHSVAR;

clear tbx_build_gateway;
clear LIBS_PATHS;
clear INCLUDES_PATHS;
clear CURRENT_PATH;
clear FILES_GATEWAY;
clear FUNCTIONS_GATEWAY;
// 
