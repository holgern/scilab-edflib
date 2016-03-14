function  edfwrite_psamples(edf_handle, data_vec)
// Writes n physical samples (uV, mA, Ohm) belonging to one signal where n is the samplefrequency of the signal.
// Calling Sequence
// edfwrite_psamples(edf_handle, data_vec)
// Parameters
// handle: a integer containing the file handle of the opened bdf/edf-file
// data_vec: data vector belonging to one signal. The size must be the samplefrequency of the signal.
// 
// Description
//  Writes n physical samples (uV, mA, Ohm) from data_vec belonging to one signal
//   where n is the samplefrequency of the signal.
//   The physical samples will be converted to digital samples using the
//   values of physical maximum, physical minimum, digital maximum and digital minimum.
//   The number of samples written is equal to the samplefrequency of the signal.
//   Call this function for every signal in the file. The order is important!
//   When there are 4 signals in the file, the order of calling this function
//   must be: signal 0, signal 1, signal 2, signal 3, signal 0, signal 1, signal 2, etc.
//   
//   All parameters must be already written into the bdf/edf-file.
// 
// Examples
// edfwrite_psamples(edf_handle, data_vec);
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