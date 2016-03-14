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
//#include <stack-c.h>
#include "api_scilab.h"
#include "Scierror.h"
#include "MALLOC.h"
#include "edflib.h"
/* ==================================================================== */
int sci_edfopen_file_readonly(char *fname)
{
  SciErr sciErr;
  int m1 = 0, n1 = 0;
  int *piAddressVarOne = NULL;
  int* piLenVarOne = NULL;
  char **fileData  = NULL;
  int iType1 = 0;  
  
  int m2 = 0, n2 = 0;
  int *piAddressVarTwo = NULL;
  double *pdVarTwo = NULL;
  int iType2 = 0;  
  
  int m3 = 0, n3 = 0;
  int *piAddressVarThree = NULL;
  double *pdVarThree = NULL;
  int iType3 = 0;  
  
  int *piAddr             = NULL;
  //int* piChild            = NULL;

  struct edf_hdr_struct edfhdr;
  

  
  int i;
  int handle;
//   int m_list_out, n_list_out;
   int m_var, n_double, n_string81,n_string17, n_string16, n_string9;
   double      *l_handle = NULL;//,  l_list_handle;
   double      *l_filetype = NULL;//,  l_list_filetype; 
    double      *l_edfsignals = NULL;//,  l_list_edfsignals;
  double      *l_file_duration = NULL;//,,  l_list_file_duration;
  double     n_startdatetime, *l_startdatetime = NULL;//,  l_list_startdatetime;
  
      char ** l_patient = NULL;//,,  l_list_patient;
    char **l_recording = NULL;//,,  l_list_recording;
    char **l_patientcode = NULL;//,,  l_list_patientcode;
     char **l_gender = NULL;//,,  l_list_gender;
   char **l_birthdate = NULL;//,,  l_list_birthdate;  
    char **l_patient_name = NULL;//,,  l_list_patient_name;   
    char **l_patient_additional = NULL;//,,  l_list_patient_additional;   
    char **l_admincode = NULL;//,,  l_list_admincode;   
   char **l_technician = NULL;//,,  l_list_technician;   
   char **l_equipment = NULL;//,,  l_list_equipment;   
    char **l_recording_additional = NULL;//,,  l_list_recording_additional;   
    
    double      *l_datarecord_duration = NULL;//,,  l_list_datarecord_duration;   
    double      *l_datarecords_in_file = NULL;//,,  l_list_datarecords_in_file;   
    double      *l_annotations_in_file = NULL;//,,  l_list_annotations_in_file;   
    
     char ** l_label = NULL;
     double      *l_smp_in_file = NULL;
     double      *l_phys_max = NULL;    
      double      *l_phys_min = NULL;
      double      *l_dig_max = NULL;     
      double      *l_dig_min = NULL;
       double      *l_smp_in_datarecord = NULL;     
     char ** l_physdimension = NULL;  
     char ** l_prefilter = NULL;   
     char ** l_transducer = NULL;  
     
    int m_mlist,    n_mlist;
     int n_var, n_edfsignals;
     int live_stream=0;
     
     


  
    // The labels of our mlist 
  const char * FieldNames [] = {"plist","handle","filetype","edfsignals","file_duration","startdatetime","patient","recording","patientcode","gender","birthdate","patient_name","patient_additional","admincode","technician","equipment","recording_additional","datarecord_duration","datarecords_in_file","annotations_in_file","label","smp_in_file","phys_max","phys_min","dig_max","dig_min","smp_in_datarecord","physdimension","prefilter","transducer"};
 //const char * FieldNames_signals [] = {"plist","label","smp_in_file","phys_max","phys_min","dig_max","dig_min","smp_in_datarecord","physdimension","prefilter","transducer"};

  
  m_var  = 1; n_var=1;
  n_double  = 1; 
  n_startdatetime=6;
  n_string81  = 81; n_string16=16; n_string9=9; n_string17=17;
  
  m_mlist = 30; n_mlist = 1; // A mlist with 3 elements
  
  /* --> result = csum(3,8)
  /* check that we have only 2 parameters input */
  /* check that we have only 1 parameters output */
  CheckInputArgument(pvApiCtx,2,3) ;
  CheckOutputArgument(pvApiCtx,1,1) ;   
  
  /* get Address of inputs */
  sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddressVarOne);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }
  
  sciErr = getVarAddressFromPosition(pvApiCtx, 2, &piAddressVarTwo);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }
  
  if (nbInputArgument(pvApiCtx)>2) {
    sciErr = getVarAddressFromPosition(pvApiCtx, 3, &piAddressVarThree);
    if(sciErr.iErr)
    {
      printError(&sciErr, 0);
      return 0;
    }
  }
  


  /* check input type */
  sciErr = getVarType(pvApiCtx, piAddressVarOne, &iType1);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  } 
   
  if ( iType1 != sci_strings )
  {
    Scierror(999,"%s: Wrong type for input argument #%d: A string expected.\n",fname,1);
    return 0;
  }

  sciErr = getVarType(pvApiCtx, piAddressVarTwo, &iType2);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }   
  
  if ( iType2 != sci_matrix )
  {
  	Scierror(999,"%s: Wrong type for input argument #%d: A double expected.\n",fname,2);
  	return 0;
  }
  
  if (nbInputArgument(pvApiCtx)>2) {
    sciErr = getVarType(pvApiCtx, piAddressVarThree, &iType3);
    if(sciErr.iErr)
    {
      printError(&sciErr, 0);
      return 0;
    }   
    
    if ( iType3 != sci_matrix )
    {
	  Scierror(999,"%s: Wrong type for input argument #%d: A double expected.\n",fname,3);
	  return 0;
    }
  }


  /* get string */
    sciErr = getMatrixOfString(pvApiCtx, piAddressVarOne,&m1, &n1, NULL, NULL);
  //sciErr = getMatrixOfDouble(pvApiCtx, piAddressVarOne,&m1,&n1,&pdVarOne);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }


    piLenVarOne = (int*)malloc(sizeof(int) * m1 * n1);
   sciErr = getMatrixOfString(pvApiCtx, piAddressVarOne, &m1, &n1, piLenVarOne, NULL);
		if(sciErr.iErr)
		{
			printError(&sciErr, 0);
			return 0;
		}

		fileData = (char**)malloc(sizeof(char*) * m1 * n1);
		for(i = 0 ; i < n1 * m1 ; i++)
		{
			fileData[i] = (char*)malloc(sizeof(char) * (piLenVarOne[i] + 1));//+ 1 for null termination
		}

		sciErr = getMatrixOfString(pvApiCtx, piAddressVarOne, &m1, &n1, piLenVarOne, fileData);
		if(sciErr.iErr)
		{
			printError(&sciErr, 0);
			return 0;
		}




  
  sciErr = getMatrixOfDouble(pvApiCtx, piAddressVarTwo,&m2,&n2,&pdVarTwo);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }
  if (nbInputArgument(pvApiCtx)>2) {
      sciErr = getMatrixOfDouble(pvApiCtx, piAddressVarThree,&m3,&n3,&pdVarThree);
    if(sciErr.iErr)
    {
      printError(&sciErr, 0);
      return 0;
    }
    live_stream=pdVarThree[0];
  }

  
  /* check size */
  if ( (m1 != 1) || (n1 != 1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: One String expected.\n",fname,1);
  	return 0;
  }
  if ( (m2 !=1) || (n2 !=1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,2);
  	return 0;
  }
  if (nbInputArgument(pvApiCtx)>2) {
      if ( (m3 !=1) || (n3 !=1) ) 
      {
	    Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,3);
	    return 0;
      }
    
  }


  
  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);

