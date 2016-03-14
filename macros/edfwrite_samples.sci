function  edfwrite_samples(handle,sample_freq,data)
// Writes physical samples (uV, mA, Ohm).
// Calling Sequence
// edfwrite_samples(handle,sample_freq,data)
// Parameters
// edf_handle: a integer containing the file handle of the opened bdf/edf-file
// sample_freq: vector or skalar containing the sample frequency of all signals.
// data: matrix or list containing all physical samples which should write to a edf/bdf-file.
// Description
// Writes  physical samples (uV, mA, Ohm) from data belonging to all signals
// 
//   The physical samples will be converted to digital samples using the
//   values of physical maximum, physical minimum, digital maximum and digital minimum.
// 
//   if the samplefrequency of all signals are equal, then the data could be saved into a matrix with the size (N,signals)
//   If the samplefrequency is different, then sample_freq is a vector containing all the different samplefrequencys. The data is saved as list.
//   Each list entry contains a vector with the data of one signal.
//   
//    All parameters must be already written into the bdf/edf-file.
// Examples
// handle=edfopen_file_writeonly(edf_getpath()+'/demos/demo2.bdf',1,5);
//             //same samplefrequency t=10sek signals=5;
//             //sample_freq=100;
//             //data=rand(1000,5);
//             //edfwrite_samples(handle,sample_freq,data);
// 
//            // different samplefrequency t=10sek;signals=5;
//             sample_freq=[100, 100, 100, 10, 1];
//             for (i=1:5)
// 	      edf_set_samplefrequency(handle,i,sample_freq(i));
// 	      edf_set_physical_maximum(handle,i,1);
// 	      edf_set_physical_minimum(handle,i,0);
// 	      edf_set_digital_maximum(handle,i,8388607);
// 	      edf_set_digital_minimum(handle,i,-8388608);
//             end
// 
//             data=list();
//             data(1)=rand(1000,1);
//             data(2)=rand(1000,1);
//             data(3)=rand(1000,1);
//             data(4)=rand(100,1);
//             data(5)=rand(10,1);
// 
//             edfwrite_samples(handle,sample_freq,data);
//             edf_close(handle);
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
    if rhs < 3 then
  	 error("Expect at least three arguments")
    end
   if (type(data)==1)
    signals = size(data,2);
   elseif (type(data)==15)
    signals = size(data);
   else
    error("Wrong data type for data!");
   end;

   if (size(sample_freq,'*')==1) then
	sample_freq=ones(1,signals)*sample_freq;
   else
      if (type(data)==1) then 
	if (mean(sample_freq)~=max(sample_freq))
	  error("sample_freq of all signals must be equal!");
	end
      end
   end

   if (size(sample_freq,'*') ~= signals) then
	  error("dimension of sample_freq and data doesnot fit!");
   end;
 if (type(data)==1)
  sek=ceil(size(data,1)/sample_freq(1));
  data=[data;zeros(sek*sample_freq(1)-size(data,1),signals)];

  for (i=1:sek) 
	  ind=1+((i-1)*sample_freq(1)):sample_freq(1)+((i-1)*sample_freq(1));
	  edf_blockwrite_psamples(handle,data(ind,:));
  end;
 elseif (type(data)==15) //list
  sek=zeros(1,signals);
  for (i=1:signals)
    sek(i)=ceil(size(data(i),'*')/sample_freq(i));
    data(i)=[data(i);zeros(sek(i)*sample_freq(i)-size(data(i),'*'),1)];
  end

  if (mean(sek)~=max(sek))
	  error("time length  of all signals must be equal!");
  end
  sek=sek(1);

  for (i=1:sek) 
    for (j=1:signals)
	  ind=1+((i-1)*sample_freq(j)):sample_freq(j)+((i-1)*sample_freq(j));
	  edfwrite_psamples(handle,data(j)(ind));
    end;
  end;
 end
endfunction
// ====================================================================
