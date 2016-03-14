function  [edf_data]=edfread_samples(filename,edfsignal,n)
// extract signal data from a edf/bdf-file
// Calling Sequence
// [data]=edfread_samples(path);
//     [data]=edfread_samples(path,edfsignal);
//     [data]=edfread_samples(path,edfsignal,n);
// Parameters
// path: string containing the path and name of the file
// edfsignal:   Minimum value is 1 
// n: defines the number of values which will be extracted from the file (integer).
// data: data matrix.
// Description
// extract signal data from a edf/bdf-file
// Examples
// [data]=edfread_samples(edf_getpath()+'/demos/demo.bdf',1,-1);
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
    if rhs == 0 then
  	 error("Expect at least one argument")
    end
    if rhs > 3 then
  	 error("Maximal 3 arguments!")
    end 
       edf_data=[];
       
    if (typeof(filename)=="plist") then
        edf_header=filename;
    elseif (typeof(filename)=="string") then
       
	try
	    edf_header=edfopen_file_readonly(filename,0);
	catch
	  error(lasterror());
	end
     else 
       error("Wrong input type!");
    end;
     try
       if (rhs ==1) then 
	  edfsignals=1:edf_header("edfsignals");
	  n=edf_header("smp_in_file")(1);
	  edf_data=zeros(n,edf_header("edfsignals"));
	  equal_length=%t;
	  for i=edfsignals
	      if edf_header("smp_in_file")(i) ~= n then
		      equal_length=%f;
		      edf_data=list();
//                   edf_close(edf_header("handle"));
// 		error("The number of samples must be the same for all edfsignals! Please read the samples for each edfsignal seperatly!");
              end
	  end
	for i=edfsignals
	   if equal_length then
	      edf_data(:,i)=edfread_physical_samples(edf_header("handle"),i,n);
	   else
	      edf_data(i)=edfread_physical_samples(edf_header("handle"),i,n);
	   end;
	end

	elseif (rhs == 2) then
	  if (min(edfsignal)<1 | max(edfsignal)>edf_header("edfsignals")) then
                edf_close(edf_header("handle"));
	      error("Choose an edfsignal beetween 1 and %d !",edf_header("edfsignals"));
	  end;
          if (size(edfsignal,'*')>1) then
	      n=edf_header("smp_in_file")(edfsignal(1));
	      edf_data=zeros(n,size(edfsignal,'*'));
	      for i=edfsignal
	        if edf_header("smp_in_file")(i) ~= n then
                    edf_close(edf_header("handle"));
		  error("The number of samples must be the same for all edfsignals! Please read the samples for each edfsignal seperatly!");
                end
	        edf_data(:,i)=edfread_physical_samples(edf_header("handle"),i,n);
	      end
          else
             n=edf_header("smp_in_file")(edfsignal);
	     edf_data=zeros(n,1);
	     edf_data=edfread_physical_samples(edf_header("handle"),edfsignal,n);
          end;
	else //rhs==3
	  if (edfsignal<1 | edfsignal>edf_header("edfsignals")) then
                edf_close(edf_header("handle"));
	      error("Choose an edfsignal beetween 1 and %d !",edf_header("edfsignals"));
	  end;
	  if (n<1) then
             n=edf_header("smp_in_file")(edfsignal);
          end;
	  if (n>edf_header("smp_in_file")(edfsignal)) then
                  edf_close(edf_header("handle"));
                error("The parameter n is to big!");
          end
          edf_data=zeros(n,1);
	  edf_data=edfread_physical_samples(edf_header("handle"),edfsignal,n);
	end
	if (typeof(filename)=="string") then
	    edf_close(edf_header("handle"));
        end;
catch
  if (typeof(filename)=="string") then
    edf_close(edf_header("handle"));
  end;
  error(lasterror());
end


endfunction
// ====================================================================
