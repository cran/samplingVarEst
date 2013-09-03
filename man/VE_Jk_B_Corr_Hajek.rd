\name{VE.Jk.B.Corr.Hajek}
\alias{VE.Jk.B.Corr.Hajek}
\title{The Berger (2007) unequal probability jackknife variance estimator for the estimator of a correlation coefficient using the Hajek point estimator}
\description{Computes the Berger (2007) unequal probability jackknife variance estimator for the estimator of a correlation coefficient of two variables using the Hajek (1971) point estimator.  }
\usage{VE.Jk.B.Corr.Hajek(VecY.s, VecX.s, VecPk.s)}
\arguments{
\item{VecY.s}{vector of the variable of interest Y; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be any missing value.}
\item{VecX.s}{vector of the variable of interest X; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
For the population correlation coefficient of two variables \eqn{y} and \eqn{x}:
\deqn{C = \frac{\sum_{k\in U} (y_k - \bar{y})(x_k - \bar{x})}{\sqrt{\sum_{k\in U} (y_k - \bar{y})^2}\sqrt{\sum_{k\in U} (x_k - \bar{x})^2}}}
the point estimator of \eqn{C}, assuming that \eqn{N} is unknown (see Sarndal et al., 1992, Sec. 5.9), is:
\deqn{\hat{C}_{Hajek} = \frac{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{Hajek})(x_k - \hat{\bar{x}}_{Hajek})}{\sqrt{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{Hajek})^2}\sqrt{\sum_{k\in s} w_k (x_k - \hat{\bar{x}}_{Hajek})^2}}}
where \eqn{\hat{\bar{y}}_{Hajek}} is the Hajek (1971) point estimator of the population mean \eqn{\bar{y} = N^{-1} \sum_{k\in U} y_k},
\deqn{\hat{\bar{y}}_{Hajek} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k}}
and \eqn{w_k=1/\pi_k} with \eqn{\pi_k} denoting the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{C}_{Hajek}} can be estimated by the Berger (2007) unequal probability jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{C}_{Hajek}) = \sum_{k\in s} \frac{n}{n-1}(1-\pi_k) \left(\varepsilon_k - \hat{B}\right)^{2}}
where
\deqn{\hat{B} = \frac{\sum_{k\in s}(1-\pi_k) \varepsilon_k}{\sum_{k\in s}(1-\pi_k)}}
and
\deqn{\varepsilon_k = \left(1-\tilde{w}_k\right) \left(\hat{C}_{Hajek}-\hat{C}_{Hajek(k)}\right)}
with
\deqn{\tilde{w}_k = \frac{w_k}{\sum_{l\in s} w_l}}
and where \eqn{\hat{C}_{Hajek(k)}} has the same functional form as \eqn{\hat{C}_{Hajek}} but omitting the \eqn{k}-th element from the sample \eqn{s}.
Note that this variance estimator utilises implicitly the Hajek (1964) approximations that are designed for large-entropy sampling designs, large samples and large populations, i.e. care should be taken with highly-stratified samples, e.g. Berger (2005).
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Berger, Y. G. (2005) Variance estimation with highly stratified sampling designs with unequal probabilities. \emph{Australian & New Zealand Journal of Statistics}, \bold{47}, 365--373.

Berger, Y. G. (2007) A jackknife variance estimator for unistage stratified samples with unequal probabilities. \emph{Biometrika} \bold{94}, 953--964.

Hajek, J. (1964) Asymptotic theory of rejective sampling with varying probabilities from a finite population. \emph{The Annals of Mathematical Statistics}, \bold{35}, 4, 1491--1523.

Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Sarndal, C.-E. and Swensson, B. and Wretman, J. (1992) \emph{Model Assisted Survey Sampling}. Springer-Verlag, Inc.
}
\seealso{
\code{\link{VE.Jk.Tukey.Corr.Hajek}}\cr\code{\link{VE.Jk.CBS.HT.Corr.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Corr.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Corr.Hajek}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s      <- oaxaca$sHOMES00 #Defines the sample to be used for the example
y1     <- oaxaca$POP10    #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10 #Defines the variable of interest y2
x      <- oaxaca$HOMES10  #Defines the variable of interest x
#Computes the var. est. of the corr. coeff. point estimator using y1
VE.Jk.B.Corr.Hajek(y1[s==1], x[s==1], pik.U[s==1])
#Computes the var. est. of the corr. coeff. point estimator using y2
VE.Jk.B.Corr.Hajek(y2[s==1], x[s==1], pik.U[s==1])
}
\keyword{variance estimation}
\keyword{correlation coefficient}
