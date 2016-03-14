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
int sci_edf_set_technician(char *fname)
{
  SciErr sciErr;
  
  int m1 = 0, n1 = 0;
  int *piAddressVarOne = NULL;
  int* piLenVarOne = NULL;
  double *pdVarOne = NULL;
  int iType1 = 0;  
  
  int m2 = 0, n2 = 0;
  int *piAddressVarTwo = NULL;
  int* piLenVarTwo = NULL;
   char **stringData  = NULL;
  int iType2 = 0;  
  

  int m_out = 0, n_out = 0;
  double *dOut = NULL;

  int i;
  int handle;

  /* --> result = csum(3,8)
  /* check that we have only 2 parameters input */
  /* check that we have only 1 parameters output */
  CheckInputArgument(pvApiCtx,2,2) ;
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
  
  if ( iType2 != sci_strings )
  {
  	Scierror(999,"%s: Wrong type for input argument #%d: A string expected.\n",fname,2);
  	return 0;
  }




  sciErr = getMatrixOfDouble(pvApiCtx, piAddressVarOne,&m1,&n1,&pdVarOne);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }


  
 /* get string */
    sciErr = getMatrixOfString(pvApiCtx, piAddressVarTwo,&m2, &n2, NULL, NULL);
  if(sciErr.iErr)
  {
    printError(&sciErr, 0);
    return 0;
  }

    piLenVarTwo = (int*)malloc(sizeof(int) * m2 * n2);
   sciErr = getMatrixOfString(pvApiCtx, piAddressVarTwo, &m2, &n2, piLenVarTwo, NULL);
                if(sciErr.iErr)
                {
                        printError(&sciErr, 0);
                        return 0;
                }

                stringData = (char**)malloc(sizeof(char*) * m2 * n2);
                for(i = 0 ; i < n2 * m2 ; i++)
                {
                        stringData[i] = (char*)malloc(sizeof(char) * (piLenVarTwo[i] + 1));//+ 1 for null termination
                }

                sciErr = getMatrixOfString(pvApiCtx, piAddressVarTwo, &m2, &n2, piLenVarTwo, stringData);
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
  	Scierror(999,"%s: Wrong size for input argument #%d: A single stringr expected.\n",fname,2);
  	return 0;
  }



  
  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);


if ( edf_set_technician((int)pdVarOne[0],  stringData[0]) <0)
{
     Scierror(999,"Could not write string\n");
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

