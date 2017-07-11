void Est_Ratio_Excluding_All_ElementsByRho
(
// Arguments of the function________________
  double  *VecY_s,         //Vector (Size:"n")
  double  *VecX_s,         //Vector (Size:"n")
  double  *VecPk_s,        //Vector (Size:"n")
  double  *VecRhok_s,      //Vector (Size:"n")
  int     *n,              //The sample size
  double  *VecEstRatioYX_k //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k                                ;
  double  EstTotY, EstTotX                 ;

//Function__________________________________
  EstTotY              = ((double)0.0)     ;
  EstTotX              = ((double)0.0)     ;
  for ( k=0 ; k < *n ; k++ )
  {
    VecEstRatioYX_k[k] = ((double)0.0)     ;
    EstTotY            = EstTotY + VecY_s[k] / VecPk_s[k] ;
    EstTotX            = EstTotX + VecX_s[k] / VecPk_s[k] ;
  } ;
  for ( k=0 ; k < *n ; k++ )
  {
    VecEstRatioYX_k[k] = (EstTotY - VecRhok_s[k] * VecY_s[k]) / (EstTotX - VecRhok_s[k] * VecX_s[k]) ;
  } ;
}

