void Pkl_Hajek_U
(
// Arguments of the function________________
  double  *VecPk_U,    //Vector (Size:"N")
  int     *N,          //The population size
  double  *VecMatPkl_U //OUTPUT: Vector-Matrix (Size:["N*N"]) (columns were concatenated with the 2nd order inc. probs. for each pair of elements k & l in the population
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k, l                                     ;
  double  d, pk, pl, qk, ql                        ;

//Function__________________________________
  d                           = ((double)0.0)      ;
  qk                          = ((double)0.0)      ;
  ql                          = ((double)0.0)      ;
  pk                          = ((double)0.0)      ;
  pl                          = ((double)0.0)      ;
  for ( k=0 ; k < *N ; k++ )
  {
    pk                        = VecPk_U[k]         ;
    qk                        = ((double)1.0) - pk ;
    d                         = d    +     qk * pk ;
  } ;

  for ( l=0 ; l < *N ; l++ )                       //Moving through columns
  {
    for ( k=0 ; k < l ; k++ )                      //Moving through rows //Note we are saving some computations
    {
        pk                    = VecPk_U[k]                                 ;
        pl                    = VecPk_U[l]                                 ;
        qk                    = ((double)1.0) - pk                         ;
        ql                    = ((double)1.0) - pl                         ;
        VecMatPkl_U[k+(*N)*l] = pl  * pk * ( ((double)1.0) - ql * qk / d ) ;
        VecMatPkl_U[l+(*N)*k] = VecMatPkl_U[k+(*N)*l]                      ;
    } ;
    VecMatPkl_U[l+(*N)*l]     = VecPk_U[l]                                 ;
  } ;
}

