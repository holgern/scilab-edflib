function  edf_copy_file_header(filename,write_handle)
// Copy the complete header from one edf/bdf to an other file
// Calling Sequence
// edf_copy_file_header(filename_read,write_handle)
// edf_copy_file_header(edf_header,write_handle)
// Parameters
// filename_read: string containing the path and name of the file from which the header should be copied
// edf_header: struct with header information from edfopen_file_readonly
// write_handle: handle to writeable file to which the header is copied
// Description
// Copy the complete header from one edf/bdf to an other file
// Examples
// [write_handle]=edfopen_file_writeonly('demo2.bdf', 1, 2);
// edf_copy_file_header(edf_getpath()+'/demos/demo.bdf',write_handle);
// 
// 
// 
// channel = edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine");
// edf_copy_signal_header(edf_getpath()+'/demos/demo.bdf',channel,write_handle,channel);
// channel2 = edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine2");
// edf_copy_signal_header(edf_getpath()+'/demos/demo.bdf',channel2,write_handle,channel2);
// 
// edf_copy_signal_data(edf_getpath()+'/demos/demo.bdf',[channel,channel2],write_handle);
// 
// 
// edf_close(write_handle);
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
//
//
	  
    [lhs,rhs]=argn(0);
    if rhs <2 then
  	 error("Expect two arguments")
    end
    if (typeof(filename)=="plist") then
        edf_header=filename;
    elseif (typeof(filename)=="string") then

     try
	edf_header=edfopen_file_readonly(filename,0);
	edf_close(edf_header("handle"));
     catch
       error(lasterror());
     end;
    else 
       error("Wrong input type!");
    end;
    
    edf_set_admincode(write_handle,edf_get_admincode(edf_header));
    edf_set_birthdate(write_handle,edf_birthdate_str2vec(edf_get_birthdate(edf_header)));
    edf_set_equipment(write_handle,edf_get_equipment(edf_header));
    edf_set_gender(write_handle,edf_gender_str2scalar(edf_get_gender(edf_header)));
    edf_set_patient_info(write_handle,edf_get_patient_info(edf_header));
    edf_set_patientcode(write_handle,edf_get_patientcode(edf_header));
    edf_set_patientname(write_handle,edf_get_patientname(edf_header));
    edf_set_recording_info(write_handle,edf_get_recording_info(edf_header));
    edf_set_startdatetime(write_handle,edf_get_startdatetime(edf_header));
    edf_set_technician(write_handle,edf_get_technician(edf_header));
endfunction
// ====================================================================
