VE.Jk.B.Total.Hajek <- function(VecY.s, VecPk.s, N)
{
  if(length(N) != 1 ){stop("Value of N must be a scalar, i.e. a vector of length 1.")                                    }
  if(N%%1 != 0      ){stop("N must be an integer or a double-precision scalar with zero-valued fractional part.")        }
  DoubleN            <- as.double(N)
  VE.Jk.B.Mean.Hajek(VecY.s, VecPk.s) * DoubleN * DoubleN
}
