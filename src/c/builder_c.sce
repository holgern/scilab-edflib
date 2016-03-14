// ====================================================================
// Allan CORNET
// Simon LIPP
// INRIA 2008
// This file is released into the public domain
// ====================================================================


CURRENT_PATH = strsubst(get_absolute_file_path("builder_c.sce"), "\", "/");

CFLAGS = " -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I" + CURRENT_PATH;

tbx_build_src(['edf'], ['edflib.c'], 'c', ..
              CURRENT_PATH, '', '', CFLAGS);

clear tbx_build_src;
clear CURRENT_PATH;
clear CFLAGS;
