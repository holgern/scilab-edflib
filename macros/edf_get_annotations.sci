function  [edf_annotation]=edf_get_annotations(filename)
// Annotations from a edf-file
// Calling Sequence
// [ann_struct]=edf_get_annotations(edf_file)
// Parameters
// path: string containing the path and name of the file
// ann_struct :  structure containing the annotations  .
// ann_struct.time  :  start times of the annotations .
// ann_struct.duration: duration times of the annotations (saved as string)
// ann_struct.description: string vector of the annotation descriptions
// Description
// Extract annotations from a edf-file.
// Examples
// [ann_struct]=edf_get_annotations(edf_getpath()+'/demos/demo.bdf');
// See also
// edf_get_annotation
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
  //edf_header="";
      [lhs,rhs]=argn(0);
    if rhs == 0 then
  	 error("Expect at least one argument")
    end
    try
      [ann_time,ann_dur, ann_text]=edf_get_annotation(filename);
     catch
        edf_annotation.ontime=[];
        edf_annotation.duration="";
        edf_annotation.description="";
       error(lasterror());
     end;
  edf_annotation.ontime=ann_time;
  edf_annotation.duration=ann_dur;
  edf_annotation.description=ann_text;

endfunction
// ====================================================================
