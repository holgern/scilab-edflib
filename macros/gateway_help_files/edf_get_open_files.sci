function [number_of_open_files,handle_vector]=edf_get_open_files()
//Returns the number of opened files and all used handles
//Calling Sequence
//[number_of_opened_files,handle_vector]=edf_get_open_files()
//Parameters
//number_of_opened_files: number of opened files (opened with edfopen_file_readonly and edfopen_file_writeonly)
//handle_vector: vector with all used handles
//Description
//Returns the number of opened files and all used handles
//Examples
//[number_of_opened_files,handle_vector]=edf_get_open_files()
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