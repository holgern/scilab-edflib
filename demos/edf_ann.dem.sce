// ====================================================================
mode(-1);
lines(0);

demopath = get_absolute_file_path("edf_ann.dem.sce");


disp("[ann_time, ann_dur, ann_text]=edf_ann(''demo.bdf'');");
[ann_time, ann_dur, ann_text]=edf_get_annotation(demopath+'demo.bdf');
disp(ann_text);
disp(ann_time);


