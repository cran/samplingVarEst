\name{VE.Jk.Tukey.Corr.Hajek}
\alias{VE.Jk.Tukey.Corr.Hajek}
\title{The Tukey (1958) jackknife variance estimator for the estimator of a correlation coefficient using the Hajek point estimator}
\description{Computes the Quenouille(1956); Tukey (1958) jackknife variance estimator for the estimator of a correlation coefficient of two variables using the Hajek (1971) point estimator.  }
\usage{VE.Jk.Tukey.Corr.Hajek(VecY.s, VecX.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest Y; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecX.s. There must not be any missing value.}
\item{VecX.s}{vector of the variable of interest X; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecY.s. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size. Note that this information is utilised for the finite population correction only.}
}
\details{
For the population correlation coefficient of two variables \eqn{y} and \eqn{x}:
\deqn{C = \frac{\sum_{k\in U} (y_k - \bar{y})(x_k - \bar{x})}{\sqrt{\sum_{k\in U} (y_k - \bar{y})^2}\sqrt{\sum_{k\in U} (x_k - \bar{x})^2}}}
the point estimator of \eqn{C}, assuming that \eqn{N} is unknown (see Sarndal et al., 1992, Sec. 5.9), is:
\deqn{\hat{C}_{Hajek} = \frac{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{Hajek})(x_k - \hat{\bar{x}}_{Hajek})}{\sqrt{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{Hajek})^2}\sqrt{\sum_{k\in s} w_k (x_k - \hat{\bar{x}}_{Hajek})^2}}}
where \eqn{\hat{\bar{y}}_{Hajek}} is the Hajek (1971) point estimator of the population mean \eqn{\bar{y} = N^{-1} \sum_{k\in U} y_k}, 
\deqn{\hat{\bar{y}}_{Hajek} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k}}
and \eqn{w_k=1/\pi_k} with \eqn{\pi_k} denoting the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{C}_{Hajek}} can be estimated by the Quenouille(1956); Tukey (1958) jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{C}_{Hajek}) = \left(1-\frac{n}{N}\right)\frac{n-1}{n}\sum_{k\in s} \left( \hat{C}_{Hajek(k)}-\hat{C}_{Hajek} \right)^2}
where \eqn{\hat{C}_{Hajek(k)}} has the same functional form as \eqn{\hat{C}_{Hajek}} but omitting the \eqn{k}-th element from the sample \eqn{s}.
Note that we are implementing the Tukey (1958) jackknife variance estimator using the `ad hoc' finite population correction \eqn{1-n/N} (see Shao and Tu, 1995; Wolter, 2007).

  }
\value{
The function returns a value for the estimated variance.
}
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Quenouille, M. H. (1956) Notes on bias in estimation. \emph{Biometrika}, \bold{43}, 353--360.

Sarndal, C.-E. and Swensson, B. and Wretman, J. (1992) \emph{Model Assisted Survey Sampling}. Springer-Verlag, Inc.

Shao, J. and Tu, D. (1995) \emph{The Jackknife and Bootstrap}. Springer-Verlag, Inc.

Tukey, J. W. (1958) Bias and confidence in not-quite large samples (abstract). \emph{The Annals of Mathematical Statistics}, \bold{29}, 2, p. 614.

Wolter, K. M. (2007) \emph{Introduction to Variance Estimation}. 2nd Ed. Springer, Inc.
}
\seealso{
\code{\link{VE.Jk.CBS.HT.Corr.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Corr.Hajek}}\cr\code{\link{VE.Jk.B.Corr.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Corr.Hajek}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s     <- oaxaca$sHOMES00 #Defines the sample to be used for the example
N     <- dim(oaxaca)[1]  #Defines the population size
y1    <- oaxaca$POP10    #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10 #Defines the variable of interest y2
x     <- oaxaca$HOMES10  #Defines the variable of interest x
#Computes the var. est. of the corr. coeff. point estimator using y1
VE.Jk.Tukey.Corr.Hajek(y1[s==1], x[s==1], pik.U[s==1], N)
#Computes the var. est. of the corr. coeff. point estimator using y2
VE.Jk.Tukey.Corr.Hajek(y2[s==1], x[s==1], pik.U[s==1], N)
}
\keyword{variance estimation}
\keyword{correlation coefficient}
