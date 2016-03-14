// ====================================================================
// Copyright INRIA 2008
// Allan CORNET
// This file is released into the public domain
// ====================================================================
demopath = get_absolute_file_path("edflib.dem.gateway.sce");

subdemolist = ["demo edf_load"             ,"edf_load.dem.sce"; ..
               "demo edf_ann"            ,"edf_ann.dem.sce" ;..
		"demo edfwrite"		, "edf_write.dem.sce";];

subdemolist(:,2) = demopath + subdemolist(:,2);
// ====================================================================
