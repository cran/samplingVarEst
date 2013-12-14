void VE_Jk_EB_SW2_RegCo_Hajek_Clu
(
// Arguments of the function________________
	double  *EstTheta,        //The point estimator whose variance is to be estimated
	double  *VecY_s,          //Vector (Size:"n")
	double  *VecX_s,          //Vector (Size:"n")
	double  *VecPk_s,         //Vector (Size:"n")
	int     *n,               //The total sample size
	int     *nI,              //The first stage sample size (number of clusters in sample)
	double  *Doub_nI,         //The first stage sample size (number of clusters in sample)
	int     *VectCLb_s,       //Vector (Size:"n") clusters' labels; NUMERIC and non-necessarily consecutive
	int     *VectCLb_sI,      //Vector (Size:"nI") clusters' labels; NUMERIC and non-necessarily consecutive
	double  *VectQIi_sI,      //Vector (Size:"nI")
	double  *VectQIiSTAR_sI,  //Vector (Size:"nI")
	double  *Est_d,           //Estimator of Hajek's d
	double  *VarianceClusters //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i,k                              ;
  double  EstMeanY, EstMeanX, EstN         ;
  double  SUMYX, SUMXX                     ;
  double  SUM_PseudosClu, SUM_SQPseudosClu ;
  double  PseudosCluTemp, EstRegCoYX_iTemp ;

//Function__________________________________
  SUM_PseudosClu        = ((double)0.0)    ;
  SUM_SQPseudosClu      = ((double)0.0)    ;
  EstRegCoYX_iTemp      = ((double)0.0)    ;
  PseudosCluTemp        = ((double)0.0)    ;
  *Est_d                = ((double)0.0)    ;
  *VarianceClusters     = ((double)0.0)    ;
  for ( i=0 ; i < *nI ; i++ )
  {
    EstMeanY            = ((double)0.0)    ;
    EstMeanX            = ((double)0.0)    ;
    EstN                = ((double)0.0)    ;
    for ( k=0 ; k < *n ; k++ )
      if ( VectCLb_s[k] != VectCLb_sI[i] )
      {
        EstMeanY        = EstMeanY         + VecY_s[k]     / VecPk_s[k] ;
        EstMeanX        = EstMeanX         + VecX_s[k]     / VecPk_s[k] ;
        EstN            = EstN             + ((double)1.0) / VecPk_s[k] ;
      } ;
    EstMeanY            = EstMeanY / EstN                               ;
    EstMeanX            = EstMeanX / EstN                               ;

    SUMYX               = ((double)0.0)                                 ;
    SUMXX               = ((double)0.0)                                 ;
    for ( k=0 ; k < *n ; k++ )
      if ( VectCLb_s[k] != VectCLb_sI[i] )
      {
        SUMYX           = SUMYX            + (VecY_s[k]-EstMeanY) * (VecX_s[k]-EstMeanX) / VecPk_s[k] ;
        SUMXX           = SUMXX            + (VecX_s[k]-EstMeanX) * (VecX_s[k]-EstMeanX) / VecPk_s[k] ;
      } ;
    EstRegCoYX_iTemp    = SUMYX            / SUMXX                                                    ; //Weights' corrections get canceled.
    PseudosCluTemp      = EstRegCoYX_iTemp - (*EstTheta)                                              ;
    SUM_PseudosClu      = SUM_PseudosClu   + VectQIi_sI[i]     * PseudosCluTemp                       ;
    SUM_SQPseudosClu    = SUM_SQPseudosClu + VectQIiSTAR_sI[i] * PseudosCluTemp * PseudosCluTemp      ;
    *Est_d              = *Est_d           + VectQIi_sI[i]                                            ;
  } ;
  *VarianceClusters     = (*Doub_nI - ((double)1.0))/(*Doub_nI)*(*Doub_nI - ((double)1.0))/(*Doub_nI) * ( SUM_SQPseudosClu - SUM_PseudosClu * SUM_PseudosClu /(*Est_d) ) ;
}

