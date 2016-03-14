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
int sci_edfopen_file_writeonly(char *fname)
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

  int m_out = 0, n_out = 0;
  double *dOut = NULL;

  int i;
  int handle;

  /* --> result = csum(3,8)
  /* check that we have only 2 parameters input */
  /* check that we have only 1 parameters output */
  CheckInputArgument(pvApiCtx,3,3) ;
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
  
  sciErr = getVarAddressFromPosition(pvApiCtx, 3, &piAddressVarThree);
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

  
  sciErr = getMatrixOfDouble(pvApiCtx, piAddressVarThree,&m3,&n3,&pdVarThree);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
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

  if ( (m3 !=1) || (n3 !=1) )
  {
        Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,2);
        return 0;
  }


  
  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);

if (pdVarTwo[0]==0)
	handle=edfopen_file_writeonly(fileData[0], EDFLIB_FILETYPE_EDFPLUS, pdVarThree[0]);
else
	handle=edfopen_file_writeonly(fileData[0], EDFLIB_FILETYPE_BDFPLUS, pdVarThree[0]);


if ( handle <0)
{
   switch(fileData[0],handle){
    case EDFLIB_NO_SIGNALS:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_NO_SIGNALS\n",  fileData[0],handle); 
      break;
    case EDFLIB_TOO_MANY_SIGNALS:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_TOO_MANY_SIGNALS\n",  fileData[0],handle); 
      break;
      case EDFLIB_NO_SAMPLES_IN_RECORD:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_NO_SAMPLES_IN_RECORD\n",  fileData[0],handle); 
      break;
    case EDFLIB_DIGMIN_IS_DIGMAX:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_DIGMIN_IS_DIGMAX\n",  fileData[0],handle); 
      break;
    case EDFLIB_DIGMAX_LOWER_THAN_DIGMIN:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_DIGMAX_LOWER_THAN_DIGMIN\n",  fileData[0],handle); 
      break;
    case EDFLIB_PHYSMIN_IS_PHYSMAX:
      Scierror(999,"Could not open %s. error: %d - EDFLIB_PHYSMIN_IS_PHYSMAX\n",  fileData[0],handle); 
      break;
    default:
     Scierror(999,"Could not open %s. error: %d\n",  fileData[0],handle); 
  }
    return 0;
}
  

  m_out = 1;  n_out = 1;

  dOut =  (double*)malloc(sizeof(double) * m_out*n_out);
 // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
  dOut[0]=handle;  
  /* create result on stack */
  createMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, m_out, n_out, dOut);
  free(dOut);
  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1; 
  
  /* This function put on scilab stack, the lhs variable
  which are at the position lhs(i) on calling stack */
  /* You need to add PutLhsVar here because WITHOUT_ADD_PUTLHSVAR 
  was defined and equal to %t */
  /* without this, you do not need to add PutLhsVar here */
  ReturnArguments(pvApiCtx);
  
  return 0;
}
/* ==================================================================== */

