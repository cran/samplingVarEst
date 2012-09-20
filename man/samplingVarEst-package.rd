\name{samplingVarEst-package}
\alias{samplingVarEst-package}
\alias{samplingVarEst}
\title{Sampling Variance Estimation package}
\description{The package contains functions for estimating the variance of some point estimators under unequal-probability sampling. Emphasis has been put on the speed of routines. The package mostly uses C compilable code. The available functions are listed below matching: population parameters, point estimators and variance estimators.
\tabular{rl}{         \bold{parameters}                            \tab\bold{point estimators}                             \cr
                      total:                                       \tab\code{\link{Est.Total.NHT}}                         \cr
                                                                   \tab\code{\link{Est.Total.Hajek}}                       \cr
                      mean:                                        \tab\code{\link{Est.Mean.NHT}}                          \cr
                                                                   \tab\code{\link{Est.Mean.Hajek}}                        \cr
                      ratio:                                       \tab\code{\link{Est.Ratio}}                             \cr
                      correlation coefficient:                     \tab\code{\link{Est.Corr.NHT}}                          \cr
                                                                   \tab\code{\link{Est.Corr.Hajek}}                        \cr
                      regression coefficient:                      \tab\code{\link{Est.RegCo.Hajek}}
}
\tabular{rl}{                         \bold{point estimators}      \tab\bold{variance estimators} \emph{(uni-stage samples)}\cr
                                      \code{Est.Total.NHT}:        \tab\code{\link{VE.HT.Total.NHT}}                       \cr
                                                                   \tab\code{\link{VE.SYG.Total.NHT}}                      \cr
                                                                   \tab\code{\link{VE.Hajek.Total.NHT}}                    \cr
                                      \code{Est.Total.Hajek}:      \tab\code{\link{VE.Jk.Tukey.Total.Hajek}}               \cr
                                                                   \tab\code{\link{VE.Jk.CBS.HT.Total.Hajek}}              \cr
                                                                   \tab\code{\link{VE.Jk.CBS.SYG.Total.Hajek}}             \cr
                                                                   \tab\code{\link{VE.Jk.B.Total.Hajek}}                   \cr
                                      \code{Est.Mean.NHT}:         \tab\code{\link{VE.HT.Mean.NHT}}                        \cr
                                                                   \tab\code{\link{VE.SYG.Mean.NHT}}                       \cr
                                                                   \tab\code{\link{VE.Hajek.Mean.NHT}}                     \cr
                                      \code{Est.Mean.Hajek}:       \tab\code{\link{VE.Jk.Tukey.Mean.Hajek}}                \cr
                                                                   \tab\code{\link{VE.Jk.CBS.HT.Mean.Hajek}}               \cr
                                                                   \tab\code{\link{VE.Jk.CBS.SYG.Mean.Hajek}}              \cr
                                                                   \tab\code{\link{VE.Jk.B.Mean.Hajek}}                    \cr
                                      \code{Est.Ratio}:            \tab\code{\link{VE.Jk.Tukey.Ratio}}                     \cr
                                                                   \tab\code{\link{VE.Jk.CBS.HT.Ratio}}                    \cr
                                                                   \tab\code{\link{VE.Jk.CBS.SYG.Ratio}}                   \cr
                                                                   \tab\code{\link{VE.Jk.B.Ratio}}                         \cr
                                      \code{Est.Corr.NHT}:         \tab\code{\link{VE.Jk.Tukey.Corr.NHT}}                  \cr
                                      \code{Est.Corr.Hajek}:       \tab\code{\link{VE.Jk.Tukey.Corr.Hajek}}                \cr
                                                                   \tab\code{\link{VE.Jk.CBS.HT.Corr.Hajek}}               \cr
                                                                   \tab\code{\link{VE.Jk.CBS.SYG.Corr.Hajek}}              \cr
                                                                   \tab\code{\link{VE.Jk.B.Corr.Hajek}}                    \cr
                                      \code{Est.RegCo.Hajek}:      \tab\code{\link{VE.Jk.Tukey.RegCo.Hajek}}               \cr
                                                                   \tab\code{\link{VE.Jk.CBS.HT.RegCo.Hajek}}              \cr
                                                                   \tab\code{\link{VE.Jk.CBS.SYG.RegCo.Hajek}}             \cr
                                                                   \tab\code{\link{VE.Jk.B.RegCo.Hajek}}
}
\tabular{rl}{                         \bold{point estimators}      \tab\bold{variance estimators} \emph{(self-weighted two-stage samples)}\cr
                                      \code{Est.Total.Hajek}:      \tab\code{\link{VE.Jk.EB.SW2.Total.Hajek}}              \cr
                                      \code{Est.Mean.Hajek}:       \tab\code{\link{VE.Jk.EB.SW2.Mean.Hajek}}               \cr
                                      \code{Est.Ratio}:            \tab\code{\link{VE.Jk.EB.SW2.Ratio}}                    \cr
                                      \code{Est.Corr.Hajek}:       \tab\code{\link{VE.Jk.EB.SW2.Corr.Hajek}}               \cr
                                      \code{Est.RegCo.Hajek}:      \tab\code{\link{VE.Jk.EB.SW2.RegCo.Hajek}}
}
\tabular{rl}{ \bold{for the inclusion probabilities}               \tab                                                    \cr
              1st order incl. probabilities:                       \tab\code{\link{Pk.PropNorm.U}}                         \cr
              2nd order (joint) incl. probs.:                      \tab\code{\link{Pkl.Hajek.s}}                           \cr
                                                                   \tab\code{\link{Pkl.Hajek.U}}
}
\tabular{l}{                                                       \bold{datasets}                                         \cr
                                                                   \code{\link{oaxaca}}
}
}
\details{To return to this description, type any time:\cr
\code{help(samplingVarEst)}\cr
To cite, use the given references or use:\cr
\code{citation("samplingVarEst")}\cr
}
\keyword{package}

