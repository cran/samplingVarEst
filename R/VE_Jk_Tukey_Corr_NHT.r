VE.Jk.Tukey.Corr.NHT <- function(VecY.s, VecX.s, VecPk.s, N, FPC= TRUE)
{
  if(! is.vector(VecY.s)              ){stop("VecY.s must be a vector.")                                                                   }
  if(! is.vector(VecX.s)              ){stop("VecX.s must be a vector.")                                                                   }
  if(! is.vector(VecPk.s)             ){stop("VecPk.s must be a vector.")                                                                  }
  if(anyNA(VecPk.s)                   ){stop("There are missing values in VecPk.s.")                                                       }
  if(min(VecPk.s)<=0|max(VecPk.s)>1   ){stop("There are invalid values in VecPk.s.")                                                       }
  if(anyNA(VecY.s)                    ){stop("There are missing values in VecY.s.")                                                        }
  if(anyNA(VecX.s)                    ){stop("There are missing values in VecX.s.")                                                        }
  if((length(N) != 1) & FPC           ){stop("Value of N must be a scalar, i.e. a vector of length 1.")                                    }
  if((N%%1      != 0) & FPC           ){stop("N must be an integer or a double-precision scalar with zero-valued fractional part.")        }
  n                                    <- length(VecY.s)
  if(n != length(VecPk.s)             ){stop("The lengths of VecY.s and VecPk.s are different.")                                           }
  if(n != length(VecX.s)              ){stop("The lengths of VecY.s and VecX.s are different.")                                            }
  if(length(VecPk.s) != length(VecX.s)){stop("The lengths of VecPk.s and VecX.s are different.")                                           }
  DoubleN                              <- as.double(N)
  Doublen                              <- as.double(n)
  VecEstTheta_k                        <- .C("Est_Corr_NHT_Excluding_All_Elements",
                                              as.double(VecY.s),
                                              as.double(VecX.s),
                                              as.double(VecPk.s),
                                              n,
                                              DoubleN,
                                              VectVarEst = double(n),
                                              PACKAGE = "samplingVarEst")$VectVarEst
  EstTheta                             <- Est.Corr.NHT(VecY.s, VecX.s, VecPk.s, N)
  OUTPUT                               <- (Doublen-1/Doublen) * sum( (EstTheta - VecEstTheta_k) * (EstTheta - VecEstTheta_k) )
  if(FPC                              ){OUTPUT <- (1-Doublen/DoubleN) * OUTPUT                                                             }
  if(OUTPUT<0                         ){warning("The variance estimate contains negative values.")                                         }
  OUTPUT
}
