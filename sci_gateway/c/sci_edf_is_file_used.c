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
int sci_edf_is_file_used(char *fname)
{
  SciErr sciErr;
  int m1 = 0, n1 = 0;
  int *piAddressVarOne = NULL;
  int* piLenVarOne = NULL;
  char **fileData  = NULL;
  int iType1 = 0;  

  
  int *piAddr             = NULL;
  //int* piChild            = NULL;
  int file_used=0;
  
   
    int m_out = 0, n_out = 0;
  double *dOut = NULL;
  int i;
  int handle;
//   int m_list_out, n_list_out;
   int m_var, n_double, n_string81,n_string17, n_string16, n_string9;
   double      *l_handle = NULL;//,  l_list_handle;
   double      *l_filetype = NULL;//,  l_list_filetype; 
    double      *l_edfsignals = NULL;//,  l_list_edfsignals;
  double      *l_file_duration = NULL;//,,  l_list_file_duration;

     
  
  m_var  = 1; 
  n_double  = 1; 
  n_string81  = 81; n_string16=16; n_string9=9; n_string17=17;
  

  
  /* --> result = csum(3,8)
  /* check that we have only 2 parameters input */
  /* check that we have only 1 parameters output */
  CheckInputArgument(pvApiCtx,1,1) ;
  CheckOutputArgument(pvApiCtx,1,1) ;   
  
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
   
  if ( iType1 != sci_strings )
  {
    Scierror(999,"%s: Wrong type for input argument #%d: A string expected.\n",fname,1);
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




  

  
  /* check size */
  if ( (m1 != 1) || (n1 != 1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: One String expected.\n",fname,1);
  	return 0;
  }
 


  
  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);


	file_used=edflib_is_file_used(fileData[0]);



 // edfclose_file(edfhdr.handle);
  
  /* create result on stack */
//  m_out = 1000;  n_out = 1;
  createMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, m_out, n_out, dOut);
  free(dOut);
  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1; 

   m_out = 1;  n_out = 1;
// 
   dOut =  (double*)malloc(sizeof(double) * m_out*n_out);
//  // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
   dOut[0]=file_used;  
//   /* create result on stack */
   createMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, m_out, n_out, dOut);
   free(dOut);
   
  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx)+1; 
  
  /* This function put on scilab stack, the lhs variable
  which are at the position lhs(i) on calling stack */
  /* You need to add PutLhsVar here because WITHOUT_ADD_PUTLHSVAR 
  was defined and equal to %t */
  /* without this, you do not need to add PutLhsVar here */
  ReturnArguments(pvApiCtx);
  

//   
  return 0;
}
/* ==================================================================== */

