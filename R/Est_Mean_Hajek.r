Est.Mean.Hajek <- function(VecY.s, VecPk.s)
{
  if(! is.vector(VecY.s)             ){stop("VecY.s must be a vector.")                        }
  if(! is.vector(VecPk.s)            ){stop("VecPk.s must be a vector.")                       }
  if(anyNA(VecPk.s)                  ){stop("There are missing values in VecPk.s.")            }
  if(any(VecPk.s<=0|VecPk.s>1)       ){stop("There are invalid values in VecPk.s.")            }
  if(anyNA(VecY.s)                   ){stop("There are missing values in VecY.s.")             }
  n                                   <- length(VecY.s)
  if(n != length(VecPk.s)            ){stop("The lengths of VecY.s and VecPk.s are different.")}
  .C("Est_Mean_Hajek", 
      as.double(VecY.s), 
      as.double(VecPk.s),
      n, 
      PointEst = double(1), 
      PACKAGE = "samplingVarEst")$PointEst
}
