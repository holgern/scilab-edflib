function  [ReadID]=edf_find_signalid(filename,label)
// Searches all available signals for a given label and returns the signal id
// Calling Sequence
// [signal_ID]=edf_find_signalid(filename,label)
// [signal_ID]=edf_find_signalid(edf_header,label)
// Parameters
// filename_read: string containing the path and name of the file from which the header should be copied
// edf_header: struct with header information from edfopen_file_readonly
// label: Name of the label from which the signal id should be returned
// signal_ID: signal ID with desired label. is 0 when the label does not exists.
// Description
// Searches all available signals for a given label and returns the signal id.
// 
// The output is 0, when the label does not exists.
// Examples
// [signal_ID]=edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine")
// [signal_ID]=edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine2")
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
    ReadID=0;
    for i=1:edf_header.edfsignals
	if stripblanks(edf_header.label(i))==label then
	    ReadID=i;
	end
   
    end

endfunction
// ====================================================================
