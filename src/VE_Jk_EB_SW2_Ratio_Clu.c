void VE_Jk_EB_SW2_Ratio_Clu
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
	double  SUM_yk_expanded, SUM_xk_expanded ;
  double  SUM_PseudosClu, SUM_SQPseudosClu ;
  double  PseudosCluTemp, EstRatioYX_iTemp ;

//Function__________________________________
  SUM_PseudosClu        = ((double)0.0)    ;
  SUM_SQPseudosClu      = ((double)0.0)    ;
  EstRatioYX_iTemp      = ((double)0.0)    ;
  PseudosCluTemp        = ((double)0.0)    ;
  *Est_d                = ((double)0.0)    ;
  *VarianceClusters     = ((double)0.0)    ;
  for ( i=0 ; i < *nI ; i++ )
  {
    SUM_yk_expanded     = ((double)0.0)    ;
    SUM_xk_expanded     = ((double)0.0)    ;
    for ( k=0 ; k < *n ; k++ )
      if ( VectCLb_s[k] != VectCLb_sI[i] )
      {
        SUM_yk_expanded = SUM_yk_expanded  + VecY_s[k]/VecPk_s[k] ;
        SUM_xk_expanded = SUM_xk_expanded  + VecX_s[k]/VecPk_s[k] ;
      } ;
    EstRatioYX_iTemp    = SUM_yk_expanded  / SUM_xk_expanded      ; //Weights' corrections get canceled.
    PseudosCluTemp      = EstRatioYX_iTemp - (*EstTheta)                                         ;
    SUM_PseudosClu      = SUM_PseudosClu   + VectQIi_sI[i]     * PseudosCluTemp                  ;
    SUM_SQPseudosClu    = SUM_SQPseudosClu + VectQIiSTAR_sI[i] * PseudosCluTemp * PseudosCluTemp ;
    *Est_d              = *Est_d           + VectQIi_sI[i]                                       ;
  } ;
  *VarianceClusters     = (*Doub_nI - ((double)1.0))/(*Doub_nI)*(*Doub_nI - ((double)1.0))/(*Doub_nI) * ( SUM_SQPseudosClu - SUM_PseudosClu * SUM_PseudosClu /(*Est_d) ) ;
}

