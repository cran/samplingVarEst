\name{Est.Mean.NHT}
\alias{Est.Mean.NHT}
\title{The Narain-Horvitz-Thompson estimator for a mean}
\description{Computes the Narain (1951); Horvitz-Thompson (1952) estimator for a population mean.  }
\usage{Est.Mean.NHT(VecY.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s}. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population mean of the variable \eqn{y}: 
\deqn{\bar{y} = \frac{1}{N} \sum_{k\in U} y_k}
the unbiased Narain (1951); Horvitz-Thompson (1952) estimator of \eqn{\bar{y}} (implemented by the current function) is given by:
\deqn{\hat{\bar{y}}_{NHT} = \frac{1}{N} \sum_{k\in s} \frac{y_k}{\pi_k}}
where \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\value{
The function returns a value for the mean point estimator.
}
\references{
Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.
}
\seealso{
\code{\link{Est.Mean.Hajek}}\cr\code{\link{VE.HT.Mean.NHT}}\cr\code{\link{VE.SYG.Mean.NHT}}\cr\code{\link{VE.Hajek.Mean.NHT}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s     <- oaxaca$sHOMES00 #Defines the sample to be used for the example
N     <- dim(oaxaca)[1]  #Defines the population size
y1    <- oaxaca$POP10    #Defines the variable of interest y1
y2    <- oaxaca$HOMES10  #Defines the variable of interest y2
Est.Mean.NHT(y1[s==1], pik.U[s==1], N) #The NHT estimator for y1
Est.Mean.NHT(y2[s==1], pik.U[s==1], N) #The NHT estimator for y2
}
\keyword{point estimation}
\keyword{mean}
