void Est_Total_NHT
(
// Arguments of the function________________
  double  *VecY_s,  //Vector (Size:"n")
  double  *VecPk_s, //Vector (Size:"n")
  int     *n,       //The sample size
  double  *EstTotal //OUTPUT
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     i                         ;
  double  SUM_yi_expanded           ;

//Function__________________________________
  *EstTotal         = ((double)0.0) ; 
  SUM_yi_expanded   = ((double)0.0) ;
  for ( i=0 ; i < *n ; i++ )
  {
    SUM_yi_expanded = SUM_yi_expanded + VecY_s[i]/VecPk_s[i] ;
  } ;
  *EstTotal         = SUM_yi_expanded                        ;
}

