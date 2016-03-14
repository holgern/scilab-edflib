function  edf_set_physical_minimum(edf_handle, edfsignal,  phys_min)
// Sets the minimum physical value of signal edfsignal.
// Calling Sequence
// edf_set_physical_minimum(edf_handle, edfsignal,  phys_min)
// Parameters
// edf_handle: integer containing file handle of the opened bdf/edf-file
// edfsignal: Minimum value is 1
// phys_min:     double containing the  minimum physical value of the signal edfsignal.
// Description
//  Sets the minimum physical value of signal edfsignal.
//  
//  This function is required for every signal and can be called only after opening a file in writemode
//  and before the first sample write action.
// Examples
// edf_set_physical_minimum(edf_handle,1, -1);
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