void VE_HT_Total_NHT
(
// Arguments of the function________________
  double  *VecY_s,      //Vector (Size:"n")
  double  *VecPk_s,     //Vector (Size:"n")
  double  *VecMatPkl_s, //Columns Vector-Matrix (Size:["n*n"]) (columns were concatenated with the 2nd order inc. probs. for each pair of elements k & l in the sample
  int     *n,           //The sample size
  double  *EstVarEst_ty //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k, l                      ;
  double  yk_expanded, yl_expanded  ;

//Function__________________________________
  *EstVarEst_ty     = ((double)0.0) ; 
  yk_expanded       = ((double)0.0) ; 
  yl_expanded       = ((double)0.0) ;
  for ( l=0 ; l < *n ; l++ )
    for ( k=0 ; k < *n ; k++ )
    {
      yk_expanded   = VecY_s[k] / VecPk_s[k]                                                                                  ;
      yl_expanded   = VecY_s[l] / VecPk_s[l]                                                                                  ;
      *EstVarEst_ty = *EstVarEst_ty + (((double)1.0)-VecPk_s[k]*VecPk_s[l]/VecMatPkl_s[k+(*n)*l]) * yk_expanded * yl_expanded ;
    } ;
} 

