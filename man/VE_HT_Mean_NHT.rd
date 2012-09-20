\name{VE.HT.Mean.NHT}
\alias{VE.HT.Mean.NHT}
\title{The Horvitz-Thompson variance estimator for the Narain-Horvitz-Thompson point estimator for a mean}
\description{Computes the Horvitz-Thompson (1952) variance estimator for the Narain (1951); Horvitz-Thompson (1952) point estimator for a population mean.  }
\usage{VE.HT.Mean.NHT(VecY.s, VecPk.s, MatPkl.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{MatPkl.s}{matrix of the second-order inclusion probabilities; its number of rows and columns is equal to \eqn{n}, the sample size. Values in MatPkl.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population mean of the variable \eqn{y}:
\deqn{\bar{y} = \frac{1}{N}\sum_{k\in U} y_k}
the unbiased Narain (1951); Horvitz-Thompson (1952) estimator of \eqn{\bar{y}} is given by:
\deqn{\hat{\bar{y}}_{NHT} = \frac{1}{N}\sum_{k\in s} \frac{y_k}{\pi_k}}
where \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. Let \eqn{\pi_{kl}} denotes the joint-inclusion probabilities of the \eqn{k}-th and \eqn{l}-th elements in the sample \eqn{s}. The variance of \eqn{\hat{\bar{y}}_{NHT}} is given by:
\deqn{V(\hat{\bar{y}}_{NHT}) = \frac{1}{N^2}\sum_{k\in U}\sum_{l\in U} (\pi_{kl}-\pi_k\pi_l)\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}}
which can therefore be estimated by the Horvitz-Thompson variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{\bar{y}}_{NHT}) = \frac{1}{N^2}\sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}}
  }
\references{
Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.
}
\seealso{
\code{\link{VE.SYG.Mean.NHT}}\cr\code{\link{VE.Hajek.Mean.NHT}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U  <- Pk.PropNorm.U(373, oaxaca$SURFAC05)
s      <- oaxaca$sSURFAC #Defines the sample to be used for the example
N      <- dim(oaxaca)[1] #Defines the population size
y1     <- oaxaca$POP10   #Defines the variable of interest y1
y2     <- oaxaca$HOMES10 #Defines the variable of interest y2
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1]) #Approx. 2nd order incl. probs. from s
#Computes the variance estimation of the NHT point estimator for y1
VE.HT.Mean.NHT(y1[s==1], pik.U[s==1], pikl.s, N)
#Computes the variance estimation of the NHT point estimator for y2
VE.HT.Mean.NHT(y2[s==1], pik.U[s==1], pikl.s, N)
}
\keyword{variance estimation}
\keyword{mean}
