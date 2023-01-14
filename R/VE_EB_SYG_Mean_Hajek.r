VE.EB.SYG.Mean.Hajek <- function(VecY.s, VecPk.s, MatPkl.s, VecAlpha.s = rep.int(1, length(VecPk.s)))
{
  VE.EB.SYG.Ratio(VecY.s, rep.int(1, length(VecY.s)), VecPk.s, MatPkl.s, VecAlpha.s)
}
