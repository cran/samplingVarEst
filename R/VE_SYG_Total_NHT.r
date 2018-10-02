VE.SYG.Total.NHT <- function(VecY.s, VecPk.s, MatPkl.s)
{
  if(! is.vector(VecY.s)             ){stop("VecY.s must be a vector.")                                                     }
  if(! is.vector(VecPk.s)            ){stop("VecPk.s must be a vector.")                                                    }
  if(! is.matrix(MatPkl.s)           ){stop("MatPkl.s must be a matrix.")                                                   }
  DimMat                              <- dim(MatPkl.s)
  DimMatR                             <- DimMat[1]
  DimMatC                             <- DimMat[2]
  if(DimMatR != DimMatC              ){stop("MatPkl.s must be a square matrix. Number of rows and columns has to be equal.")}
  n                                   <- length(VecY.s)
  if(n != length(VecPk.s)            ){stop("The lengths of VecY.s and VecPk.s are different.")                             }
  if(n != DimMatR                    ){stop("The lengths of VecY.s, VecPk.s and dimensions of MatPkl.s are different.")     }
  if(anyNA(VecPk.s)                  ){stop("There are missing values in VecPk.s.")                                         }
  if(min(VecPk.s)<=0|max(VecPk.s)>1  ){stop("There are invalid values in VecPk.s.")                                         }
  if(anyNA(MatPkl.s)                 ){stop("There are missing values in MatPkl.s.")                                        }
  if(min(MatPkl.s)<=0|max(MatPkl.s)>1){stop("There are invalid values in MatPkl.s.")                                        }
  if(anyNA(VecY.s)                   ){stop("There are missing values in VecY.s.")                                          }
  OUTPUT                              <- .C("VE_SYG_Total_NHT",
                                             as.double(VecY.s),
                                             as.double(VecPk.s),
                                             as.double(c(MatPkl.s)),
                                             n,
                                             VarEst = double(1),
                                             PACKAGE = "samplingVarEst")$VarEst
  if(OUTPUT<0                        ){warning("The variance estimate contains negative values.")                           }
  OUTPUT
}
