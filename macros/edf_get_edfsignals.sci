function  [edfsignals]=edf_get_edfsignals(filename)
// Returns the number of edfsignals which are saved in the file. 
// Calling Sequence
// edfsignals=edf_get_edfsignals(path)
// edfsignals=edf_get_edfsignals(edf_header)
// Parameters
// path: string containing the path and name of the file
// edf_header: struct with header information from edfopen_file_readonly
// edfsignals: number of edfsignals which are saved in the file
// Description
// Returns the number of edfsignals which are saved in the file. 
// Examples
// edfsignals=edf_get_edfsignals(edf_getpath()+'/demos/demo.bdf');
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
// edfsignals=edf_get_edfsignals(header_list);
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
       edfsignals=[];
       error(lasterror());
     end;
    else 
       error("Wrong input type!");
    end;
    
    edfsignals=edf_header("edfsignals");
	

endfunction
// ====================================================================
