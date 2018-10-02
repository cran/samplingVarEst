VE.Hajek.Total.NHT <- function(VecY.s, VecPk.s)
{
  if(! is.vector(VecY.s)             ){stop("VecY.s must be a vector.")                          }
  if(! is.vector(VecPk.s)            ){stop("VecPk.s must be a vector.")                         }
  n                                   <- length(VecY.s)
  if(n != length(VecPk.s)            ){stop("The lengths of VecY.s and VecPk.s are different.")  }
  if(anyNA(VecPk.s)                  ){stop("There are missing values in VecPk.s.")              }
  if(min(VecPk.s)<=0|max(VecPk.s)>1  ){stop("There are invalid values in VecPk.s.")              }
  if(anyNA(VecY.s)                   ){stop("There are missing values in VecY.s.")               }
  Doublen                             <- as.double(n)
  OUTPUT                              <- .C("VE_Hajek_Total_NHT",
                                             as.double(VecY.s), 
                                             as.double(VecPk.s), 
                                             n,
                                             Doublen,
                                             VarEst = double(1),
                                             PACKAGE = "samplingVarEst")$VarEst
  if(OUTPUT<0                        ){warning("The variance estimate contains negative values.")}
  OUTPUT
}