if (pdVarTwo[0]==0)
	handle=edfopen_file_readonly(fileData[0], &edfhdr, EDFLIB_DO_NOT_READ_ANNOTATIONS,live_stream);
else if (pdVarTwo[0]==1)
	handle=edfopen_file_readonly(fileData[0],&edfhdr, EDFLIB_READ_ANNOTATIONS,live_stream);
else
	handle=edfopen_file_readonly(fileData[0],&edfhdr, EDFLIB_READ_ALL_ANNOTATIONS,live_stream);

if ( handle <0)
{
  switch(fileData[0],handle){
    case EDFLIB_MALLOC_ERROR:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_MALLOC_ERROR\n",  fileData[0],handle); 
      break;
    case EDFLIB_NO_SUCH_FILE_OR_DIRECTORY:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_NO_SUCH_FILE_OR_DIRECTORY\n",  fileData[0],handle); 
      break;
      case EDFLIB_FILE_CONTAINS_FORMAT_ERRORS:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_FILE_CONTAINS_FORMAT_ERRORS\n",  fileData[0],handle); 
      break;
    case EDFLIB_MAXFILES_REACHED:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_MAXFILES_REACHED\n",  fileData[0],handle); 
      break;
    case EDFLIB_FILE_READ_ERROR:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_FILE_READ_ERROR\n",  fileData[0],handle); 
      break;
    case EDFLIB_FILE_ALREADY_OPENED:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_FILE_ALREADY_OPENED\n",  fileData[0],handle); 
      break;
    case EDFLIB_FILETYPE_ERROR:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_FILETYPE_ERROR\n",  fileData[0],handle); 
      break;
    case EDFLIB_FILE_WRITE_ERROR:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_FILE_WRITE_ERROR\n",  fileData[0],handle); 
      break;
    case EDFLIB_NUMBER_OF_SIGNALS_INVALID:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_NUMBER_OF_SIGNALS_INVALID\n",  fileData[0],handle); 
      break;
    case EDFLIB_FILE_IS_DISCONTINUOUS:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_FILE_IS_DISCONTINUOUS\n",  fileData[0],handle); 
      break;
    case EDFLIB_INVALID_READ_ANNOTS_VALUE:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_INVALID_READ_ANNOTS_VALUE\n",  fileData[0],handle); 
      break;
 
    default:
     Scierror(999,"Could not open %s. error: %d\n",  fileData[0],handle); 
  }
    return 0;
}
  
  
n_edfsignals=edfhdr.edfsignals;


 
 
 l_handle = (double *)MALLOC(m_var*n_double*sizeof(double));
 l_filetype = (double *)MALLOC(m_var*n_double*sizeof(double));
 l_edfsignals = (double *)MALLOC(m_var*n_double*sizeof(double));
 l_file_duration = (double *)MALLOC(m_var*n_double*sizeof(double));
 l_startdatetime = (double *)MALLOC(m_var*n_startdatetime*sizeof(double));
 

 l_patient	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_patient[0]=(char*)malloc(sizeof(char) * n_string81);
 
 l_recording	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_recording[0]=(char*)malloc(sizeof(char) * n_string81); 
 
 l_patientcode	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_patientcode[0]=(char*)malloc(sizeof(char) * n_string81); 
 l_gender	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_gender[0]=(char*)malloc(sizeof(char) * n_string16); 
 l_birthdate	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_birthdate[0]=(char*)malloc(sizeof(char) * n_string16); 
 l_patient_name	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_patient_name[0]=(char*)malloc(sizeof(char) * n_string81);
 l_patient_additional	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_patient_additional[0]=(char*)malloc(sizeof(char) * n_string81);
 l_admincode	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_admincode[0]=(char*)malloc(sizeof(char) * n_string81);
 l_technician	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_technician[0]=(char*)malloc(sizeof(char) * n_string81);
 l_equipment	= (char**)malloc(sizeof(char*) * m_var * n_var);
 l_equipment[0]=(char*)malloc(sizeof(char) * n_string81);
 l_recording_additional	= (char**)malloc(sizeof(char*) * m_var * n_var); 
 l_recording_additional[0]=(char*)malloc(sizeof(char) * n_string81);
	  
 l_datarecord_duration = (double *)MALLOC(m_var*n_double*sizeof(double));
 l_datarecords_in_file = (double *)MALLOC(m_var*n_double*sizeof(double));
 l_annotations_in_file = (double *)MALLOC(m_var*n_double*sizeof(double));
 
 l_label	= (char**)malloc(sizeof(char*) * m_var * n_edfsignals);
  for (i=0;i<n_edfsignals;i++)
    l_label[i]=(char*)malloc(sizeof(char) * n_string17); 
 
  l_smp_in_file = (double *)MALLOC(m_var*n_edfsignals*sizeof(double));
  l_phys_max = (double *)MALLOC(m_var*n_edfsignals*sizeof(double)); 
  l_phys_min = (double *)MALLOC(m_var*n_edfsignals*sizeof(double));
  l_dig_max = (double *)MALLOC(m_var*n_edfsignals*sizeof(double));
  l_dig_min = (double *)MALLOC(m_var*n_edfsignals*sizeof(double)); 
  l_smp_in_datarecord = (double *)MALLOC(m_var*n_edfsignals*sizeof(double));  
  
 l_physdimension   = (char**)malloc(sizeof(char*) * m_var * n_edfsignals);
   for (i=0;i<n_edfsignals;i++)
 l_physdimension[i]=(char*)malloc(sizeof(char) * n_string9); 
 l_prefilter	  = (char**)malloc(sizeof(char*) * m_var * n_edfsignals);
 for (i=0;i<n_edfsignals;i++)
 l_prefilter[i]=(char*)malloc(sizeof(char) * n_string81); 
 l_transducer	= (char**)malloc(sizeof(char*) * m_var * n_edfsignals);
  for (i=0;i<n_edfsignals;i++)
 l_transducer[i]=(char*)malloc(sizeof(char) * n_string81); 
 
 l_handle[0]=edfhdr.handle;
 l_filetype[0]=edfhdr.filetype;      
 l_edfsignals[0]=edfhdr.edfsignals;   
 l_file_duration[0]= edfhdr.file_duration/10000000;  
 
 l_startdatetime[0] = edfhdr.startdate_year;            
 l_startdatetime[1] = edfhdr.startdate_month;
 l_startdatetime[2] = edfhdr.startdate_day;   
 l_startdatetime[3] = edfhdr.starttime_hour;
 l_startdatetime[4] = edfhdr.starttime_minute;
 l_startdatetime[5] = edfhdr.starttime_second;
 
 
   strcpy(l_patient[0],edfhdr.patient);//,n_string81);
   strcpy(l_recording[0],edfhdr.recording);//,n_string81);
   strcpy(l_patientcode[0],edfhdr.patientcode);//,n_string81);
   strcpy(l_gender[0],edfhdr.gender);//,n_string16);
   strcpy(l_birthdate[0],edfhdr.birthdate);//,n_string16);  
   strcpy(l_patient_name[0],edfhdr.patient_name);//,n_string81);  
   strcpy(l_patient_additional[0],edfhdr.patient_additional);//,n_string81);  
   strcpy(l_admincode[0],edfhdr.admincode);//,n_string81);  
   strcpy(l_technician[0],edfhdr.technician);//,n_string81);  
   strcpy(l_equipment[0],edfhdr.equipment);//,n_string81);  
   strcpy(l_recording_additional[0],edfhdr.recording_additional);//,n_string81);  
 
 l_datarecord_duration[0] = edfhdr.datarecord_duration/10000000;;
 l_datarecords_in_file[0] = edfhdr.datarecords_in_file;
 l_annotations_in_file[0] = edfhdr.annotations_in_file; 
 
 for (i=0;i<n_edfsignals;i++){
   strcpy(l_label[i],edfhdr.signalparam[i].label);
   l_smp_in_file[i]=edfhdr.signalparam[i].smp_in_file;
   l_phys_max[i]=edfhdr.signalparam[i].phys_max;
   l_phys_min[i]=edfhdr.signalparam[i].phys_min;
   l_dig_max[i]=edfhdr.signalparam[i].dig_max;
   l_dig_min[i]=edfhdr.signalparam[i].dig_min;
   l_smp_in_datarecord[i]=edfhdr.signalparam[i].smp_in_datarecord;
   strcpy(l_physdimension[i],edfhdr.signalparam[i].physdimension);
   strcpy(l_prefilter[i],edfhdr.signalparam[i].prefilter);
   strcpy(l_transducer[i],edfhdr.signalparam[i].transducer);
 }

  sciErr = createMList(pvApiCtx,nbInputArgument(pvApiCtx) + 1, m_mlist, &piAddr);
 	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
 sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 1, m_mlist, n_mlist, (char **)FieldNames);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
 
 sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 2, m_var, n_double, l_handle);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 3, m_var, n_double, l_filetype);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
 sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 4, m_var, n_double, l_edfsignals);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
 sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 5, m_var, n_double, l_file_duration);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 6, m_var, n_startdatetime, l_startdatetime);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
  sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 7, m_var, n_var, l_patient);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
  sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 8, m_var, n_var, l_recording);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 9, m_var, n_var, l_patientcode);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 10, m_var, n_var, l_gender);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 11, m_var, n_var, l_birthdate);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 12, m_var, n_var, l_patient_name);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 13, m_var, n_var, l_patient_additional);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 14, m_var, n_var, l_admincode);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
    sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 15, m_var, n_var, l_technician);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 16, m_var, n_var, l_equipment);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 17, m_var, n_var, l_recording_additional);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  	
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 18, m_var, n_double, l_datarecord_duration);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
 sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 19, m_var, n_double, l_datarecords_in_file);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
 sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 20, m_var, n_double, l_annotations_in_file);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}	
    sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 21, m_var, n_edfsignals, l_label);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 22, m_var, n_edfsignals, l_smp_in_file);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}	
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 23, m_var, n_edfsignals, l_phys_max);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}	
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 24, m_var, n_edfsignals, l_phys_min);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}	
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 25, m_var, n_edfsignals, l_dig_max);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}	
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 26, m_var, n_edfsignals, l_dig_min);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}	
  sciErr = createMatrixOfDoubleInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 27, m_var, n_edfsignals, l_smp_in_datarecord);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}	
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 28, m_var, n_edfsignals, l_physdimension);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 29, m_var, n_edfsignals, l_prefilter);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}
   sciErr = createMatrixOfStringInList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, piAddr, 30, m_var, n_edfsignals, l_transducer);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 0;
	}  	  
	
    // The string will be stored in A('var1')
  //strncpy(cstk(l_var1),"a string\0",n_var1);
  
  //m_list_out = m_mlist; n_list_out = 1;
   // now, affect the variable  to the mlist
  // The labels (it corresponds to A = mlist(['mylist','var1','var2'], ...

     
