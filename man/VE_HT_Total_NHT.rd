\name{VE.HT.Total.NHT}
\alias{VE.HT.Total.NHT}
\title{The Horvitz-Thompson variance estimator for the Narain-Horvitz-Thompson point estimator for a total}
\description{Computes the Horvitz-Thompson (1952) variance estimator for the Narain (1951); Horvitz-Thompson (1952) point estimator for a population total.  }
\usage{VE.HT.Total.NHT(VecY.s, VecPk.s, MatPkl.s)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as that of \code{VecPk.s}. There must not be missing values.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{MatPkl.s}{matrix of the second-order inclusion probabilities; its number of rows and columns equals \eqn{n}, the sample size. Values in \code{MatPkl.s} must be greater than zero and less than or equal to one. There must not be missing values.}
}
\details{
For the population total of the variable \eqn{y}:
\deqn{t = \sum_{k\in U} y_k}
the unbiased Narain (1951); Horvitz-Thompson (1952) estimator of \eqn{t} is given by:
\deqn{\hat{t}_{NHT} = \sum_{k\in s} \frac{y_k}{\pi_k}}
where \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. Let \eqn{\pi_{kl}} denotes the joint-inclusion probabilities of the \eqn{k}-th and \eqn{l}-th elements in the sample \eqn{s}. The variance of \eqn{\hat{t}_{NHT}} is given by:
\deqn{V(\hat{t}_{NHT}) = \sum_{k\in U}\sum_{l\in U} (\pi_{kl}-\pi_k\pi_l)\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}}
which can therefore be estimated by the Horvitz-Thompson variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{t}_{NHT}) = \sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}}
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.SYG.Total.NHT}}\cr\code{\link{VE.Hajek.Total.NHT}}
}
\examples{
data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$HOMES10                     #Defines the variable of interest y2
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the NHT point estimator for y1
VE.HT.Total.NHT(y1[s==1], pik.U[s==1], pikl.s)
#Computes the var. est. of the NHT point estimator for y2
VE.HT.Total.NHT(y2[s==1], pik.U[s==1], pikl.s)
}
\keyword{variance estimation}
\keyword{total}
