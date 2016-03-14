function  [vec_birthdate]=edf_birthdate_str2vec(str_birthdate)
// Converts the birthdate string into a vector
// Calling Sequence
// [birthdate_vec]=edf_birthdate_str2vec(birthdate_string)
// Parameters
// birthdate_string:  a string which contains a birthdate, which is the output of the function edf_get_birthdate() 
// birthdate: vector which contains a birthdate (year month day), which can be feeded into the function edf_set_birthdate()
// Description
// Converts the birthdate string into a vector.
// Examples
// // copy birthdate from the file "demo.bdf" to the new bdf/edf-file.
// edf_birthdate_str2vec(edf_get_birthdate(edf_getpath()+'/demos/demo.bdf'));
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
	  vec_birthdate=[1900, 1, 1];
	  
	  if ~isempty(str_birthdate) then
	    vec=eval(part(str_birthdate,1:2));
	    vec_birthdate(3)=vec;
	    vec=eval(part(str_birthdate,8:12));
	    //vec_birthdate(1)=vec(1)*1000+100*vec(2)+10*vec(3)+1*vec(4);
	    vec_birthdate(1)=vec;
	    select (part(str_birthdate,4:6)),
		  case 'jan' then vec_birthdate(2)=1,
		  case 'feb' then  vec_birthdate(2)=2,
		  case 'mar' then  vec_birthdate(2)=3,
		  case 'apr' then  vec_birthdate(2)=4,
		  case 'mai' then vec_birthdate(2)=5,
		  case 'jun' then vec_birthdate(2)=6,
		  case 'jul' then vec_birthdate(2)=7,
		  case 'aug' then vec_birthdate(2)=8,
		  case 'sep' then vec_birthdate(2)=9,
		  case 'oct' then vec_birthdate(2)=10,
		  case 'nov' then vec_birthdate(2)=11,
		  case 'dez' then vec_birthdate(2)=12,
	    end
	  end
endfunction
// ====================================================================
