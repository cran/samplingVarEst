\name{VE.Jk.Tukey.Ratio}
\alias{VE.Jk.Tukey.Ratio}
\title{The Tukey (1958) jackknife variance estimator for the estimator of a ratio}
\description{Computes the Quenouille(1956); Tukey (1958) jackknife variance estimator for the estimator of a ratio of two totals/means.  }
\usage{VE.Jk.Tukey.Ratio(VecY.s, VecX.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the numerator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecX.s. There must not be any missing value.}
\item{VecX.s}{vector of the denominator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecY.s. There must not be any missing value. All values of VecX.s must be greater than zero.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population ratio of two totals/means of the variables \eqn{y} and \eqn{x}:
\deqn{R = \frac{\sum_{k\in U} y_k/N}{\sum_{k\in U} x_k/N} = \frac{\sum_{k\in U} y_k}{\sum_{k\in U} x_k}}
the ratio estimator of \eqn{R} is given by:
\deqn{\hat{R} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k x_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{R}} can be estimated by the Quenouille(1956); Tukey (1958) jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{R}) = \left(1-\frac{n}{N}\right)\frac{n-1}{n}\sum_{k\in s} \left( \hat{R}_{(k)}-\hat{R} \right)^2}
where
\deqn{\hat{R}_{(k)} = \frac{\sum_{l\in s, l\neq k} w_l y_l}{\sum_{l\in s, l\neq k} w_l x_l}}
Note that we are implementing the Tukey (1958) jackknife variance estimator using the `ad hoc' finite population correction \eqn{1-n/N} (see Shao and Tu, 1995; Wolter, 2007).

  }
\value{
The function returns a value for the estimated variance.
}
\references{
Quenouille, M. H. (1956) Notes on bias in estimation. \emph{Biometrika}, \bold{43}, 353--360.

Shao, J. and Tu, D. (1995) \emph{The Jackknife and Bootstrap}. Springer-Verlag, Inc.

Tukey, J. W. (1958) Bias and confidence in not-quite large samples (abstract). \emph{The Annals of Mathematical Statistics}, \bold{29}, 2, p. 614.

Wolter, K. M. (2007) \emph{Introduction to Variance Estimation}. 2nd Ed. Springer, Inc.
}
\seealso{
\code{\link{VE.Jk.CBS.HT.Ratio}}\cr\code{\link{VE.Jk.CBS.SYG.Ratio}}\cr\code{\link{VE.Jk.B.Ratio}}\cr\code{\link{VE.Jk.EB.SW2.Ratio}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s     <- oaxaca$sHOMES00 #Defines the sample to be used for the example
N     <- dim(oaxaca)[1]  #Defines the population size
y1    <- oaxaca$POP10    #Defines the numerator variable of interest y1
y2    <- oaxaca$POPMAL10 #Defines the numerator variable of interest y2
x     <- oaxaca$HOMES10  #Defines the denominator variable of interest x
#Computes the var. est. of the ratio point estimator using y1
VE.Jk.Tukey.Ratio(y1[s==1], x[s==1], pik.U[s==1], N)
#Computes the var. est. of the ratio point estimator using y2
VE.Jk.Tukey.Ratio(y2[s==1], x[s==1], pik.U[s==1], N)
}
\keyword{variance estimation}
\keyword{ratio}
