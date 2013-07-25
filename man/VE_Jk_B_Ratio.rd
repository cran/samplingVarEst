\name{VE.Jk.B.Ratio}
\alias{VE.Jk.B.Ratio}
\title{The Berger (2007) unequal probability jackknife variance estimator for the estimator of a ratio}
\description{Computes the Berger (2007) unequal probability jackknife variance estimator for the estimator of a ratio of two totals/means.  }
\usage{VE.Jk.B.Ratio(VecY.s, VecX.s, VecPk.s)}
\arguments{
\item{VecY.s}{vector of the numerator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecX.s. There must not be any missing value.}
\item{VecX.s}{vector of the denominator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecY.s. There must not be any missing value. All values of VecX.s should be greater than zero. A warning is displayed if this does not hold and computations continue if mathematical expressions allow these kind of values for the denominator variable.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
For the population ratio of two totals/means of the variables \eqn{y} and \eqn{x}:
\deqn{R = \frac{\sum_{k\in U} y_k/N}{\sum_{k\in U} x_k/N} = \frac{\sum_{k\in U} y_k}{\sum_{k\in U} x_k}}
the ratio estimator of \eqn{R} is given by:
\deqn{\hat{R} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k x_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{R}} can be estimated by the Berger (2007) unequal probability jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{R}) = \sum_{k\in s} \frac{n}{n-1}(1-\pi_k) \left(\varepsilon_k - \hat{B}\right)^{2}}
where
\deqn{\hat{B} = \frac{\sum_{k\in s}(1-\pi_k) \varepsilon_k}{\sum_{k\in s}(1-\pi_k)}}
and
\deqn{\varepsilon_k = \left(1-\tilde{w}_k\right) \left(\hat{R}-\hat{R}_{(k)}\right)}
with
\deqn{\tilde{w}_k = \frac{w_k}{\sum_{l\in s} w_l}}
and
\deqn{\hat{R}_{(k)} = \frac{\sum_{l\in s, l\neq k} w_l y_l/\sum_{l\in s, l\neq k} w_l}{\sum_{l\in s, l\neq k} w_l x_l/\sum_{l\in s, l\neq k} w_l} = \frac{\sum_{l\in s, l\neq k} w_l y_l}{\sum_{l\in s, l\neq k} w_l x_l}}
Note that this variance estimator utilises implicitly the Hajek (1964) approximations that are designed for large-entropy sampling designs, large samples and large populations, i.e. care should be taken with highly-stratified samples, e.g. Berger (2005).
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Berger, Y. G. (2005) Variance estimation with highly stratified sampling designs with unequal probabilities. \emph{Australian & New Zealand Journal of Statistics}, \bold{47}, 365--373.

Berger, Y. G. (2007) A jackknife variance estimator for unistage stratified samples with unequal probabilities. \emph{Biometrika} \bold{94}, 953--964.

Hajek, J. (1964) Asymptotic theory of rejective sampling with varying probabilities from a finite population. \emph{The Annals of Mathematical Statistics}, \bold{35}, 4, 1491--1523.
}
\seealso{
\code{\link{VE.Jk.Tukey.Ratio}}\cr\code{\link{VE.Jk.CBS.HT.Ratio}}\cr\code{\link{VE.Jk.CBS.SYG.Ratio}}\cr\code{\link{VE.Jk.EB.SW2.Ratio}}\cr\code{\link{VE.EB.HT.Ratio}}\cr\code{\link{VE.EB.SYG.Ratio}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s      <- oaxaca$sHOMES00 #Defines the sample to be used for the example
y1     <- oaxaca$POP10    #Defines the numerator variable of interest y1
y2     <- oaxaca$POPMAL10 #Defines the numerator variable of interest y2
x      <- oaxaca$HOMES10  #Defines the denominator variable of interest x
#Computes the var. est. of the ratio point estimator using y1
VE.Jk.B.Ratio(y1[s==1], x[s==1], pik.U[s==1])
#Computes the var. est. of the ratio point estimator using y2
VE.Jk.B.Ratio(y2[s==1], x[s==1], pik.U[s==1])
}
\keyword{variance estimation}
\keyword{ratio}
