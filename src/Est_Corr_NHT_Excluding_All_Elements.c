#include <math.h>
void Est_Corr_NHT_Excluding_All_Elements
(
// Arguments of the function________________
  double  *VecY_s,      //Vector (Size:"n")
  double  *VecX_s,      //Vector (Size:"n")
  double  *VecPk_s,     //Vector (Size:"n")
  int     *n,           //The sample size.
  double  *DoubleN,     //The population size.
  double  *VecEstCorr_k //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i, k                       ;
  double  EstMeanY, EstMeanX         ;
  double  SUMYX, SUMYY, SUMXX        ;
	

//Function__________________________________
  for ( k=0 ; k < *n ; k++ ) 
  {
    EstMeanY         = ((double)0.0) ; 
    EstMeanX         = ((double)0.0) ; 
    for ( i=0 ; i < *n ; i++ )
      if ( i != k )
      {
        EstMeanY     = EstMeanY + VecY_s[i] / VecPk_s[i] ;
        EstMeanX     = EstMeanX + VecX_s[i] / VecPk_s[i] ;
      } ;
    EstMeanY         = EstMeanY / (*DoubleN)             ;
    EstMeanX         = EstMeanX / (*DoubleN)             ;

    VecEstCorr_k[k]  = ((double)0.0)                     ;
    SUMYX            = ((double)0.0)                     ;
    SUMYY            = ((double)0.0)                     ;
    SUMXX            = ((double)0.0)                     ;
    for ( i=0 ; i < *n ; i++ )
      if ( i != k )
      {
        SUMYX        = SUMYX    + (VecY_s[i]-EstMeanY) * (VecX_s[i]-EstMeanX) / VecPk_s[i] ;
        SUMYY        = SUMYY    + (VecY_s[i]-EstMeanY) * (VecY_s[i]-EstMeanY) / VecPk_s[i] ;
        SUMXX        = SUMXX    + (VecX_s[i]-EstMeanX) * (VecX_s[i]-EstMeanX) / VecPk_s[i] ;
      } ;
    VecEstCorr_k[k]  = SUMYX    / sqrt( SUMYY * SUMXX )                                    ;
  } ;
}

