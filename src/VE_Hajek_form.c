void VE_Hajek_form
(
// Arguments of the function________________
  double  *VecPseudo_s, //Vector (Size:"n")
  double  *VecPk_s,     //Vector (Size:"n")
  int     *n,           //The sample size
  double  *Doublen,     //The sample size
  double  *EstVarEst    //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k                                    ;
  double  ak, ck                               ;
  double  BhatNumerator, BhatDenominator, Bhat ;

//Function__________________________________
  *EstVarEst        = ((double)0.0)            ;
  ak                = ((double)0.0)            ;
  ck                = ((double)0.0)            ;
  BhatNumerator     = ((double)0.0)            ;
  BhatDenominator   = ((double)0.0)            ;
  Bhat              = ((double)0.0)            ;

  for ( k=0 ; k < *n ; k++ ) //Computing Bhat
  {
    ak              = *Doublen/(*Doublen-((double)1.0)) * (((double)1.0)-VecPk_s[k])  ;
    BhatNumerator   = BhatNumerator   + ak * VecPseudo_s[k]                           ;
    BhatDenominator = BhatDenominator + ak                                            ;
  } ;
  Bhat              = BhatNumerator / BhatDenominator                                 ;

  for ( k=0 ; k < *n ; k++ )
  {
    ck              = *Doublen/(*Doublen-((double)1.0)) * (((double)1.0)-VecPk_s[k])  ;
    *EstVarEst      = *EstVarEst + ck * (VecPseudo_s[k]-Bhat) * (VecPseudo_s[k]-Bhat) ;
  } ;
}

