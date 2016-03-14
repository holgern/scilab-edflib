// ====================================================================

demopath = get_absolute_file_path("edf_write.dem.sce");

disp("handle=edf_write(''demo.bdf'',1,2);");

handle=edfopen_file_writeonly('demo.bdf',1,2);

edf_set_samplefrequency(handle,1,100);
edf_set_physical_maximum(handle,1,1);
edf_set_physical_minimum(handle,1,-1);
edf_set_digital_maximum(handle,1,8388607);
edf_set_digital_minimum(handle,1,-8388608);
edf_set_label(handle,1,'sine');
edf_set_prefilter(handle,1,'nothing');
edf_set_transducer(handle,1,'direct');
edf_set_physical_dim(handle,1,'A');


edf_set_samplefrequency(handle,2,100);
edf_set_physical_maximum(handle,2,1);
edf_set_physical_minimum(handle,2,-1);
edf_set_digital_maximum(handle,2,8388607);
edf_set_digital_minimum(handle,2,-8388608);
edf_set_label(handle,2,'sine2');
edf_set_prefilter(handle,2,'nothing');
edf_set_transducer(handle,2,'direct');
edf_set_physical_dim(handle,2,'A');

edf_set_startdatetime(handle,getdate());
edf_set_patientname(handle,'holger');
edf_set_patientcode(handle,'code0');
edf_set_gender(handle,1);
edf_set_birthdate(handle,[2000,1,1]);
edf_set_patient_info(handle,'patient info');
edf_set_admincode(handle,'admincode');
edf_set_technician(handle,'tec2');
edf_set_equipment(handle,'device 3');
edf_set_recording_info(handle,'recording info');

t=0:1/100:(10-1/100);
x=sin(2*%pi*0.5*t)';
x2=sin(2*%pi*1*t)'; 

 

edfwrite_samples(handle,100,[x,x2]);

edfwrite_annotation_utf8(handle,1,-1,"first annotation!");
edfwrite_annotation_utf8(handle,5,-1,"second annotation!");
edfwrite_annotation_utf8(handle,9,-1,"third annotation!");

edf_close(handle);



