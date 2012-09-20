void Pkl_Hajek_s
(
// Arguments of the function________________
  double  *VecPk_s,    //Vector (Size:"n")
  int     *n,          //The sample size
  double  *VecMatPkl_s //OUTPUT: Vector-Matrix (Size:["n*n"]) (columns were concatenated with the 2nd order inc. probs. for each pair of elements k & l in the sample
)

// Body of the function_____________________
{
//Declaration of fixed-size variables_______
  int     k, l                                     ;
  double  dhat, pk, pl, qk, ql                     ;

//Function__________________________________       
  dhat                        = ((double)0.0)      ;
  qk                          = ((double)0.0)      ;
  ql                          = ((double)0.0)      ;
  pk                          = ((double)0.0)      ;
  pl                          = ((double)0.0)      ;
  for ( k=0 ; k < *n ; k++ )
  {
    pk                        = VecPk_s[k]         ;
    qk                        = ((double)1.0) - pk ;
    dhat                      = dhat      +     qk ;
  } ;

  for ( l=0 ; l < *n ; l++ )                       //Moving through columns
  {
    for ( k=0 ; k < l ; k++ )                      //Moving through rows //Note we are saving some computations
    {
        pk                    = VecPk_s[k]                                    ;
        pl                    = VecPk_s[l]                                    ;
        qk                    = ((double)1.0) - pk                            ;
        ql                    = ((double)1.0) - pl                            ;
        VecMatPkl_s[k+(*n)*l] = pl  * pk * ( ((double)1.0) - ql * qk / dhat ) ;
        VecMatPkl_s[l+(*n)*k] = VecMatPkl_s[k+(*n)*l]                         ;
    } ;
    VecMatPkl_s[l+(*n)*l]     = VecPk_s[l]                                    ;
  } ;
}

