void VE_Hajek_Total_NHT
(
// Arguments of the function________________
  double  *VecY_s,      //Vector (Size:"n")
  double  *VecPk_s,     //Vector (Size:"n")
  int     *n,           //The sample size
  double  *Doublen,     //The sample size
  double  *EstVarEst_ty //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k                                    ;
  double  yk_expanded, ak, ck                  ;
  double  BhatNumerator, BhatDenominator, Bhat ;

//Function__________________________________
  *EstVarEst_ty     = ((double)0.0)            ;
  yk_expanded       = ((double)0.0)            ;
  ak                = ((double)0.0)            ;
  ck                = ((double)0.0)            ;
  BhatNumerator     = ((double)0.0)            ;
  BhatDenominator   = ((double)0.0)            ;
  Bhat              = ((double)0.0)            ;

  for ( k=0 ; k < *n ; k++ ) //Computing Bhat
  {
    yk_expanded     = VecY_s[k]       / VecPk_s[k]                                   ;
    ak              = *Doublen/(*Doublen-((double)1.0)) * (((double)1.0)-VecPk_s[k]) ;
    BhatNumerator   = BhatNumerator   + ak * yk_expanded                             ;
    BhatDenominator = BhatDenominator + ak                                           ;
  } ;
  Bhat              = BhatNumerator   / BhatDenominator                              ;

  for ( k=0 ; k < *n ; k++ )
  {
    yk_expanded     = VecY_s[k]       / VecPk_s[k]                                   ;
    ck              = *Doublen/(*Doublen-((double)1.0)) * (((double)1.0)-VecPk_s[k]) ;
    *EstVarEst_ty   = *EstVarEst_ty + ck * (yk_expanded-Bhat) * (yk_expanded-Bhat)   ;
  } ;
}

