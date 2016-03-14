function  [scalar_gender]=edf_gender_str2scalar(str_gender)
// Converts the gender string into a scalar 
// Calling Sequence
// [gender_scalar]=edf_gender_str2scalar(gender_string)
// Parameters
// gender_string : a string which contains a gender, which is the output of the function edf_get_gender()
// gender_scalar: scalar which contains a gender (0 - male, 1 - female), which can be feeded into the function edf_set_gender() .
// Description
// Converts the gender string into a scalar.
// Examples
// // copy gender from the file "demo.bdf" to the new bdf/edf-fil
// edf_set_gender(handle, edf_gender_str2scalar(edf_get_gender(edf_getpath()+'/demos/demo.edf')))
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
	  scalar_gender=0;
	  
	  select (str_gender),
	  	 case 'Male' then scalar_gender=0,
		 case 'Female' then  scalar_gender=1,
           end
endfunction
// ====================================================================
