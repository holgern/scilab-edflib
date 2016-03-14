function  edf_copy_signal_data(filename,readsignal,write_handle,rate_change)
// Copy the complete data for specified signals from one file to an other file
// Calling Sequence
// edf_copy_signal_data(filename_read,readsignal,write_handle)
// edf_copy_signal_data(edf_header,readsignal,write_handle)
// edf_copy_signal_data(filename_read,readsignal,write_handle,rate_change)
// edf_copy_signal_data(edf_header,readsignal,write_handle,rate_change)
// Parameters
// filename_read: string containing the path and name of the file from which the header should be copied
// edf_header: struct with header information from edfopen_file_readonly
// readsignal: signal number, Minimum value is 1. These channels are copied.
// write_handle: handle to writeable file to which the header is copied
// rate_change: vector with rate change factor for each signal in readsignal. default is 1.
// 
// Description
// Copy the complete data for specified signals from one file to an other file.
// 
// It is possible to change the sampling rate by rate_change for each signal seperately.
// The rate change is applied by the scilab function intdec.
// 
// Examples
// [write_handle]=edfopen_file_writeonly('demo2.bdf', 1, 2);
// edf_copy_file_header(edf_getpath()+'/demos/demo.bdf',write_handle);
// 
// 
// 
// channel = edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine");
// edf_copy_signal_header(edf_getpath()+'/demos/demo.bdf',channel,write_handle,channel);
// channel2 = edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine2");
// edf_copy_signal_header(edf_getpath()+'/demos/demo.bdf',channel2,write_handle,channel2);
// 
// edf_copy_signal_data(edf_getpath()+'/demos/demo.bdf',[channel,channel2],write_handle,[0.5,0.5]);
// edf_close(write_handle);
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
	  
    [lhs,rhs]=argn(0);
    if rhs <3 then
  	 error("Expect at least three arguments")
    end
    if (typeof(filename)=="plist") then
        edf_header=filename;
    elseif (typeof(filename)=="string") then

     try
	edf_header=edfopen_file_readonly(filename,0);

     catch
       error(lasterror());
     end;
    else 
       error("Wrong input type!");
    end;

    if min(readsignal)<1  then
       error("first signal channel is 1 not 0!");
    end;
        
    if (max(readsignal)>edf_get_edfsignals(edf_header)) then
      error("Signal number to high!");
    end;
 
    if (rhs < 4) then
       rate_change=ones(readsignal);
    end;

    for i=1:length(readsignal)
      edfrewind(edf_header.handle,readsignal(i));
    end;
    
    TA=1 ./ edf_header.smp_in_datarecord;
    TA_cal = TA./rate_change;
    for i=1:length(readsignal)
      if (rate_change(readsignal(i))~=1) then
	edf_set_samplefrequency(write_handle,i,1/TA_cal(readsignal(i)));
      end;
    end;

    for j=1:edf_header.file_duration
      for i=1:length(readsignal)
          if (rate_change(readsignal(i))==1) then
             edfwrite_psamples(write_handle,edfread_physical_samples(edf_header.handle,readsignal(i),1/TA(readsignal(i))));
          else
             edfwrite_psamples(write_handle,intdec(edfread_physical_samples(edf_header.handle,readsignal(i),1/TA(readsignal(i))),rate_change(readsignal(i))));
          end;
      end;
    end;


if (typeof(filename)=="string") then
    edf_close(edf_header("handle"));
end;

endfunction
// ====================================================================
