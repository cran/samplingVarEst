void Est_Ratio_Excluding_All_Elements
(
// Arguments of the function________________
  double  *VecY_s,         //Vector (Size:"n")
  double  *VecX_s,         //Vector (Size:"n")
  double  *VecPk_s,        //Vector (Size:"n")
  int     *n,              //The sample size
  double  *VecEstRatioYX_k //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i, k                             ;
  double  SUM_yi_expanded, SUM_xi_expanded ;

//Function__________________________________
  for ( k=0 ; k < *n ; k++ ) 
  {
    VecEstRatioYX_k[k]  = ((double)0.0)    ; 
    SUM_yi_expanded     = ((double)0.0)    ; 
    SUM_xi_expanded     = ((double)0.0)    ;
    for ( i=0 ; i < *n ; i++ )
      if ( i != k )
      {
        SUM_yi_expanded = SUM_yi_expanded + VecY_s[i] / VecPk_s[i] ;
        SUM_xi_expanded = SUM_xi_expanded + VecX_s[i] / VecPk_s[i] ;
      } ;
    VecEstRatioYX_k[k]  = SUM_yi_expanded / SUM_xi_expanded        ;
  } ;
}

