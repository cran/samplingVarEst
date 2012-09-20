\name{samplingVarEst-package}
\alias{samplingVarEst-package}
\alias{samplingVarEst}
\title{Sampling Variance Estimation package}
\description{The package contains functions to calculate some point estimators and estimating their variance under unequal-probability sampling. Uni-stage and two-stage sampling designs are considered. The package further contains some approximations for the joint-inclusion probabilities (population and sample based formulae).\cr

Emphasis has been put on the speed of routines as the package mostly uses C compiled code. The full list of available functions are listed below. They are grouped in \emph{purpose-lists}, aiming to clarify their usage.\cr

The user has to pick a suitable combination of: a population parameter of interest, a choice of point estimator, and a choice of variance estimator.
\tabular{ll}{         \bold{For these population parameters:}       \tab\bold{The available point estimators are:}\cr
                      total:                                       \tab\code{\link{Est.Total.NHT}}                         \cr
                                                                   \tab\code{\link{Est.Total.Hajek}}                       \cr
                      mean:                                        \tab\code{\link{Est.Mean.NHT}}                          \cr
                                                                   \tab\code{\link{Est.Mean.Hajek}}                        \cr
                      ratio:                                       \tab\code{\link{Est.Ratio}}                             \cr
                      correlation coefficient:                     \tab\code{\link{Est.Corr.NHT}}                          \cr
                                                                   \tab\code{\link{Est.Corr.Hajek}}                        \cr
                      regression coefficients:                     \tab\code{\link{Est.RegCoI.Hajek}}                      \cr
                                                                   \tab\code{\link{Est.RegCo.Hajek}}
}
\tabular{ll}{\bold{For these point estimators:}         \tab\bold{The available variance estimators} for \emph{uni-stage samples} are:\cr
             \code{Est.Total.NHT}:                     \tab\code{\link{VE.HT.Total.NHT}}                       \cr
                                                       \tab\code{\link{VE.SYG.Total.NHT}}                      \cr
                                                       \tab\code{\link{VE.Hajek.Total.NHT}}                    \cr
             \code{Est.Total.Hajek}:                   \tab\code{\link{VE.Jk.Tukey.Total.Hajek}}               \cr
                                                       \tab\code{\link{VE.Jk.CBS.HT.Total.Hajek}}              \cr
                                                       \tab\code{\link{VE.Jk.CBS.SYG.Total.Hajek}}             \cr
                                                       \tab\code{\link{VE.Jk.B.Total.Hajek}}                   \cr
                                                       \tab\code{\link{VE.EB.HT.Total.Hajek}}                  \cr
                                                       \tab\code{\link{VE.EB.SYG.Total.Hajek}}                 \cr
             \code{Est.Mean.NHT}:                      \tab\code{\link{VE.HT.Mean.NHT}}                        \cr
                                                       \tab\code{\link{VE.SYG.Mean.NHT}}                       \cr
                                                       \tab\code{\link{VE.Hajek.Mean.NHT}}                     \cr
             \code{Est.Mean.Hajek}:                    \tab\code{\link{VE.Jk.Tukey.Mean.Hajek}}                \cr
                                                       \tab\code{\link{VE.Jk.CBS.HT.Mean.Hajek}}               \cr
                                                       \tab\code{\link{VE.Jk.CBS.SYG.Mean.Hajek}}              \cr
                                                       \tab\code{\link{VE.Jk.B.Mean.Hajek}}                    \cr
                                                       \tab\code{\link{VE.EB.HT.Mean.Hajek}}                   \cr
                                                       \tab\code{\link{VE.EB.SYG.Mean.Hajek}}                  \cr
             \code{Est.Ratio}:                         \tab\code{\link{VE.Jk.Tukey.Ratio}}                     \cr
                                                       \tab\code{\link{VE.Jk.CBS.HT.Ratio}}                    \cr
                                                       \tab\code{\link{VE.Jk.CBS.SYG.Ratio}}                   \cr
                                                       \tab\code{\link{VE.Jk.B.Ratio}}                         \cr
                                                       \tab\code{\link{VE.EB.HT.Ratio}}                        \cr
                                                       \tab\code{\link{VE.EB.SYG.Ratio}}                       \cr
             \code{Est.Corr.NHT}:                      \tab\code{\link{VE.Jk.Tukey.Corr.NHT}}                  \cr
             \code{Est.Corr.Hajek}:                    \tab\code{\link{VE.Jk.Tukey.Corr.Hajek}}                \cr
                                                       \tab\code{\link{VE.Jk.CBS.HT.Corr.Hajek}}               \cr
                                                       \tab\code{\link{VE.Jk.CBS.SYG.Corr.Hajek}}              \cr
                                                       \tab\code{\link{VE.Jk.B.Corr.Hajek}}                    \cr
             \code{Est.RegCoI.Hajek}:                  \tab\code{\link{VE.Jk.Tukey.RegCoI.Hajek}}              \cr
                                                       \tab\code{\link{VE.Jk.CBS.HT.RegCoI.Hajek}}             \cr
                                                       \tab\code{\link{VE.Jk.CBS.SYG.RegCoI.Hajek}}            \cr
                                                       \tab\code{\link{VE.Jk.B.RegCoI.Hajek}}                  \cr
             \code{Est.RegCo.Hajek}:                   \tab\code{\link{VE.Jk.Tukey.RegCo.Hajek}}               \cr
                                                       \tab\code{\link{VE.Jk.CBS.HT.RegCo.Hajek}}              \cr
                                                       \tab\code{\link{VE.Jk.CBS.SYG.RegCo.Hajek}}             \cr
                                                       \tab\code{\link{VE.Jk.B.RegCo.Hajek}}
}
\tabular{ll}{\bold{For these point estimators:}\tab\bold{The available variance estimators} for \emph{self-weighted two-stage samples} are:\cr
             \code{Est.Total.Hajek}:          \tab\code{\link{VE.Jk.EB.SW2.Total.Hajek}}              \cr
             \code{Est.Mean.Hajek}:           \tab\code{\link{VE.Jk.EB.SW2.Mean.Hajek}}               \cr
             \code{Est.Ratio}:                \tab\code{\link{VE.Jk.EB.SW2.Ratio}}                    \cr
             \code{Est.Corr.Hajek}:           \tab\code{\link{VE.Jk.EB.SW2.Corr.Hajek}}               \cr
             \code{Est.RegCoI.Hajek}:         \tab\code{\link{VE.Jk.EB.SW2.RegCoI.Hajek}}             \cr
             \code{Est.RegCo.Hajek}:          \tab\code{\link{VE.Jk.EB.SW2.RegCo.Hajek}}
}
\tabular{ll}{ \bold{For the inclusion probabilities:}              \tab\bold{The available functions} are:  \cr
              1st order inclusion probabilities:                   \tab\code{\link{Pk.PropNorm.U}}          \cr
              2nd order (joint) inclusion probabilities:           \tab\code{\link{Pkl.Hajek.s}}            \cr
                                                                   \tab\code{\link{Pkl.Hajek.U}}
}
\tabular{l}{                                                       \bold{datasets}                          \cr
                                                                   \code{\link{oaxaca}}
}
}
\details{To return to this description type:\cr
\code{help(samplingVarEst)}\cr
or type:\cr
\code{?samplingVarEst}\cr
To cite, use:\cr
\code{citation("samplingVarEst")}\cr
}
\keyword{package}

