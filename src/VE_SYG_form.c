void VE_SYG_form
(
// Arguments of the function________________
  double  *VecPseudo_s, //Vector (Size:"n")
  double  *VecPk_s,     //Vector (Size:"n")
  double  *VecMatPkl_s, //Columns Vector-Matrix (Size:["n*n"]) (columns were concatenated with the 2nd order inc. probs. for each pair of elements k & l in the sample
  int     *n,           //The sample size
  double  *EstVarEst    //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k, l                   ;

//Function__________________________________
  *EstVarEst     = ((double)0.0) ;
  for ( l=0 ; l < *n ; l++ )
    for ( k=0 ; k < l ; k++ )
    {
      *EstVarEst = *EstVarEst + (VecPk_s[k]*VecPk_s[l]/VecMatPkl_s[k+(*n)*l]-((double)1.0)) * (VecPseudo_s[k]-VecPseudo_s[l]) * (VecPseudo_s[k]-VecPseudo_s[l]) ;
    } ;
}

