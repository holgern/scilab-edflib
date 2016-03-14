function p=edf_getpath()
// return the path where the edflib toolbox is installed
// Calling Sequence
// path=edf_getpath()
// Parameters
// path: string containing the path of the toolbox
// Description
// return the path where the edflib toolbox is installed
// Examples
// path=edf_getpath()
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

  t=string(edflib)
  p=t(1)
  p=strsubst(p,'//','/');
  p=part(p,1:length(p)-length('macros')-1)
endfunction