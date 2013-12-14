\name{VE.Jk.CBS.HT.Ratio}
\alias{VE.Jk.CBS.HT.Ratio}
\title{The Campbell-Berger-Skinner unequal probability jackknife variance estimator for the estimator of a ratio (Horvitz-Thompson form)}
\description{Computes the Campbell(1980); Berger-Skinner(2005) unequal probability jackknife variance estimator for the estimator of a ratio of two totals/means. It uses the Horvitz-Thompson (1952) variance form.  }
\usage{VE.Jk.CBS.HT.Ratio(VecY.s, VecX.s, VecPk.s, MatPkl.s)}
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
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{R}} can be estimated by the Campbell(1980); Berger-Skinner(2005) unequal probability jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{R}) = \sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}} \varepsilon_k \varepsilon_l}
where
\deqn{\varepsilon_k = \left(1-\tilde{w}_k\right) \left(\hat{R}-\hat{R}_{(k)}\right)}
with
\deqn{\tilde{w}_k = \frac{w_k}{\sum_{l\in s} w_l}}
and
\deqn{\hat{R}_{(k)} = \frac{\sum_{l\in s, l\neq k} w_l y_l/\sum_{l\in s, l\neq k} w_l}{\sum_{l\in s, l\neq k} w_l x_l/\sum_{l\in s, l\neq k} w_l} = \frac{\sum_{l\in s, l\neq k} w_l y_l}{\sum_{l\in s, l\neq k} w_l x_l}}
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Campbell, C. (1980) A different view of finite population estimation. \emph{Proceedings of the Survey Research Methods Section of the American Statistical Association}, 319--324.

Berger, Y. G. and Skinner, C. J. (2005) A jackknife variance estimator for unequal probability sampling. \emph{Journal of the Royal Statistical Society B}, \bold{67}, 79--89.

Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.Jk.Tukey.Ratio}}\cr\code{\link{VE.Jk.CBS.SYG.Ratio}}\cr\code{\link{VE.Jk.B.Ratio}}\cr\code{\link{VE.Jk.EB.SW2.Ratio}}\cr\code{\link{VE.EB.HT.Ratio}}\cr\code{\link{VE.EB.SYG.Ratio}}
}
\examples{
data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
y1     <- oaxaca$POP10                       #Defines the numerator variable y1
y2     <- oaxaca$POPMAL10                    #Defines the numerator variable y2
x      <- oaxaca$HOMES10                     #Defines the denominator variable x
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the ratio point estimator using y1
VE.Jk.CBS.HT.Ratio(y1[s==1], x[s==1], pik.U[s==1], pikl.s)
#Computes the var. est. of the ratio point estimator using y2
VE.Jk.CBS.HT.Ratio(y2[s==1], x[s==1], pik.U[s==1], pikl.s)
}
\keyword{variance estimation}
\keyword{ratio}
