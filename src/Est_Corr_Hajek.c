#include <math.h>
void Est_Corr_Hajek
(
// Arguments of the function________________
  double  *VecY_s,  //Vector (Size:"n")
  double  *VecX_s,  //Vector (Size:"n")
  double  *VecPk_s, //Vector (Size:"n")
  int     *n,       //The sample size
  double  *EstCorr  //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i                        ;
  double  EstMeanY, EstMeanX, EstN ;
  double  SUMYX, SUMYY, SUMXX      ;

//Function__________________________________
  EstMeanY   = ((double)0.0)       ;
  EstMeanX   = ((double)0.0)       ;
  EstN       = ((double)0.0)       ;
  for ( i=0 ; i < *n ; i++ )
  {
    EstMeanY = EstMeanY  + VecY_s[i]     / VecPk_s[i] ;
    EstMeanX = EstMeanX  + VecX_s[i]     / VecPk_s[i] ;
    EstN     = EstN      + ((double)1.0) / VecPk_s[i] ;
  } ;
  EstMeanY   = EstMeanY  / EstN                       ;
  EstMeanX   = EstMeanX  / EstN                       ;

  *EstCorr   = ((double)0.0)                          ;
  SUMYX      = ((double)0.0)                          ;
  SUMYY      = ((double)0.0)                          ;
  SUMXX      = ((double)0.0)                          ;
  for ( i=0 ; i < *n ; i++ )
  {
    SUMYX    = SUMYX     + (VecY_s[i]-EstMeanY) * (VecX_s[i]-EstMeanX) / VecPk_s[i] ;
    SUMYY    = SUMYY     + (VecY_s[i]-EstMeanY) * (VecY_s[i]-EstMeanY) / VecPk_s[i] ;
    SUMXX    = SUMXX     + (VecX_s[i]-EstMeanX) * (VecX_s[i]-EstMeanX) / VecPk_s[i] ;
  } ;
  *EstCorr   = SUMYX     / sqrt( SUMYY * SUMXX )                                    ;
}

