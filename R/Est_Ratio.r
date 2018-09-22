Est.Ratio <- function(VecY.s, VecX.s, VecPk.s)
{
  if(! is.vector(VecY.s)              ){stop("VecY.s must be a vector.")                                       }
  if(! is.vector(VecX.s)              ){stop("VecX.s must be a vector.")                                       }
  if(! is.vector(VecPk.s)             ){stop("VecPk.s must be a vector.")                                      }
  if(anyNA(VecPk.s)                   ){stop("There are missing values in VecPk.s.")                           }
  if(any(VecPk.s<=0|VecPk.s>1)        ){stop("There are invalid values in VecPk.s.")                           }
  if(anyNA(VecY.s)                    ){stop("There are missing values in VecY.s.")                            }
  if(anyNA(VecX.s)                    ){stop("There are missing values in VecX.s.")                            }
  n                                    <- length(VecY.s)
  if(n != length(VecPk.s)             ){stop("The lengths of VecY.s and VecPk.s are different.")               }
  if(n != length(VecX.s)              ){stop("The lengths of VecY.s and VecX.s are different.")                }
  if(length(VecPk.s) != length(VecX.s)){stop("The lengths of VecPk.s and VecX.s are different.")               }
  if(any(VecX.s==0)                   ){warning("There are zero values in the denominator variable VecX.s.")   }
  .C("Est_Ratio",
      as.double(VecY.s),
      as.double(VecX.s), 
      as.double(VecPk.s), 
      n, 
      PointEst = double(1), 
      PACKAGE = "samplingVarEst")$PointEst
}
