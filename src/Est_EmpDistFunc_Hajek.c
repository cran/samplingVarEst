void Est_EmpDistFunc_Hajek
(
// Arguments of the function________________
  double  *VecY_s,        //Vector (Size:"n")
  double  *VecPk_s,       //Vector (Size:"n")
  int     *n,             //The sample size
  double  *t,             //The input to be evaluated in the empirical distribution function
  double  *EstEmpDistFunc //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i                                            ;
  double  SUM_Indicator_yi_expanded, SUM_ones_expanded ;
  double  Indicator_yi                                 ;

//Function__________________________________
  *EstEmpDistFunc             = ((double)0.0) ;
  SUM_Indicator_yi_expanded   = ((double)0.0) ;
  SUM_ones_expanded           = ((double)0.0) ;
  for ( i=0 ; i < *n ; i++ )
  {
    Indicator_yi              = ((double)0.0) ;
    if ( VecY_s[i] <= *t )
    {
      Indicator_yi            = ((double)1.0) ;
    } ;
    SUM_Indicator_yi_expanded = SUM_Indicator_yi_expanded + Indicator_yi  / VecPk_s[i] ;
    SUM_ones_expanded         = SUM_ones_expanded         + ((double)1.0) / VecPk_s[i] ;
  } ;
  *EstEmpDistFunc             = SUM_Indicator_yi_expanded / SUM_ones_expanded          ;
}

