function  [header_list]=edfopen_file_readonly(path, read_annotations,live_stream)
// Opens an new file for reading.
// Calling Sequence
// [header_list]=edfopen_file_readonly(path, read_annotations)
// [header_list]=edfopen_file_readonly(path, read_annotations,live_stream)
// Parameters
// path: string containing the path and name of the file
// read_annotations: 0 = annotations will not be read (this saves time when opening a very large EDFplus or BDFplus file)
// : 1 =  annotations will be read immediately, stops when an annotation has been found which contains the description "Recording ends"
// : 2 = all annotations will be read immediately
// live_stream:  can be used to open edf/bdf - files, which are not closed. 
// : 0 = normal mode
// : 1 = live stream mode
// header_list: mlist, filled with all the relevant header- and signalinfo/parameters
// Description
//  Opens an new file for reading. If the opening was succesful, a header_list which is filled with all the relevant header- and signalinfo/parameters will be given back.
//             The list contains a "handle" (header_list("handle")) which you need for the other functions.
// 
//      content of the header_list:
// 
//      handle
// 
//      filetype  :  0: EDF, 1: EDFplus, 2: BDF, 3: BDFplus, a negative number means an error
// 
//      edfsignals  :  number of signals in the file
// 
//      file_duration  :  duration of the file expressed in Seconds
// 
//      startdatetime
// 
//      patient
// 
//      recording
// 
//      patientcode
// 
//      gender
// 
//      birthdate
// 
//      patient_name
// 
//      patient_additional
// 
//      admincode
// 
//      technician
// 
//      equipment
// 
//      recording_additional
// 
//      datarecord_duration  :  duration of a datarecord expressed in Seconds
// 
//      datarecords_in_file
// 
//      annotations_in_file
// 
//      for each edfsignal: 
// 
//      label
// 
//      smp_in_file
// 
//      phys_max
// 
//      phys_min
// 
//      dig_max
// 
//      dig_min
// 
//      smp_in_datarecord  :  samples in one datarecord
// 
//      physdimension
// 
//      prefilter
// 
//      transducer
// Examples
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
// See also
// edf_close
// edfread_physical_samples
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