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
int sci_edf_get_annotation(char *fname)
{
  SciErr sciErr;
  
  int m1 = 0, n1 = 0;
  int *piAddressVarOne = NULL;
  int* piLenVarOne = NULL;
  char **fileData  = NULL;
  int iType1 = 0;  
  
    int Lm1 = 0, Ln1 = 0;
  int *piAddressVarListOne = NULL;
  double *LpdVarOne = NULL;
  int LiType1 = 0;  
  
      int Lm2 = 0, Ln2 = 0;
  int *piAddressVarListTwo = NULL;
  double *LpdVarTwo = NULL;
  int LiType2 = 0;  
  
  
  int m_out = 0, n_out = 0;
  double *dOut = NULL;
 
  
  char **annData  = NULL;
  char **annData2  = NULL;

  struct edf_hdr_struct edfhdr;
  int handle=0;
  struct edf_annotation_struct annot;
  int i;

  /* --> result = csum(3,8)
  /* check that we have only 2 parameters input */
  /* check that we have only 1 parameters output */
  CheckInputArgument(pvApiCtx,1,1) ;
  CheckOutputArgument(pvApiCtx,3,3) ;   
  
  /* get Address of inputs */
  sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddressVarOne);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }
  
  
  
  /* check input type */
  sciErr = getVarType(pvApiCtx, piAddressVarOne, &iType1);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  } 
   
  if ( iType1 != sci_strings && iType1 != 17 )
  {
    Scierror(999,"%s: Wrong type for input argument #%d: A string or plist is expected (%d).\n",fname,1,iType1);
    return 0;
  }

  if ( iType1 == sci_strings ) {
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




  
  
  /* check size */
  if ( (m1 != 1) && (n1 != 1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,1);
  	return 0;
  }
  
  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);

if ( edfopen_file_readonly(fileData[0], &edfhdr, EDFLIB_READ_ALL_ANNOTATIONS,0 )<0)
{
     Scierror(999,"Could not open %s. filetyp %d\n",  fileData[0],edfhdr.filetype);
    return 0;
}
  m_out = edfhdr.annotations_in_file;  n_out = 1;
  handle = edfhdr.handle;
  
  } else if ( iType1 == 17 ) {
	/* get Address of list */
      sciErr = getListItemAddress(pvApiCtx, piAddressVarOne, 2, &piAddressVarListOne);
      if(sciErr.iErr)
      {
	printError(&sciErr, 0);
	return 0;
      }
	/* check input type */
      sciErr = getVarType(pvApiCtx, piAddressVarListOne, &LiType1);
      if(sciErr.iErr)
      {
	printError(&sciErr, 0);
	return 0;
      } 
        if ( LiType1 != sci_matrix )
      {
	Scierror(999,"%s: Wrong type for input  list #%d: A scalar expected.\n",fname,1);
	return 0;
      }
      sciErr = getMatrixOfDoubleInList(pvApiCtx, piAddressVarOne, 2,&Lm1,&Ln1,&LpdVarOne);
      if(sciErr.iErr)
      {
	printError(&sciErr, 0);
	return 0;
      }
      
      	/* get Address of list */
      sciErr = getListItemAddress(pvApiCtx, piAddressVarOne, 20, &piAddressVarListTwo);
      if(sciErr.iErr)
      {
	printError(&sciErr, 0);
	return 0;
      }
	/* check input type */
      sciErr = getVarType(pvApiCtx, piAddressVarListTwo, &LiType2);
      if(sciErr.iErr)
      {
	printError(&sciErr, 0);
	return 0;
      } 
        if ( LiType2 != sci_matrix )
      {
	Scierror(999,"%s: Wrong type for input  list #%d: A scalar expected.\n",fname,1);
	return 0;
      }
      sciErr = getMatrixOfDoubleInList(pvApiCtx, piAddressVarOne,20,&Lm2,&Ln2,&LpdVarTwo);
      if(sciErr.iErr)
      {
	printError(&sciErr, 0);
	return 0;
      }
//       Scierror(999,"%s: error handle %d, ann %d.\n",fname,LpdVarOne[0], LpdVarTwo[0]);
// 	return 0;
      m_out = (int)LpdVarTwo[0];  n_out = 1;
      handle = (int)LpdVarOne[0];
//       if (m_out==0) {
// 	Scierror(999,"%s: Annotation were not read or no annotation inside the file.\n",fname,1);
// 	return 0;
//       }
	
  }



  dOut =  (double*)malloc(sizeof(double) * m_out*n_out);
  

  annData = (char**)malloc(sizeof(char*) * m_out * n_out);
  for(i = 0 ; i < n_out * m_out ; i++)
  {
       annData[i] = (char*)malloc(sizeof(char) * (EDFLIB_MAX_ANNOTATION_LEN  + 1));//+ 1 for null termination
  }

  annData2 = (char**)malloc(sizeof(char*) * m_out * n_out);
  for(i = 0 ; i < n_out * m_out ; i++)
  {
       annData2[i] = (char*)malloc(sizeof(char) * (16  + 1));//+ 1 for null termination
  }

 // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
// edfread_physical_samples(edfhdr.handle,1,m_out,dOut);

for (i=0;i<m_out;i++){
 edf_get_annotation(handle, i, &annot);
 dOut[i]=annot.onset*0.0000001;
 strcpy(annData2[i],annot.duration);
 strcpy(annData[i],annot.annotation);
}
if ( iType1 == sci_strings )
 edfclose_file(edfhdr.handle);
  
  /* create result on stack */
  createMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, m_out, n_out, dOut);
  free(dOut);
  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1; 
  
 sciErr = createMatrixOfString(pvApiCtx, nbInputArgument(pvApiCtx) + 2, m_out, n_out, annData2);
  if(sciErr.iErr)
  {
	printError(&sciErr, 0);
	return 0;
  }
  free(annData2);
  AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;

  sciErr = createMatrixOfString(pvApiCtx, nbInputArgument(pvApiCtx) + 3, m_out, n_out, annData);
  if(sciErr.iErr)
  {
	printError(&sciErr, 0);
	return 0;
  }
  free(annData);
  AssignOutputVariable(pvApiCtx,3) = nbInputArgument(pvApiCtx) + 3;


  /* This function put on scilab stack, the lhs variable
  which are at the position lhs(i) on calling stack */
  /* You need to add PutLhsVar here because WITHOUT_ADD_PUTLHSVAR 
  was defined and equal to %t */
  /* without this, you do not need to add PutLhsVar here */
  ReturnArguments(pvApiCtx);
  
  return 0;
}
/* ==================================================================== */

