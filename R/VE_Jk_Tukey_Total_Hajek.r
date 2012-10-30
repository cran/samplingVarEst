VE.Jk.Tukey.Total.Hajek <- function(VecY.s, VecPk.s, N)
{
  DoubleN <- as.double(N)
  VE.Jk.Tukey.Mean.Hajek(VecY.s, VecPk.s, N) * DoubleN * DoubleN
}
