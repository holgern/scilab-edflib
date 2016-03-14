function  edfrewind(handle,edfsignal)
// Sets the sample position indicator to the beginning of the file.
// Calling Sequence
// edfrewind(handle,edfsignal)
// Parameters
// edf_handle: integer containing file handle of the opened bdf/edf-file
// edfsignal: Minimum value is 1
// 
// Description
//  The edfrewind function sets the sample position indicator for the edfsignal pointed to by edfsignal to the beginning of the file.
//
// Note that every signal has it's own independent sample position indicator and edfrewind() affects only one of them.
//
// 
// Examples
// [header_list]=edfopen_file_readonly(edf_getpath()+"/demos/demo.bdf",0,0);
// edf_handle=header_list.handle;
// edfrewind(edf_handle,1);
// edf_close(edf_handle);
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

endfunction