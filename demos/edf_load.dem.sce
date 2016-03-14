demopath = get_absolute_file_path("edf_load.dem.sce");

filename=demopath+'demo.bdf';
signal=1;

A=edfread_samples(filename,signal,-1);



t=edf_get_timevector(filename,signal);
[ann_time,ann_dur, ann_text]=edf_get_annotation(filename);
imax=length(ann_time);

figure();
  plot2d(t(:),A(:));
title("sine2");
for(i=1:imax)

  t_start=ann_time(i);

  ind=min(find(t>t_start));
  
  plot2d([t(ind);t(ind)],[min(A);max(A)]);
  //xset("color",'red');
  xstring(t(ind)-1,min(A),ann_text(i));
end;
