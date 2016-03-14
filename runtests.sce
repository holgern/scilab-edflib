// Copyright (C) 2010 - DIGITEO - Michael Baudin

function test_runfromdemo ( demoscript , modulename )
  // Launch the unit tests of the module from the demonstrations.
  //
  // Parameters
  //   demoscript : the name of the demonstration script
  //   modulename : the name of the module
  //
  // Description
  //   The unit tests of the module are launched from
  //   a demonstration script located in the demonstrations directory.
  //   We use the test_run function appropriately, by changing
  //   the current directory and passing the good input argument
  //   to it.
  //
  // Author
  //   2010 - DIGITEO - Michael Baudin

  demopath = get_absolute_file_path(demoscript);
  cwd = pwd();
  mprintf("Running unit tests for module : %s\n",modulename );
  mprintf("Current directory : %s\n",pwd());
  test_files = dir(demopath+"/tests/unit_tests/*.tst")
  max(size(test_files.name))
  for i=1:max(size(test_files.name))
    mprintf("Running %d. of %d tests: %s\n",i,max(size(test_files.name)),basename(test_files.name(i)))
	exec(test_files.name(i));
  end;
  cd(cwd);

endfunction

test_runfromdemo ( "runtests.sce" , "swt" );


