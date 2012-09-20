void Est_Mean_Hajek
(
// Arguments of the function________________
  double  *VecY_s,  //Vector (Size:"n")
  double  *VecPk_s, //Vector (Size:"n")
  int     *n,       //The sample size
  double  *EstMean  //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i                                  ;
  double  SUM_yi_expanded, SUM_ones_expanded ;

//Function__________________________________
  *EstMean            = ((double)0.0)        ;
  SUM_yi_expanded     = ((double)0.0)        ;
  SUM_ones_expanded   = ((double)0.0)        ;
  for ( i=0 ; i < *n ; i++ )
  {
    SUM_yi_expanded   = SUM_yi_expanded   + VecY_s[i]     / VecPk_s[i] ;
    SUM_ones_expanded = SUM_ones_expanded + ((double)1.0) / VecPk_s[i] ;
  } ;
  *EstMean            = SUM_yi_expanded   / SUM_ones_expanded          ;
}

