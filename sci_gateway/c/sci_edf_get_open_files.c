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
int sci_edf_get_open_files(char *fname)
{
  SciErr sciErr;

  //int* piChild            = NULL;
  int file_opened=0;
  
   
    int m_out = 0, n_out = 0;
  double *dOut = NULL;
  
      int m_out2 = 0, n_out2 = 0;
  double *dOut2 = NULL;
  int i;
  int handle;
//   int m_list_out, n_list_out;


    
  

  
  /* --> result = csum(3,8)
  /* check that we have only 2 parameters input */
  /* check that we have only 1 parameters output */
  CheckInputArgument(pvApiCtx,0,0) ;
  CheckOutputArgument(pvApiCtx,1,2) ;   
  


  
  /* call c function csum */
//  csum(&pdVarOne[0],&pdVarTwo[0],&dOut);


	file_opened=edflib_get_number_of_open_files();



 // edfclose_file(edfhdr.handle);
  
  /* create result on stack */
//  m_out = 1000;  n_out = 1;


   m_out = 1;  n_out = 1;
// 
   dOut =  (double*)malloc(sizeof(double) * m_out*n_out);
//  // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
   dOut[0]=file_opened;  
//   /* create result on stack */
   createMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, m_out, n_out, dOut);
   free(dOut);
   
  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx)+1; 
  
  if (Lhs>1 && file_opened>0) {
     m_out2 = 1;  n_out2 = file_opened;
// 
   dOut2 =  (double*)malloc(sizeof(double) * m_out2*n_out2);
//  // CreateVar(1, MATRIX_OF_DOUBLE_DATATYPE, &m_out, &n_out, &dout);
   for (i=0;i<file_opened;i++)
    dOut2[i]= edflib_get_handle(i);
//   /* create result on stack */
   createMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 2, m_out2, n_out2, dOut2);
   free(dOut2);
   
  AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx)+2; 
  }
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

