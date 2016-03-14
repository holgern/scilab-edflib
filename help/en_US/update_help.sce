// Copyright (C) 2010 - 2011 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Updates the .xml files by deleting existing files and 
// creating them again from the .sci with help_from_sci.


//
cwd = get_absolute_file_path("update_help.sce");
mprintf("Working dir = %s\n",cwd);


//
// Generate the library help
mprintf("Updating edflib/read\n");
helpdir = fullfile(cwd,"read");
funmat = [
  "edf_get_admincode"
  "edf_get_annotations"
  "edf_get_birthdate"
  "edf_get_digital_maximum"
  "edf_get_digital_minimum"
  "edf_get_edfsignals"
  "edf_get_equipment"
  "edf_get_file_duration"
  "edf_get_gender"
  "edf_get_header"
  "edf_get_label"
  "edf_get_patient_info"
  "edf_get_patientcode"
  "edf_get_patientname"
  "edf_get_physical_dim"
  "edf_get_physical_maximum"
  "edf_get_physical_minimum"
  "edf_get_prefilter"
  "edf_get_recording_info"
  "edf_get_samplefrequency"
  "edf_get_signal_samples"
  "edf_get_startdatetime"
  "edf_get_technician"
  "edf_get_timevector"
  "edf_get_transducer"
  "edfread_file"
  "edfread_samples"
  ];
macrosdir = cwd +"../../macros";
demosdir = [];
modulename = "edflib";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t );

// Generate the library help
mprintf("Updating edflib/read\n");
helpdir = fullfile(cwd,"read");
funmat = [
  "edf_get_annotation"
   "edfopen_file_readonly"
   "edfread_physical_samples"
   "edfrewind"
   "edfseek"
   "edftell"
  ];
macrosdir = cwd +"../../macros/gateway_help_files";
demosdir = [];
modulename = "edflib";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t );



//
// Generate the library help
mprintf("Updating edflib/write\n");
helpdir = fullfile(cwd,"write");
funmat = [
  "edfwrite_annotations"
  "edfwrite_header"
  "edfwrite_samples"
  "edf_copy_signal_header"
  "edf_copy_file_header"
  "edf_copy_signal_data"
  "edf_copy_annotation"
  ];
macrosdir = cwd +"../../macros";
demosdir = [];
modulename = "edflib";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t );

// Generate the library help
mprintf("Updating edflib/write\n");
helpdir = fullfile(cwd,"write");
funmat = [
  "edf_blockwrite_psamples"
   "edf_set_admincode"
   "edf_set_birthdate"
   "edf_set_digital_maximum"
   "edf_set_digital_minimum"
   "edf_set_equipment"
   "edf_set_gender"
   "edf_set_label"
   "edf_set_patient_info"
   "edf_set_patientcode"
   "edf_set_patientname"
   "edf_set_physical_dim"
   "edf_set_physical_maximum"
   "edf_set_physical_minimum"
   "edf_set_prefilter"
   "edf_set_record_duration"
   "edf_set_recording_info"
   "edf_set_samplefrequency"
   "edf_set_technician"
   "edf_set_transducer"
   "edfopen_file_writeonly"
   "edf_set_startdatetime"
   "edfwrite_annotation_latin1"
   "edfwrite_annotation_utf8"
   "edfwrite_psamples"
  ];
macrosdir = cwd +"../../macros/gateway_help_files";
demosdir = [];
modulename = "edflib";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t );



//
// Generate the library help
mprintf("Updating edflib/utility\n");
helpdir = fullfile(cwd,"utility");
funmat = [
  "edf_birthdate_str2vec"
  "edf_gender_str2scalar"
  "edf_getpath"
  "edf_find_signalid"
  "edf_plot_signals"
  ];
macrosdir = cwd +"../../macros";
demosdir = [];
modulename = "edflib";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t );

// Generate the library help
mprintf("Updating edflib/utility\n");
helpdir = fullfile(cwd,"utility");
funmat = [
   "edf_is_file_used"
   "edf_get_open_files"
   "edf_close"
  ];
macrosdir = cwd +"../../macros/gateway_help_files";
demosdir = [];
modulename = "edflib";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t );