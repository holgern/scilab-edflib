function  [phys_min]=edf_get_physical_minimum(filename,edfsignal)
// Returns the minimum physical value of signal edfsignal.
// Calling Sequence
// phys_min=edf_get_physical_minimum(path, edfsignal)
// phys_min=edf_get_physical_minimum(edf_header, edfsignal)
// Parameters
// path: string containing the path and name of the file
// edf_header: plist with header information from edfopen_file_readonly
// edfsignal: Minimum value is 1
// phys_min: minimum physical value of signal edfsignal
// Description
// Returns the minimum physical value of signal edfsignal.
// Examples
// phys_min=edf_get_physical_minimum(edf_getpath()+'/demos/demo.bdf',1);
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
// phys_min=edf_get_physical_minimum(header_list,1);
// edf_close(header_list.handle);
// See also
// edf_set_physical_minimum
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
       phys_min=[];
       error(lasterror());
     end;
    else 
       error("Wrong input type!");
    end;
     
	if (rhs == 2) then 
	  if (edfsignal<1 | edfsignal>edf_header("edfsignals")) then
	      error("Choose an edfsignal beetween 1 and %d !",edf_header("edfsignals"));
	  end;
	  phys_min=edf_header("phys_min")(edfsignal);
	else
	  phys_min=edf_header("phys_min");
	end

endfunction
// ====================================================================
