function  edfwrite_header(handle,edf_header)
// Writes an header to the file
// Calling Sequence
// edfwrite_header(edf_handle,edf_header)
// Parameters
// edf_handle: a integer containing the file handle of the opened bdf/edf-file
// edf_header: struct
// Description
// Writes header information from a structure to the file.  This function is optional and can be called only after opening a file in writemode
//   and before closing the file
//   
//   edf_handle is the file handle of the opened edf/bdf-file.
//   
//   <para> the struct edf_header contains:  </para>
// 
//   <para> edf_header.startdatetime</para>
// 
//   <para>  edf_header.patientname</para>
// 
//   <para>  edf_header.patientcode</para>
// 
//   <para>  edf_header.gender (string "male" of "female")</para>
// 
//   <para>  edf_header.birthdate (string "01 jun 2010")</para>
// 
//   <para>  edf_header.patient_info</para>
// 
//   <para>  edf_header.admincode</para>
// 
//   <para>  edf_header.technician</para>
// 
//   <para>  edf_header.equipment</para>
// 
//   <para> edf_header.recording_info </para>
// 
//   <para>  for each edfsignal signal : </para>
//     <para>   edf_header.signal(signal).samplefrequency</para>
//       <para>  edf_header.signal(signal).physical_maximum</para>
//         <para>  edf_header.signal(signal).physical_minimum</para>
//           <para> edf_header.signal(signal).digital_maximum </para>
//           <para> edf_header.signal(signal).digital_minimum </para>
// 
//            <para>  edf_header.signal(signal).label</para>
//             <para>  edf_header.signal(signal).prefilter</para>
//              <para>  edf_header.signal(signal).transducer</para>
//               <para> edf_header.signal(signal).physical_dim </para>
// Examples
// edfwrite_header(edf_handle, edf_header)
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
if (type(edf_header)==17)

  if (isfield(edf_header,'startdatetime'))
    edf_set_startdatetime(handle,edf_header.startdatetime);
  end;
  if (isfield(edf_header,'patientname'))
    edf_set_patientname(handle,edf_header.patientname);
  end;
  if (isfield(edf_header,'patientcode'))
    edf_set_patientcode(handle,edf_header.patientcode);
  end;
  if (isfield(edf_header,'gender'))
    edf_set_gender(handle,edf_gender_str2scalar(edf_header.gender));
  end;
  if (isfield(edf_header,'birthdate'))
    edf_set_birthdate(handle,edf_birthdate_str2vec(edf_header.birthdate));
  end;
  if (isfield(edf_header,'patient_info'))
    edf_set_patient_info(handle,edf_header.patient_info);
  end;
  if (isfield(edf_header,'admincode'))
    edf_set_admincode(handle,edf_header.admincode);
  end;
  if (isfield(edf_header,'technician'))
    edf_set_technician(handle,edf_header.technician);
  end;
  if (isfield(edf_header,'equipment'))
    edf_set_equipment(handle,edf_header.equipment);
  end;
  if (isfield(edf_header,'recording_info'))
    edf_set_recording_info(handle,edf_header.recording_info);
  end;

  if (isfield(edf_header,'edfsignals') & isfield(edf_header,'signal'))

  for signal=0:(edf_header.edfsignals-1)

    if (isfield(edf_header.signal(signal),'samplefrequency'))
      edf_set_samplefrequency(handle,signal,edf_header.signal(signal).samplefrequency);
    end;
    if (isfield(edf_header.signal(signal),'physical_maximum'))
      edf_set_physical_maximum(handle,signal,edf_header.signal(signal).physical_maximum);
    end;
    if (isfield(edf_header.signal(signal),'physical_minimum'))
      edf_set_physical_minimum(handle,signal,edf_header.signal(signal).physical_minimum);
    end;
    if (isfield(edf_header.signal(signal),'digital_maximum'))
      edf_set_digital_maximum(handle,signal,edf_header.signal(signal).digital_maximum);
    end;
    if (isfield(edf_header.signal(signal),'digital_minimum'))
      edf_set_digital_minimum(handle,signal,edf_header.signal(signal).digital_minimum);
    end;
    if (isfield(edf_header.signal(signal),'label'))
    edf_set_label(handle,signal,edf_header.signal(signal).label);
    end;
    if (isfield(edf_header.signal(signal),'prefilter'))
      edf_set_prefilter(handle,signal,edf_header.signal(signal).prefilter);
    end;
    if (isfield(edf_header.signal(signal),'transducer'))
      edf_set_transducer(handle,signal,edf_header.signal(signal).transducer);
    end;
    if (isfield(edf_header.signal(signal),'physical_dim'))
      edf_set_physical_dim(handle,signal,edf_header.signal(signal).physical_dim);
    end;


  end;
  end;
end;
endfunction
// ====================================================================
