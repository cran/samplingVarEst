\name{samplingVarEst-package}
\alias{samplingVarEst-package}
\alias{samplingVarEst}
\title{Sampling Variance Estimation package}
\description{The package contains functions for estimating the variance of some point estimators under unequal-probability sampling. Emphasis has been put on the speed of routines. The package mostly uses C compilable code.\cr

\emph{Point estimators}
\tabular{rl}{         \bold{parameter}                             \tab\bold{point estimator}                              \cr
                      total:                                       \tab\code{\link{Est.Total.NHT}}                         \cr
                                                                   \tab\code{\link{Est.Total.Hajek}}                       \cr
                      mean:                                        \tab\code{\link{Est.Mean.NHT}}                          \cr
                                                                   \tab\code{\link{Est.Mean.Hajek}}                        \cr
                      ratio:                                       \tab\code{\link{Est.Ratio}}                             \cr
                      correlation coefficient:                     \tab\code{\link{Est.Corr.NHT}}                          \cr
                                                                   \tab\code{\link{Est.Corr.Hajek}}                        \cr
                      regression coefficient:                      \tab\code{\link{Est.RegCo.Hajek}}
}
\emph{Variance estimators (under uni-stage sampling)}
\tabular{rl}{                         \bold{point estimator}       \tab\bold{variance estimator}                           \cr
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
\emph{Variance estimators (under self-weighted two-stage sampling)}
\tabular{rl}{                         \bold{point estimator}       \tab\bold{variance estimator}                           \cr
                                      \code{Est.Total.Hajek}:      \tab\code{\link{VE.Jk.EB.SW2.Total.Hajek}}              \cr
                                      \code{Est.Mean.Hajek}:       \tab\code{\link{VE.Jk.EB.SW2.Mean.Hajek}}               \cr
                                      \code{Est.Ratio}:            \tab\code{\link{VE.Jk.EB.SW2.Ratio}}                    \cr
                                      \code{Est.Corr.Hajek}:       \tab\code{\link{VE.Jk.EB.SW2.Corr.Hajek}}               \cr
                                      \code{Est.RegCo.Hajek}:      \tab\code{\link{VE.Jk.EB.SW2.RegCo.Hajek}}
}
\emph{Utilities for the inclusion probabilities}
\tabular{rl}{ For the 1st order incl. probabilities:               \tab\code{\link{Pk.PropNorm.U}}                         \cr
              For the 2nd order (joint) incl. probs.:              \tab\code{\link{Pkl.Hajek.s}}                           \cr
                                                                   \tab\code{\link{Pkl.Hajek.U}}
}
\emph{Datasets}
\tabular{l}{
                                                                   \code{\link{oaxaca}}
}
}
\details{To return to this description, type anytime:\cr
\code{help(samplingVarEst)}\cr

To cite, use the given references or use:\cr
\code{citation("samplingVarEst")}
}
\keyword{package}

