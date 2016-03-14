function  [time]=edf_get_timevector(filename,signal,file_length)
// Generates a time vector for the signal edfsignal.
// Calling Sequence
//            [time_vec]=edf_get_timevector(path, edfsignal,length);
//           [time_vec]=edf_get_timevector(path, edfsignal);
//            [time_vec]=edf_get_timevector(edf_header, edfsignal,length);
//           [time_vec]=edf_get_timevector(edf_header, edfsignal);
// Parameters
// path: string containing the path and name of the file
// edf_header: plist with header information from edfopen_file_readonly
// edfsignal: Minimum value is 1
// length:length of the generated time vector
// time_vec:time vector of the signal edfsignal
// Description
// Generates a time vector for the signal edfsignal.
// Examples
// time_vec=edf_get_timevector(edf_getpath()+'/demos/demo.bdf',1)
// 
// [header_list]=edfopen_file_readonly(edf_getpath()+'/demos/demo.bdf', 0);
// time_vec=edf_get_timevector(header_list,1);
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

    [lhs,rhs]=argn(0);
    if rhs <1 then
  	 error("Expect at least two arguments")
    end
    
 try
   TA=1/edf_get_samplefrequency(filename,signal); 

  if (rhs==2)
    time=(0:TA:(edf_get_signal_samples(filename,signal)-1)*TA)';
  else
    if (file_length>0)
      time=(0:TA:(file_length-1)*TA)';
    else
      time=(0:TA:(edf_get_signal_samples(filename,signal)-1)*TA)';
    end;
  end;
 catch
       time=[];
       error(lasterror());
 end

endfunction
// ====================================================================
