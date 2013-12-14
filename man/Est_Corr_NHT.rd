\name{Est.Corr.NHT}
\alias{Est.Corr.NHT}
\title{Estimator of a correlation coefficient using the Narain-Horvitz-Thompson point estimator}
\description{Estimates a population correlation coefficient of two variables using the Narain (1951); Horvitz-Thompson (1952) point estimator.  }
\usage{Est.Corr.NHT(VecY.s, VecX.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest Y; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be any missing value.}
\item{VecX.s}{vector of the variable of interest X; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population correlation coefficient of two variables \eqn{y} and \eqn{x}:
\deqn{C = \frac{\sum_{k\in U} (y_k - \bar{y})(x_k - \bar{x})}{\sqrt{\sum_{k\in U} (y_k - \bar{y})^2}\sqrt{\sum_{k\in U} (x_k - \bar{x})^2}}}
the point estimator of \eqn{C} (implemented by the current function) is given by:
\deqn{\hat{C} = \frac{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{NHT})(x_k - \hat{\bar{x}}_{NHT})}{\sqrt{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{NHT})^2}\sqrt{\sum_{k\in s} w_k (x_k - \hat{\bar{x}}_{NHT})^2}}}
where \eqn{\hat{\bar{y}}_{NHT}} is the Narain (1951); Horvitz-Thompson (1952) estimator for the population mean \eqn{\bar{y} = N^{-1} \sum_{k\in U} y_k},
\deqn{\hat{\bar{y}}_{NHT} = \frac{1}{N}\sum_{k\in s} w_k y_k}
and \eqn{w_k=1/\pi_k} with \eqn{\pi_k} denoting the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\value{
The function returns a value for the correlation coefficient point estimator.
}
\references{
Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{Est.Corr.Hajek}}\cr\code{\link{VE.Jk.Tukey.Corr.NHT}}
}
\examples{
data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x     <- oaxaca$HOMES10                     #Defines the variable of interest x
#Computes the correlation coefficient estimator for y1 and x
Est.Corr.NHT(y1[s==1], x[s==1], pik.U[s==1], N)
#Computes the correlation coefficient estimator for y2 and x
Est.Corr.NHT(y2[s==1], x[s==1], pik.U[s==1], N)
}
\keyword{point estimation}
\keyword{correlation coefficient}
