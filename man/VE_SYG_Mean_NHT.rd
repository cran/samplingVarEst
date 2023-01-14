\name{VE.SYG.Mean.NHT}
\alias{VE.SYG.Mean.NHT}
\title{The Sen-Yates-Grundy variance estimator for the Narain-Horvitz-Thompson point estimator for a mean}
\description{Computes the Sen (1953); Yates-Grundy(1953) variance estimator for the Narain (1951); Horvitz-Thompson (1952) point estimator for a population mean.  }
\usage{VE.SYG.Mean.NHT(VecY.s, VecPk.s, MatPkl.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as that of \code{VecPk.s}. There must not be missing values.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{MatPkl.s}{matrix of the second-order inclusion probabilities; its number of rows and columns equals \eqn{n}, the sample size. Values in \code{MatPkl.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{N}{the population size. It must be an integer or a double-precision scalar with zero-valued fractional part.}
}
\details{
For the population mean of the variable \eqn{y}:
\deqn{\bar{y} = \frac{1}{N}\sum_{k\in U} y_k}
the unbiased Narain (1951); Horvitz-Thompson (1952) estimator of \eqn{\bar{y}} is given by:
\deqn{\hat{\bar{y}}_{NHT} = \frac{1}{N}\sum_{k\in s} \frac{y_k}{\pi_k}}
where \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. Let \eqn{\pi_{kl}} denotes the joint-inclusion probabilities of the \eqn{k}-th and \eqn{l}-th elements in the sample \eqn{s}. The variance of \eqn{\hat{\bar{y}}_{NHT}} is given by: 
\deqn{V(\hat{\bar{y}}_{NHT}) = \frac{1}{N^2}\sum_{k\in U}\sum_{l\in U} (\pi_{kl}-\pi_k\pi_l)\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}}
which, if the utilised sampling design is of fixed sample size, can therefore be estimated by the Sen-Yates-Grundy variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{\bar{y}}_{NHT}) = \frac{1}{N^2}\frac{-1}{2}\sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}}\left(\frac{y_k}{\pi_k}-\frac{y_l}{\pi_l}\right)^2}
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.

Sen, A. R. (1953) On the estimate of the variance in sampling with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{5}, 119--127.

Yates, F. and Grundy, P. M. (1953) Selection without replacement from within strata with probability proportional to size. \emph{Journal of the Royal Statistical Society B}, \bold{15}, 253--261.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.HT.Mean.NHT}}\cr\code{\link{VE.Hajek.Mean.NHT}}
}
\examples{
data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
N      <- dim(oaxaca)[1]                     #Defines the population size
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$HOMES10                     #Defines the variable of interest y2
#This approx. is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the NHT point estimator for y1
VE.SYG.Mean.NHT(y1[s==1], pik.U[s==1], pikl.s, N)
#Computes the var. est. of the NHT point estimator for y2
VE.SYG.Mean.NHT(y2[s==1], pik.U[s==1], pikl.s, N)
}
\keyword{variance estimation}
\keyword{mean}
