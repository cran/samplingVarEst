VE.Jk.B.Ratio <- function(VecY.s, VecX.s, VecPk.s)
{
  if(! is.vector(VecY.s)             ){stop("VecY.s must be a vector.")                                       }
  if(! is.vector(VecX.s)             ){stop("VecX.s must be a vector.")                                       }
  if(! is.vector(VecPk.s)            ){stop("VecPk.s must be a vector.")                                      }
  n                                   <- length(VecY.s)
  if(n != length(VecPk.s)            ){stop("The lengths of VecY.s and VecPk.s are different.")               }
  if(n != length(VecX.s)             ){stop("The lengths of VecY.s and VecX.s are different.")                }
  if(anyNA(VecPk.s)                  ){stop("There are missing values in VecPk.s.")                           }
  if(min(VecPk.s)<=0|max(VecPk.s)>1  ){stop("There are invalid values in VecPk.s.")                           }
  if(anyNA(VecY.s)                   ){stop("There are missing values in VecY.s.")                            }
  if(anyNA(VecX.s)                   ){stop("There are missing values in VecX.s.")                            }
  if(any(VecX.s==0)                  ){warning("There are zero values in the denominator variable VecX.s.")   }
  VecEstTheta_k                       <- .C("Est_Ratio_Excluding_All_Elements",
                                             as.double(VecY.s),
                                             as.double(VecX.s), 
                                             as.double(VecPk.s), 
                                             n,
                                             VectVarEst = double(n), 
                                             PACKAGE = "samplingVarEst")$VectVarEst
  EstTheta                            <- Est.Ratio(VecY.s, VecX.s, VecPk.s)
  Nhat                                <- .C("Est_Total_NHT", 
                                             as.double(rep.int(1.0, n)),
                                             as.double(VecPk.s),
                                             n,
                                             PointEst = double(1), 
                                             PACKAGE = "samplingVarEst")$PointEst
  VecPseudo.s                         <- (1 - {1/Nhat/VecPk.s}) * (EstTheta - VecEstTheta_k)
  Doublen                             <- as.double(n)
  OUTPUT                              <- .C("VE_Hajek_form",
                                             VecPseudo.s,
                                             as.double(VecPk.s), 
                                             n,
                                             Doublen,
                                             VarEst = double(1),
                                             PACKAGE = "samplingVarEst")$VarEst
  if(OUTPUT<0                        ){warning("The variance estimate contains negative values.")             }
  OUTPUT
}
