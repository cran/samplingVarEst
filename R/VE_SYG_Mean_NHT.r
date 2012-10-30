VE.SYG.Mean.NHT <- function(VecY.s, VecPk.s, MatPkl.s, N)
{
  if(length(N) != 1 ){stop("Value of N must be a scalar, i.e. a vector of length 1.")                                    }
  if(! is.integer(N)){stop(paste("N must be an integer, i.e. a value from 1 to", as.character(.Machine$integer.max),"."))}
  DoubleN            <- as.double(N)
  VE.SYG.Total.NHT(VecY.s, VecPk.s, MatPkl.s) / (DoubleN * DoubleN)
}
