\name{VE.Jk.Tukey.Mean.Hajek}
\alias{VE.Jk.Tukey.Mean.Hajek}
\title{The Tukey (1958) jackknife variance estimator for the Hajek estimator of a mean}
\description{Computes the Quenouille(1956); Tukey (1958) jackknife variance estimator for the Hajek (1971) estimator of a mean.  }
\usage{VE.Jk.Tukey.Mean.Hajek(VecY.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s}. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population mean of the variable \eqn{y}:
\deqn{\bar{y} = \frac{1}{N} \sum_{k\in U} y_k}
the approximately unbiased Hajek (1971) estimator of \eqn{\bar{y}} is given by:
\deqn{\hat{\bar{y}}_{Hajek} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{\bar{y}}_{Hajek}} can be estimated by the Quenouille(1956); Tukey (1958) jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{\bar{y}}_{Hajek}) = \left(1-\frac{n}{N}\right)\frac{n-1}{n}\sum_{k\in s} \left( \hat{\bar{y}}_{Hajek(k)}-\hat{\bar{y}}_{Hajek} \right)^2}
where
\deqn{\hat{\bar{y}}_{Hajek(k)} = \frac{\sum_{l\in s, l\neq k} w_l y_l}{\sum_{l\in s, l\neq k} w_l}}
Note that we are implementing the Tukey (1958) jackknife variance estimator using the `ad hoc' finite population correction \eqn{1-n/N} (see Shao and Tu, 1995; Wolter, 2007).
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Quenouille, M. H. (1956) Notes on bias in estimation. \emph{Biometrika}, \bold{43}, 353--360.

Shao, J. and Tu, D. (1995) \emph{The Jackknife and Bootstrap}. Springer-Verlag, Inc.

Tukey, J. W. (1958) Bias and confidence in not-quite large samples (abstract). \emph{The Annals of Mathematical Statistics}, \bold{29}, 2, p. 614.

Wolter, K. M. (2007) \emph{Introduction to Variance Estimation}. 2nd Ed. Springer, Inc.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.Jk.CBS.HT.Mean.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Mean.Hajek}}\cr\code{\link{VE.Jk.B.Mean.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Mean.Hajek}}
}
\examples{
data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10                    #Defines the variable of interest y2
#Computes the var. est. of the Hajek mean point estimator using y1
VE.Jk.Tukey.Mean.Hajek(y1[s==1], pik.U[s==1], N)
#Computes the var. est. of the Hajek mean point estimator using y2
VE.Jk.Tukey.Mean.Hajek(y2[s==1], pik.U[s==1], N)
}
\keyword{variance estimation}
\keyword{mean}
