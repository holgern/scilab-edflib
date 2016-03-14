function  [edf_file]=edfread_file(filename)
// Reads the entire file (header, annotation, data).
// Calling Sequence
// [edf_file]=edfread_file(filename);
// [edf_file]=edfread_file(edf_header);
// Parameters
// path: string containing the path and name of the file
// edf_header: plist with header information from edfopen_file_readonly
// edf_file:   struct containing all  data.
// edf_file.header: struct containing the header information
// edf_file.annotation: struct containing all  annotations
// edf_file.data: data matrix
// Description
// extract all signals data from a edf/bdf-file, if and only if each signal has the same sampling rate.
// Examples
// [edf_file]=edfread_file(edf_getpath()+'/demos/demo.bdf');
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
//[edf_file]=edfread_file(header_list);
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
  edf_file.header=edf_get_header(filename);
  edf_file.annotation = edf_get_annotations(filename);
  edf_file.data=edfread_samples(filename);
endfunction
// ====================================================================
