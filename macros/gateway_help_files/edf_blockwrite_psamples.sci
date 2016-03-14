function edf_blockwrite_psamples(edf_handle, data_vec)
//Writes physical samples (uV, mA, Ohm).
//Calling Sequence
//edf_blockwrite_psamples(edf_handle, data_vec)
//Parameters
//handle: a integer containing the file handle of the opened bdf/edf-file
//data_vec: data vector belonging to one signal. The size must be the samplefrequency of the signal.
//Description
// Writes physical samples (uV, mA, Ohm) from data_vec.
//   datavec must be filled with samples from all signals, starting with n samples of signal 0, n samples of signal 1, n samples of signal 2, etc.
//    where n is the samplefrequency of the signal.
//   One block equals one second.
//    The physical samples will be converted to digital samples using the
//    values of physical maximum, physical minimum, digital maximum and digital minimum.
//    The total number of samples written is equal to the sum of the samplefrequencies of all signals.
//   
//    All parameters must be already written into the bdf/edf-file.
//  
//  Examples
//  edf_blockwrite_psamples(edf_handle, data_vec)
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

endfunction