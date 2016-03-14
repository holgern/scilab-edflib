function  edf_copy_signal_header(filename,readsignal,write_handle,writesignal)
// Copy the complete header from one signal to an other file
// Calling Sequence
// edf_copy_file_header(filename_read,readsignal,write_handle,writesignal)
// edf_copy_file_header(edf_header,readsignal,write_handle,writesignal)
// Parameters
// filename_read: string containing the path and name of the file from which the header should be copied
// edf_header: struct with header information from edfopen_file_readonly
// readsignal: signal number, Minimum value is 1
// write_handle: handle to writeable file to which the header is copied
// writesignal: signal number, Minimum value is 1
// Description
// Copy the complete header from one signal to an other file
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
// edf_copy_annotation(edf_getpath()+'/demos/demo.bdf',write_handle);
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
    if rhs <4 then
  	 error("Expect four arguments")
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
    
    	  if (readsignal<1 | readsignal>edf_header("edfsignals")) then
	      error("Choose an edfsignal beetween 1 and %d !",edf_header("edfsignals"));
	  end;
    edf_set_digital_maximum(write_handle,writesignal,edf_get_digital_maximum(edf_header,readsignal));
    edf_set_digital_minimum(write_handle,writesignal,edf_get_digital_minimum(edf_header,readsignal));
    edf_set_label(write_handle,writesignal,edf_get_label(edf_header,readsignal));
    edf_set_physical_dim(write_handle,writesignal,edf_get_physical_dim(edf_header,readsignal));
    edf_set_physical_maximum(write_handle,writesignal,edf_get_physical_maximum(edf_header,readsignal));
    edf_set_physical_minimum(write_handle,writesignal,edf_get_physical_minimum(edf_header,readsignal));
    edf_set_prefilter(write_handle,writesignal,edf_get_prefilter(edf_header,readsignal));
    //edf_get_samplefrequency
    edf_set_transducer(write_handle,writesignal,edf_get_transducer(edf_header,readsignal));
    
    edf_set_samplefrequency(write_handle,writesignal,edf_get_samplefrequency(edf_header,readsignal));

endfunction
// ====================================================================
