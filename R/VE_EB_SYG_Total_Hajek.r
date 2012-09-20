VE.EB.SYG.Total.Hajek <- function(VecY.s, VecPk.s, MatPkl.s, N, VecAlpha.s = rep(1, times= length(VecPk.s)))
{
  if(length(N) != 1 ){stop("Value of N must be a scalar, i.e. a vector of length 1.")                                    }
  if(! is.integer(N)){stop(paste("N must be an integer, i.e. a value from 1 to", as.character(.Machine$integer.max),"."))}
  DoubleN            <- as.double(N)
  VE.EB.SYG.Mean.Hajek(VecY.s, VecPk.s, MatPkl.s, VecAlpha.s) * DoubleN * DoubleN
}