//edfhdf + handle to mlist


//   m_out = 1;  n_out = 1;
// 
//   dOut =  (double*)malloc(sizeof(double) * m_out*n_out);
//  // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
//   dOut[0]=handle;  
//   /* create result on stack */
//   createMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, m_out, n_out, dOut);
//   free(dOut);
  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx)+1; 
  
  /* This function put on scilab stack, the lhs variable
  which are at the position lhs(i) on calling stack */
  /* You need to add PutLhsVar here because WITHOUT_ADD_PUTLHSVAR 
  was defined and equal to %t */
  /* without this, you do not need to add PutLhsVar here */
  ReturnArguments(pvApiCtx);
  
  if (l_handle) free(l_handle);
  if (l_filetype) free(l_filetype);
  if (l_edfsignals) free(l_edfsignals);
  if (l_file_duration) free(l_file_duration);
  if (l_startdatetime) free(l_startdatetime);
  if (l_patient) 
  {
    free(l_patient[0]); 
    free(l_patient);
  }
  if (l_recording) 
  {
    free(l_recording[0]); 
    free(l_recording);
  }
  if (l_patientcode) 
  {
    free(l_patientcode[0]); 
    free(l_patientcode);
  }
  if (l_gender) 
  {
    free(l_gender[0]); 
    free(l_gender);
  }
  if (l_birthdate) 
  {
    free(l_birthdate[0]); 
    free(l_birthdate);
  }
  if (l_patient_name) 
  {
    free(l_patient_name[0]); 
    free(l_patient_name);
  }
  if (l_patient_additional) 
  {
    free(l_patient_additional[0]);
    free(l_patient_additional);
  }
  if (l_admincode) 
  {
    free(l_admincode[0]); 
    free(l_admincode);
  }
  if (l_technician) 
  {
    free(l_technician[0]); 
    free(l_technician);
  }
  if (l_equipment) 
  {
    free(l_equipment[0]); 
    free(l_equipment);
  }
  if (l_recording_additional) 
  {
    free(l_recording_additional[0]); 
    free(l_recording_additional);
  }
  if (l_datarecord_duration) free(l_datarecord_duration);
  if (l_datarecords_in_file) free(l_datarecords_in_file);  
  if (l_annotations_in_file) free(l_annotations_in_file);  
   if (l_label) 
  {
    for (i=0;i<n_edfsignals;i++)
    free(l_label[i]); 
    free(l_label);
  } 
  if (l_smp_in_file) free(l_smp_in_file);
  if (l_phys_max) free(l_phys_max); 
  if (l_phys_min) free(l_phys_min); 
  if (l_dig_max) free(l_dig_max);     
  if (l_dig_min) free(l_dig_min);   
  if (l_smp_in_datarecord) free(l_smp_in_datarecord);   
   if (l_physdimension) 
  {
    for (i=0;i<n_edfsignals;i++)
    free(l_physdimension[i]); 
    free(l_physdimension);
  } 
    if (l_prefilter) 
  {
    for (i=0;i<n_edfsignals;i++)
    free(l_prefilter[i]); 
    free(l_prefilter);
  } 
    if (l_transducer) 
  {
    for (i=0;i<n_edfsignals;i++)
    free(l_transducer[i]); 
    free(l_transducer);
  }  
  

//   
  return 0;
}
/* ==================================================================== */

