void Pk_PropNorm_U
(
// Arguments of the function________________
  int     *n,        //The sample size
  int     *N,        //The population size
  int     *VecInd_U, //Vector (Size:"N")
  double  *VecMOS_U, //Vector (Size:"N")
  double  *VecPk_U   //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k                                      ;
  int     Largest_Pk_Label                       ;
  double  Largest_Pk                             ;
  double  DoubleCurrentn                         ;
  double  DoubleZero                             ;
  double  DoubleOne                              ;
  double  Sum_MOS                                ;

//Function__________________________________
  DoubleCurrentn                 = ((double)*n)  ;
  DoubleZero                     = ((double)0.0) ;
  DoubleOne                      = ((double)1.0) ;
  Sum_MOS                        = DoubleZero    ;
  for ( k = 0 ; k < *N ; k++ )
  {
    Sum_MOS                      = Sum_MOS        + VecMOS_U[k]                ;
    VecInd_U[k]                  = 0                                           ;
  } ;
  Largest_Pk_Label               = 0                                           ;
  Largest_Pk                     = ((double)2.0)                               ;
  for ( ; Largest_Pk > DoubleOne ; )
  {
    Largest_Pk                   = DoubleZero                                  ;
    for ( k = 0 ; k < *N ; k++ )
      if ( VecInd_U[k] != 1 )
      {
        VecPk_U[k]               = DoubleCurrentn * VecMOS_U[k] / Sum_MOS      ;
        if ( VecPk_U[k] > Largest_Pk )
        {
          Largest_Pk_Label       = k                                           ;
          Largest_Pk             = VecPk_U[Largest_Pk_Label]                   ;
	} ;
      } ;
    if ( Largest_Pk > DoubleOne )
    {
      VecPk_U[Largest_Pk_Label]  = DoubleOne                                   ;
      VecInd_U[Largest_Pk_Label] = 1                                           ;
      Sum_MOS                    = Sum_MOS        - VecMOS_U[Largest_Pk_Label] ;
      DoubleCurrentn             = DoubleCurrentn - DoubleOne                  ;
    } ;
  } ;
}

