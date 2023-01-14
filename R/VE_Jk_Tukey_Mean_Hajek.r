VE.Jk.Tukey.Mean.Hajek <- function(VecY.s, VecPk.s, N, FPC= TRUE)
{
  VE.Jk.Tukey.Ratio(VecY.s, rep.int(1, length(VecY.s)), VecPk.s, N, FPC)
}
