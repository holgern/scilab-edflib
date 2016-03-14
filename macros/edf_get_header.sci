function  [edf_header]=edf_get_header(filename)
// Reads and converts the header of the file to a struct  .
// Calling Sequence
// [edf_struct]=edf_get_header(path);
// [edf_struct]=edf_get_header(edf_header);
// Parameters
// path: string containing the path and name of the file
// edf_header: plist with header information from edfopen_file_readonly
// edf_struct:   struct containing the header information.
// Description
// Reads the header of the file .
// Examples
// [edf_struct]=edf_get_header(edf_getpath()+'/demos/demo.edf');
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
// [edf_struct]=edf_get_header(header_list);
// edf_close(header_list.handle);
// Authors
// Holger Nahrstaedt - 2010 - 2013

//	Copyright (c) 2010 - Holger Nahrstaedt
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
      [lhs,rhs]=argn(0);
    if rhs == 0 then
  	 error("Expect at least one argument")
    end

  //edf_header="";
  if (typeof(filename)=="plist") then
        l_edf_header=filename;
    elseif (typeof(filename)=="string") then

	l_edf_header=edfopen_file_readonly(filename,1);
	edf_close(l_edf_header("handle"));
  else 
       error("Wrong input type!");
    end;
     
// edf_header.startdatetime=edf_get_startdatetime(filename);
// edf_header.patientname=edf_get_patientname(filename);
// edf_header.patientcode=edf_get_patientcode(filename);
// edf_header.gender=edf_get_gender(filename);
// edf_header.birthdate=edf_get_birthdate(filename);
// edf_header.patient_info=edf_get_patient_info(filename);
// edf_header.admincode=edf_get_admincode(filename);
// edf_header.technician=edf_get_technician(filename);
// edf_header.equipment=edf_get_equipment(filename);
// edf_header.recording_info=edf_get_recording_info(filename);
// edf_header.edfsignals=edf_get_edfsignals(filename);
// edf_header.file_duration=edf_get_file_duration(filename);
// 
// for i=0:(edf_header.edfsignals-1)
//   edf_signal.digital_maximum=edf_get_digital_maximum(filename,i);
//   edf_signal.digital_minimum=edf_get_digital_minimum(filename,i);
//   edf_signal.physical_maximum=edf_get_physical_maximum(filename,i);
//   edf_signal.physical_minimum=edf_get_physical_minimum(filename,i);
//   edf_signal.physical_dim=edf_get_physical_dim(filename,i);
//  edf_signal.label=edf_get_label(filename,i);
//  edf_signal.prefilter=edf_get_prefilter(filename,i);
//  edf_signal.transducer=edf_get_transducer(filename,i);
//  edf_signal.samplefrequency=edf_get_samplefrequency(filename,i);
//  edf_signal.signal_samples=edf_get_signal_samples(filename,i);
// if (i==0)
//   edf_header.signal=[edf_signal];
// else
//   edf_header.signal=[edf_header.signal;edf_signal];
// end;
// end;

edf_header.startdatetime=l_edf_header("startdatetime");
edf_header.patientname=l_edf_header("patient_name");
edf_header.patientcode=l_edf_header("patientcode");
edf_header.gender=l_edf_header("gender");
edf_header.birthdate=l_edf_header("birthdate");
edf_header.patient_info=l_edf_header("patient_additional");
edf_header.admincode=l_edf_header("admincode");
edf_header.technician=l_edf_header("technician");
edf_header.equipment=l_edf_header("equipment");
edf_header.recording_info=l_edf_header("recording_additional");
edf_header.edfsignals=l_edf_header("edfsignals");
edf_header.file_duration=l_edf_header("file_duration");

for i=1:(edf_header.edfsignals)
  edf_signal.digital_maximum=l_edf_header("dig_max")(i);
  edf_signal.digital_minimum=l_edf_header("dig_min")(i);
  edf_signal.physical_maximum=l_edf_header("phys_max")(i);
  edf_signal.physical_minimum=l_edf_header("phys_min")(i);
  edf_signal.physical_dim=l_edf_header("physdimension")(i);
 edf_signal.label=l_edf_header("label")(i);
 edf_signal.prefilter=l_edf_header("prefilter")(i);
 edf_signal.transducer=l_edf_header("transducer")(i);
 edf_signal.samplefrequency=l_edf_header("smp_in_datarecord")(i);
 edf_signal.signal_samples=l_edf_header("smp_in_file")(i);
if (i==1)
  edf_header.signal=[edf_signal];
else
  edf_header.signal=[edf_header.signal;edf_signal];
end;
end;

endfunction
// ====================================================================
