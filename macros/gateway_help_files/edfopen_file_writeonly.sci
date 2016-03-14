function  [edf_handle]=edfopen_file_writeonly(path, filetype, number_of_signals)
// Opens an new file for writing.
// Calling Sequence
// [edf_handle]=edfopen_file_writeonly(path, filetype, number_of_signals)
// Parameters
// path : string containing the path and name of the file
// filetype: 0 = EDFLIB_FILETYPE_EDFPLUS 
//  : 1 = EDFLIB_FILETYPE_BDFPLUS
// number_of_signals: number_of_signals defines the number of signals that can be saved in the file
// edf_handle: handle of the opened file
// Description
// Opens an new file for writing. Warning, an already existing file with the same name will be silently overwritten without advance warning!
// 
//  Returns a handle on success, you need this handle for the other functions.
//  In case of an error, it returns a negative number .  This function is required if you want to write a file..
//
// Examples
// [edf_handle]=edfopen_file_writeonly('demo.bdf', 0, 2);
// See also
// edf_close
// edfwrite_psamples
// edf_blockwrite_psamples
// edfwrite_samples
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