function [data]=edfread_physical_samples(handle,edfsignal ,n);
// extract signal data from a edf/bdf-file
// Calling Sequence
// [data]=edfread_physical_samples(handle,edfsignal ,n);
// Parameters
// handle: a integer containing the file handle of the opened bdf/edf-file
// edfsignal: Minimum value is 1
// n: defines the number of values which will be extracted from the file (integer).
// data: read data
// Description
// Reads n samples from edfsignal, starting from the current sample position indicator.
//   The values are converted to their physical values e.g. microVolts, beats per minute, etc..
//   The sample position indicator will be increased with the amount of samples read.
// 
// Examples
// [header_list]=edfopen_file_readonly(edf_getpath()+"/demos/demo.bdf",0,0);
// edf_handle=header_list.handle;
// [data]=edfread_physical_samples(edf_handle,1,1000);
// edf_close(edf_handle);
// See also
// edf_close
// edfopen_file_readonly
// edfseek
// edftell
// edfrewind
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