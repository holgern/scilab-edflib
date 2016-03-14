function  [startdatetime]=edf_get_startdatetime(filename)
// Returns the date and starttime.
// Calling Sequence
// start_time=edf_get_startdatetime(path)
// start_time=edf_get_startdatetime(edf_header)
// Parameters
// path: string containing the path and name of the file
// edf_header: plist with header information from edfopen_file_readonly
// start_time: a vector containing the date and startime. (year month day hour minute second) 
// Description
// Returns the date and starttime.
// Examples
// start_time=edf_get_startdatetime(edf_getpath()+'/demos/demo.bdf')
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
// start_time=edf_get_startdatetime(header_list);
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
    if (typeof(filename)=="plist") then
        edf_header=filename;
    elseif (typeof(filename)=="string") then
     try
	edf_header=edfopen_file_readonly(filename,0);
	edf_close(edf_header("handle"));
     catch
       startdatetime=[0,0,0,0,0,0];
       error(lasterror());
     end;
    else 
       error("Wrong input type!");
    end;
    
    startdatetime=edf_header("startdatetime");
     
endfunction
// ====================================================================
