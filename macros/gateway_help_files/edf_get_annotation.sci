function  [edf_annotation]=edf_get_annotation(filename)
// Annotations from a edf-file
// Calling Sequence
// [ann_time,ann_dur,ann_text]=edf_get_annotation(path)
// [ann_time,ann_dur,ann_text]=edf_get_annotation(edf_header)
// Parameters
// path: string containing the path and name of the file
// edf_header: plist with header information from edfopen_file_readonly
// ann_time:  start times of the annotations 
// ann_dur: duration times of the annotations (saved as string)
// ann_text: string vector of the annotation descriptions 
// Description
// Extract annotations from a edf-file.
// Examples
// [ann_time,ann_dur,ann_text]=edf_get_annotation(edf_getpath()+'/demos/demo.bdf')
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 2);
// [ann_time,ann_dur,ann_text]=edf_get_annotation((header_list);
// edf_close(header_list.handle);
// See also
// edf_get_annotations
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
endfunction