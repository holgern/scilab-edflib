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
int sci_edfrewind(char *fname)
{
  SciErr sciErr;
  
  int m1 = 0, n1 = 0;
  int *piAddressVarOne = NULL;
  //int* piLenVarOne = NULL;
  //char **fileData  = NULL;
  double *pdVarOne = NULL;
  int iType1 = 0;  
  
  int m2 = 0, n2 = 0;
  int *piAddressVarTwo = NULL;
  double *pdVarTwo = NULL;
  int iType2 = 0;  
  

  
 

  int i; 

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
  
  if ( iType2 != sci_matrix )
  {
  	Scierror(999,"%s: Wrong type for input argument #%d: A double expected.\n",fname,2);
  	return 0;
  }
  

  

//   /* get string */
//     sciErr = getMatrixOfString(pvApiCtx, piAddressVarOne,&m1, &n1, NULL, NULL);
//   //sciErr = getMatrixOfDouble(pvApiCtx, piAddressVarOne,&m1,&n1,&pdVarOne);
//   if(sciErr.iErr)
//   {
//     printError(&sciErr, 0);
//     return 0;
//   }
// 
// 
//     piLenVarOne = (int*)malloc(sizeof(int) * m1 * n1);
//    sciErr = getMatrixOfString(pvApiCtx, piAddressVarOne, &m1, &n1, piLenVarOne, NULL);
// 		if(sciErr.iErr)
// 		{
// 			printError(&sciErr, 0);
// 			return 0;
// 		}
// 
// 		fileData = (char**)malloc(sizeof(char*) * m1 * n1);
// 		for(i = 0 ; i < n1 * m1 ; i++)
// 		{
// 			fileData[i] = (char*)malloc(sizeof(char) * (piLenVarOne[i] + 1));//+ 1 for null termination
// 		}
// 
// 		sciErr = getMatrixOfString(pvApiCtx, piAddressVarOne, &m1, &n1, piLenVarOne, fileData);
// 		if(sciErr.iErr)
// 		{
// 			printError(&sciErr, 0);
// 			return 0;
// 		}



    /* get double */

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
  

  
  /* check size */
  if ( (m1 != 1) || (n1 != 1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: One scalar expected.\n",fname,1);
  	return 0;
  }
  if ( (m2 !=1) || (n2 !=1) ) 
  {
  	Scierror(999,"%s: Wrong size for input argument #%d: A scalar expected.\n",fname,2);
  	return 0;
  }

  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);

// if ( edfopen_file_readonly((int)pdVarTwo[0], &edfhdr, EDFLIB_DO_NOT_READ_ANNOTATIONS )<0)
// {
//      Scierror(999,"Could not open file %s. filetyp %d\n",  fileData[0],edfhdr.filetype);
//     return 0;
// }
//   
//   if (pdVarTwo[0]>=edfhdr.edfsignals){
// 	Scierror(999,"Only %d signals are available in this file.\n",edfhdr.edfsignals);
//          edfclose_file(edfhdr.handle);
//          return 0; 
// 
//   }

  if (pdVarTwo[0]<1){
    //m_out=edfhdr.signalparam[(int)pdVarTwo[0]].smp_in_file;
     Scierror(999,"the edfsignal must be greater then 0.\n");
         return 0; 
    //printf("m_out %d",m_out);
  }



  
//    if (m_out>edfhdr.signalparam[(int)pdVarTwo[0]].smp_in_file){
//	Scierror(999,"Only %d values are available in this signal.\n",edfhdr.signalparam[(int)pdVarTwo[0]].smp_in_file);
         //edfclose_file(edfhdr.handle);
//         return 0; 
//  }

  //m_out = edfhdr.signalparam[(int)pdVarTwo[0]].smp_in_file;  n_out = 1;
  //m_out = pdVarThree[0];  n_out = 1;
  
 
 // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
edfrewind((int)pdVarOne[0],(int)pdVarTwo[0]-1);


 // edfclose_file(edfhdr.handle);
  
  /* create result on stack */
//  m_out = 1000;  n_out = 1;
 
  
  /* This function put on scilab stack, the lhs variable
  which are at the position lhs(i) on calling stack */
  /* You need to add PutLhsVar here because WITHOUT_ADD_PUTLHSVAR 
  was defined and equal to %t */
  /* without this, you do not need to add PutLhsVar here */
  ReturnArguments(pvApiCtx);
  
  return 0;
}
/* ==================================================================== */

