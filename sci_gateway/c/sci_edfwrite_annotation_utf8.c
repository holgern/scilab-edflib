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
int sci_edfwrite_annotation_utf8(char *fname)
{
  SciErr sciErr;
  
  int m1 = 0, n1 = 0;
  int *piAddressVarOne = NULL;
  int* piLenVarOne = NULL;
  double *pdVarOne = NULL;
  int iType1 = 0;  
  
  int m2 = 0, n2 = 0;
  int *piAddressVarTwo = NULL;
  double *pdVarTwo = NULL;
  int iType2 = 0;  

  int m3 = 0, n3 = 0;
  int *piAddressVarThree = NULL;
  double *pdVarThree = NULL;
  int iType3 = 0;  
  
  int m4 = 0, n4 = 0;
  int *piAddressVarFour = NULL;
  int* piLenVarFour = NULL;
   char **stringData  = NULL;
  int iType4 = 0;

  int m_out = 0, n_out = 0;
  double *dOut = NULL;

  int i;
  int handle;
  long long onset=0;
  long long duration=0;
  /* --> result = csum(3,8)
  /* check that we have only 2 parameters input */
  /* check that we have only 1 parameters output */
  CheckInputArgument(pvApiCtx,4,4) ;
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
    sciErr = getVarAddressFromPosition(pvApiCtx, 4, &piAddressVarFour);
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
   
  if ( iType1 != sci_matrix )
  {
    Scierror(999,"%s: Wrong type for input argument #%d: A integer expected.\n",fname,1);
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


  sciErr = getVarType(pvApiCtx, piAddressVarFour, &iType4);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }

  if ( iType4 != sci_strings )
  {
        Scierror(999,"%s: Wrong type for input argument #%d: A string expected.\n",fname,4);
        return 0;
  }


  sciErr = getMatrixOfDouble(pvApiCtx, piAddressVarOne,&m1,&n1,&pdVarOne);
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

 /* get string */
    sciErr = getMatrixOfString(pvApiCtx, piAddressVarFour,&m4, &n4, NULL, NULL);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }

    piLenVarFour = (int*)malloc(sizeof(int) * m4 * n4);
   sciErr = getMatrixOfString(pvApiCtx, piAddressVarFour, &m4, &n4, piLenVarFour, NULL);
                if(sciErr.iErr)
                {
                        printError(&sciErr, 0);
                        return 0;
                }

                stringData = (char**)malloc(sizeof(char*) * m4 * n4);
                for(i = 0 ; i < n4 * m4 ; i++)
                {
                        stringData[i] = (char*)malloc(sizeof(char) * (piLenVarFour[i] + 1));//+ 1 for null termination
                }

                sciErr = getMatrixOfString(pvApiCtx, piAddressVarFour, &m4, &n4, piLenVarFour, stringData);
                if(sciErr.iErr)
                {
                        printError(&sciErr, 0);
                        return 0;
                }




  
  /* check size */
  if ( (m1 != 1) || (n1 != 1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,1);
  	return 0;
  }
  if ( (m2 !=1) || (n2 !=1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,2);
  	return 0;
  }
  if ( (m3 !=1) || (n3 !=1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,3);
  	return 0;
  }
  if ( (m4 !=1) || (n4 !=1) )
  {
        Scierror(999,"%s: Wrong size for input argument #%d: A single string expected.\n",fname,4);
        return 0;
  }

  onset = pdVarTwo[0]*10000;
  duration = pdVarThree[0]*10000;
  
  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);

//edfwrite_annotation_utf8(int handle, long long onset, long long duration, const char *description);
  if ( edfwrite_annotation_utf8((int)pdVarOne[0], onset , duration, stringData[0]) <0)
{
     Scierror(999,"Could not write annotation\n");
    return 0;
}
  

  m_out = 1;  n_out = 1;

  dOut =  (double*)malloc(sizeof(double) * m_out*n_out);
 // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
  dOut[0]=0;  
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

