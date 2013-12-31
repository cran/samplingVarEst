\name{VE.Lin.SYG.Ratio}
\alias{VE.Lin.SYG.Ratio}
\title{The unequal probability linearisation variance estimator for the estimator of a ratio (Sen-Yates-Grundy form)}
\description{Computes the unequal probability Taylor linearisation variance estimator for the estimator of a ratio of two totals/means. It uses the Sen (1953); Yates-Grundy(1953) variance form.  }
\usage{VE.Lin.SYG.Ratio(VecY.s, VecX.s, VecPk.s, MatPkl.s)}
\arguments{
\item{VecY.s}{vector of the numerator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be any missing value.}
\item{VecX.s}{vector of the denominator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be any missing value. All values of \code{VecX.s} should be greater than zero. A warning is displayed if this does not hold and computations continue if mathematical expressions allow these kind of values for the denominator variable.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{MatPkl.s}{matrix of the second-order inclusion probabilities; its number of rows and columns is equal to \eqn{n}, the sample size. Values in \code{MatPkl.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
For the population ratio of two totals/means of the variables \eqn{y} and \eqn{x}:
\deqn{R = \frac{\sum_{k\in U} y_k/N}{\sum_{k\in U} x_k/N} = \frac{\sum_{k\in U} y_k}{\sum_{k\in U} x_k}}
the ratio estimator of \eqn{R} is given by:
\deqn{\hat{R} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k x_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{R}} can be estimated by the unequal probability linearisation variance estimator (implemented by the current function). For details see Woodruff (1971); Deville (1999); Demnati-Rao (2004); Sarndal et al., (1992, Secs. 5.5 and 5.6):
\deqn{\hat{V}(\hat{R}) = \frac{-1}{2}\sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}} (w_k u_k - w_l u_l)^{2}}
where
\deqn{u_k = \frac{y_k - \hat{R} x_k}{\hat{t}_{x,NHT}}}
with
\deqn{\hat{t}_{x,NHT} = \sum_{k\in s} w_k x_k}
the unbiased Narain (1951); Horvitz-Thompson (1952) estimator of the population total for the (denominator) variable \code{VecX.s}.
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Demnati, A. and Rao, J. N. K. (2004) Linearization variance estimators for survey data. \emph{Survey Methodology}, \bold{30}, 17--26.

Deville, J.-C. (1999) Variance estimation for complex statistics and estimators: linearization and residual techniques. \emph{Survey Methodology}, \bold{25}, 193--203.

Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.

Sarndal, C.-E. and Swensson, B. and Wretman, J. (1992) \emph{Model Assisted Survey Sampling}. Springer-Verlag, Inc.

Sen, A. R. (1953) On the estimate of the variance in sampling with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{5}, 119--127.

Woodruff, R. S. (1971) A Simple Method for Approximating the Variance of a Complicated Estimate. \emph{Journal of the American Statistical Association}, \bold{66}, 334, 411--414.

Yates, F. and Grundy, P. M. (1953) Selection without replacement from within strata with probability proportional to size. \emph{Journal of the Royal Statistical Society B}, \bold{15}, 253--261.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.Lin.HT.Ratio}}\code{\link{VE.Jk.Tukey.Ratio}}\cr\code{\link{VE.Jk.CBS.HT.Ratio}}\cr\code{\link{VE.Jk.B.Ratio}}\cr\code{\link{VE.Jk.EB.SW2.Ratio}}\cr\code{\link{VE.EB.HT.Ratio}}\cr\code{\link{VE.EB.SYG.Ratio}}
}
\examples{
data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used for
y1     <- oaxaca$POP10                       #Defines the numerator variable y1
y2     <- oaxaca$POPMAL10                    #Defines the numerator variable y2
x      <- oaxaca$HOMES10                     #Defines the denominator variable x
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the ratio point estimator using y1
VE.Lin.SYG.Ratio(y1[s==1], x[s==1], pik.U[s==1], pikl.s)
#Computes the var. est. of the ratio point estimator using y2
VE.Lin.SYG.Ratio(y2[s==1], x[s==1], pik.U[s==1], pikl.s)
}
\keyword{variance estimation}
\keyword{ratio}
