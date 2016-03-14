function  edf_copy_annotation(filename,write_handle)
// Copy all annotation from one edf/bdf to an other file
// Calling Sequence
// edf_copy_annotation(filename_read,write_handle)
// edf_copy_annotation(edf_header,write_handle)
// Parameters
// filename_read: string containing the path and name of the file from which the header should be copied
// edf_header: struct with header information from edfopen_file_readonly
// write_handle: handle to writeable file to which the header is copied
// Description
// Copy all annotation from one edf/bdf to an other file
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
    if rhs <2 then
  	 error("Expect two arguments")
    end
//     if (typeof(filename)=="plist") then
//         edf_header=filename;
//     elseif (typeof(filename)=="string") then
// 
//      try
// 	edf_header=edfopen_file_readonly(filename,2);
// 	edf_close(edf_header("handle"));
//      catch
//        error(lasterror());
//      end;
//     else 
//        error("Wrong input type!");
//     end;
    
    [ann_time,ann_dur,ann_text]=edf_get_annotation(filename);
    
for ann_index=1:length(ann_time)
   if (isempty(ann_dur(ann_index)))
       edfwrite_annotation_utf8(write_handle,ann_time(ann_index),-1,ann_text(ann_index));
   else
       edfwrite_annotation_utf8(write_handle,ann_time(ann_index),eval(ann_dur(ann_index)),ann_text(ann_index));
   end;
end;
    
endfunction
// ====================================================================
