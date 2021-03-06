void Est_RegCoI_Hajek_Excluding_All_Elements
(
// Arguments of the function________________
  double  *VecY_s,        //Vector (Size:"n")
  double  *VecX_s,        //Vector (Size:"n")
  double  *VecPk_s,       //Vector (Size:"n")
  int     *n,             //The sample size
  double  *VecEstRegCoI_k //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i, k                       ;
  double  EstMeanY, EstMeanX, EstN   ;
  double  SUMYX, SUMXX               ;

//Function__________________________________
  for ( k=0 ; k < *n ; k++ ) 
  {
    EstMeanY          = ((double)0.0) ;
    EstMeanX          = ((double)0.0) ;
    EstN              = ((double)0.0) ;
    for ( i=0 ; i < *n ; i++ )
      if ( i != k )
      {
        EstMeanY      = EstMeanY + VecY_s[i]     / VecPk_s[i] ;
        EstMeanX      = EstMeanX + VecX_s[i]     / VecPk_s[i] ;
        EstN          = EstN     + ((double)1.0) / VecPk_s[i] ;
      } ;
    EstMeanY          = EstMeanY / EstN                       ;
    EstMeanX          = EstMeanX / EstN                       ;

    VecEstRegCoI_k[k] = ((double)0.0)                         ;
    SUMYX             = ((double)0.0)                         ;
    SUMXX             = ((double)0.0)                         ;
    for ( i=0 ; i < *n ; i++ )
      if ( i != k )
      {
        SUMYX         = SUMYX    + (VecY_s[i]-EstMeanY) * (VecX_s[i]-EstMeanX) / VecPk_s[i] ;
        SUMXX         = SUMXX    + (VecX_s[i]-EstMeanX) * (VecX_s[i]-EstMeanX) / VecPk_s[i] ;
      } ;
    VecEstRegCoI_k[k] = EstMeanY - (SUMYX / SUMXX)      * EstMeanX                          ;
  } ;
} 

