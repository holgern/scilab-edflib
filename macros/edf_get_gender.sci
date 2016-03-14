function  [gender]=edf_get_gender(filename)
// Returns the gender.
// Calling Sequence
// gender=edf_get_gender(path)
// gender=edf_get_gender(edf_header)
// Parameters
// path: string containing the path and name of the file
// edf_header: struct with header information from edfopen_file_readonly
// gender: string (Male or Female)
// Description
//  Returns the gender as string (Male or Female). Internally 1 is male, 0 is female. The conversion
//  can be done with edf_gender_str2scalar
// Examples
// gender=edf_get_gender(edf_getpath()+'/demos/demo.edf');
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
// gender=edf_get_gender(header_list);
// edf_close(header_list.handle);
// See also
// edf_gender_str2scalar
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
       gender="";
       error(lasterror());
     end;
    else 
       error("Wrong input type!");
    end;
    
    gender=edf_header("gender");

endfunction
// ====================================================================
