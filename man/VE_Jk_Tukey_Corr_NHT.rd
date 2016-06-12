\name{VE.Jk.Tukey.Corr.NHT}
\alias{VE.Jk.Tukey.Corr.NHT}
\title{The Tukey (1958) jackknife variance estimator for the estimator of a correlation coefficient using the Narain-Horvitz-Thompson point estimator}
\description{Computes the Quenouille(1956); Tukey (1958) jackknife variance estimator for the estimator of a correlation coefficient of two variables using the Narain (1951); Horvitz-Thompson (1952) point estimator.  }
\usage{VE.Jk.Tukey.Corr.NHT(VecY.s, VecX.s, VecPk.s, N, FPC= TRUE)}
\arguments{
\item{VecY.s}{vector of the variable of interest Y; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be missing values.}
\item{VecX.s}{vector of the variable of interest X; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be missing values.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{N}{the population size. It must be an integer or a double-precision scalar with zero-valued fractional part. This information is also utilised for the finite population correction, see \code{FPC} below.}
\item{FPC}{logical value. If an ad hoc finite population correction \eqn{FPC=1-n/N} is to be used. The default is TRUE.}
}
\details{
For the population correlation coefficient of two variables \eqn{y} and \eqn{x}:
\deqn{C = \frac{\sum_{k\in U} (y_k - \bar{y})(x_k - \bar{x})}{\sqrt{\sum_{k\in U} (y_k - \bar{y})^2}\sqrt{\sum_{k\in U} (x_k - \bar{x})^2}}}
the point estimator of \eqn{C} is given by:
\deqn{\hat{C} = \frac{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{NHT})(x_k - \hat{\bar{x}}_{NHT})}{\sqrt{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{NHT})^2}\sqrt{\sum_{k\in s} w_k (x_k - \hat{\bar{x}}_{NHT})^2}}}
where \eqn{\hat{\bar{y}}_{NHT}} is the Narain (1951); Horvitz-Thompson (1952) estimator for the population mean \eqn{\bar{y} = N^{-1} \sum_{k\in U} y_k},
\deqn{\hat{\bar{y}}_{NHT} = \frac{1}{N}\sum_{k\in s} w_k y_k}
and \eqn{w_k=1/\pi_k} with \eqn{\pi_k} denoting the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{C}} can be estimated by the Quenouille(1956); Tukey (1958) jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{C}) = \left(1-\frac{n}{N}\right)\frac{n-1}{n}\sum_{k\in s} \left( \hat{C}_{(k)}-\hat{C} \right)^2}
where \eqn{\hat{C}_{(k)}} has the same functional form as \eqn{\hat{C}} but omitting the \eqn{k}-th element from the sample \eqn{s}.
Note that we are implementing the Tukey (1958) jackknife variance estimator using the `ad hoc' finite population correction \eqn{1-n/N} (see Shao and Tu, 1995; Wolter, 2007). If \code{FPC=FALSE} then the term \eqn{1-n/N} is ommited from the above formula.
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.

Quenouille, M. H. (1956) Notes on bias in estimation. \emph{Biometrika}, \bold{43}, 353--360.

Shao, J. and Tu, D. (1995) \emph{The Jackknife and Bootstrap}. Springer-Verlag, Inc.

Tukey, J. W. (1958) Bias and confidence in not-quite large samples (abstract). \emph{The Annals of Mathematical Statistics}, \bold{29}, 2, p. 614.

Wolter, K. M. (2007) \emph{Introduction to Variance Estimation}. 2nd Ed. Springer, Inc.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{Est.Corr.Hajek}}
}
\examples{
data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x     <- oaxaca$HOMES10                     #Defines the variable of interest x
#Computes the var. est. of the corr. coeff. point estimator using y1
VE.Jk.Tukey.Corr.NHT(y1[s==1], x[s==1], pik.U[s==1], N)
#Computes the var. est. of the corr. coeff. point estimator using y2
VE.Jk.Tukey.Corr.NHT(y2[s==1], x[s==1], pik.U[s==1], N, FPC= FALSE)
}
\keyword{variance estimation}
\keyword{correlation coefficient}
