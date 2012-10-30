void Pk_PropNorm_U
(
// Arguments of the function________________
  int     *n,        //The sample size
  int     *N,        //The population size
  double  *VecMOS_U, //Vector (Size:"N")
  double  *VecPk_U   //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k                                     ;
  int     Largest_Pk_Label                      ;
  double  Largest_Pk                            ;
  double  DoubleCurrentn                        ;
  double  Sum_MOS                               ;

//Function__________________________________
  DoubleCurrentn                = ((double)*n)  ;
  Sum_MOS                       = ((double)0.0) ;
  for ( k = 0 ; k < *N ; k++ )
    Sum_MOS                     = Sum_MOS        + VecMOS_U[k]                ;
  Largest_Pk_Label              = ((int)0)                                    ;
  Largest_Pk                    = ((double)2.0)                               ;
  for ( ; Largest_Pk > ((double)1.0) ; )
  {
    Largest_Pk                  = ((double)0.0)                               ;
    for ( k = 0 ; k < *N ; k++ )
      if ( VecPk_U[k] != ((double)1.0) )
      {
        VecPk_U[k]              = DoubleCurrentn * VecMOS_U[k] / Sum_MOS      ;
        if ( VecPk_U[k] > Largest_Pk )
        {
          Largest_Pk_Label      = k                                           ;
          Largest_Pk            = VecPk_U[Largest_Pk_Label]                   ;
				} ;
			} ;
		if ( Largest_Pk > ((double)1.0) )
		{
      VecPk_U[Largest_Pk_Label] = ((double)1.0)                               ;
      Sum_MOS                   = Sum_MOS        - VecMOS_U[Largest_Pk_Label] ;
      DoubleCurrentn            = DoubleCurrentn - ((double)1.0)              ;
		} ;
	} ;
}

