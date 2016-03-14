function  edfwrite_annotations(handle,edf_annotation)
// Writes an annotation/event to the file
// Calling Sequence
// edfwrite_annotations(edf_handle,edf_annotation)
// Parameters
// edf_handle: integer containing the file handle of the opened edf/bdf-file.
// edf_annotation:the struct edf_annotation contains: edf_annotation.onset, edf_annotation.duration and edf_annotation.description. Each entry can be a vector!  .
// edf_annotation.onset: onset is relative to the starttime and startdate of the file in units of Seconds! resolution is 0.0001 second! .
// edf_annotation.duration :  duration are in units of Seconds! resolution is 0.0001 second! If duration is unknown or not applicable: set a negative number (-1)
// edf_annotation.description:  UTF8-string containing the text that describes the event.
// 
// Description
// Writes annotations/events from a structure to the file.  This function is optional and can be called only after opening a file in writemode
//  and before closing the file 
// Examples
// edf_annotation.onset=[1.43; 1.5];
// edf_annotation.duration=[-1;-1];
// edf_annotation.description=["ann 1"; "ann 2"];
// edfwrite_annotations(edf_handle, edf_annotation);
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
    if rhs <2 then
  	 error("Expect at least two arguments")
    end
try
      if (type(edf_annotation)==17) 

      for i=1:length(edf_annotation.onset)
	edfwrite_annotation_utf8(handle,edf_annotation.onset(i),edf_annotation.duration(i),edf_annotation.description(i));
      end;
      end;
catch
       
       error(lasterror());
end;

endfunction
// ====================================================================
