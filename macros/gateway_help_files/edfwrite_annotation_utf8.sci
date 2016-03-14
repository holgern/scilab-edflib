function  edfwrite_annotation_utf8(edf_handle, onset, duration, description)
// edfwrite_annotation_utf8
// Calling Sequence
// edfwrite_annotation_utf8(edf_handle, onset, duration, description)
// Parameters
// edf_handle: integer containing file handle of the opened bdf/edf-file
// onset: onset is relative to the starttime and startdate of the file in units of Seconds! resolution is 0.0001 second! .
// duration:  duration are in units of Seconds! resolution is 0.0001 second! If duration is unknown or not applicable: set a negative number (-1)
// description:  UTF8-string containing the text that describes the event.
// 
// Description
// Writes an annotation/event to the file.  This function is optional and can be called only after opening a file in writemode
//  and before closing the file
// 
// Examples
// edfwrite_annotation_utf8(edf_handle, 1.43, -1, "ann 1");
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