function  edf_plot_signals(filename,readsignal,startTime,endTime)
// plots the  data for specified signals from one file to an other file
// Calling Sequence
// edf_plot_signals(filename,readsignal)
// edf_plot_signals(edf_header,readsignal)
// edf_plot_signals(filename,readsignal,startTime,startTime)
// edf_plot_signals(edf_header,readsignal,startTime,startTime)
// Parameters
// filename_read: string containing the path and name of the file from which the header should be copied
// edf_header: struct with header information from edfopen_file_readonly
// readsignal: vector with signal numbers, Minimum value is 1. These channels are plotted.
// startTime: startTime in seconds relative to the beginning
// endTime: end time  in seconds relative to the beginning  
// Description
// Plots the  data for specified signals from one file
// Examples
// 
// channel = edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine");
// channel2 = edf_find_signalid(edf_getpath()+'/demos/demo.bdf',"sine2");
// 
// edf_plot_signals(edf_getpath()+'/demos/demo.bdf',[channel,channel2],1,3);
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
    opened_file=%f;
    
    if rhs <2 then
  	 error("Expect at least two arguments")
    end
    if (typeof(filename)=="plist") then
        edf_header=filename;
    elseif (typeof(filename)=="string") then

     try
	edf_header=edfopen_file_readonly(filename,0);
	opened_file=%t;
     catch
       error(lasterror());
     end;
    else 
       error("Wrong input type!");
    end;

    if (min(readsignal)<1) then
       if (opened_file) then
	  edf_close(edf_header("handle"));
       end;
       error("first signal channel is 1 not 0!");
    end;
    
    if (max(readsignal)>edf_get_edfsignals(edf_header)) then
       if (opened_file) then
	  edf_close(edf_header("handle"));
       end;
      error("Signal number to high!");
      
    end;
    if rhs < 3 then
      startTime=0;
    end;
    
    if rhs < 4 then
       endTime=edf_header.datarecords_in_file;
    end;

    if (startTime<0 | endTime<startTime | endTime>edf_header.datarecords_in_file) then
       if (opened_file) then
	  edf_close(edf_header("handle"));
       end;
      error("wrong StartTime or EndTime");
    end;
   
    
    
    TA=1 ./ edf_header.smp_in_datarecord;
    scf();
    
     for i=1:length(readsignal)
	startIndex=round(startTime*edf_header.smp_in_datarecord(readsignal(i)));
	edfseek(edf_header.handle,readsignal(i) ,startIndex,0);
    end;
      for i=1:length(readsignal)
          duration=round((endTime-startTime)*edf_header.smp_in_datarecord(readsignal(i)));
          subplot(length(readsignal),1,i)
          plot(startTime:TA(readsignal(i)):endTime-TA(readsignal(i)),edfread_physical_samples(edf_header.handle,readsignal(i),duration)');
          xgrid();
          ylabel(edf_get_label(edf_header,readsignal(i))+" ["+edf_get_physical_dim(edf_header,readsignal(i))+"]");
      end;


if (typeof(filename)=="string") then
    edf_close(edf_header("handle"));
end;

endfunction
// ====================================================================
