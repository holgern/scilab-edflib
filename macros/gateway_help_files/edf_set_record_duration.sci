function  edf_set_record_duration(edf_handle,duration)
// Sets the datarecord duration.
// Calling Sequence
// edf_set_record_duration(edf_handle,duration)
// Parameters
// edf_handle: integer containing file handle of the opened bdf/edf-file
// duration:   The default value is 1 second.  The datarecord duration must be in the range 0.05 to 20.0 seconds.
// Description
//  Sets the datarecord duration. The default value is 1 second. 
//
//  This function is optional, normally you don't need to change the default value.
//  The datarecord duration must be in the range 0.05 to 20.0 seconds.
//  Returns 0 on success, otherwise -1.
//  
//  This function is NOT REQUIRED but can be called after opening a
//  file in writemode and before the first sample write action.
//  This function can be used when you want to use a samplerate
//  which is not an integer. For example, if you want to use a samplerate of 0.5 Hz,
//  set the samplefrequency to 5 Hz and the datarecord duration to 10 seconds.
//  Do not use this function, except when absolutely necessary!
// Examples
// edf_set_record_duration(edf_handle, 0.5);
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