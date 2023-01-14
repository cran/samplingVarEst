\name{VE.Hajek.Mean.NHT}
\alias{VE.Hajek.Mean.NHT}
\title{The Hajek variance estimator for the Narain-Horvitz-Thompson point estimator for a mean}
\description{Computes the Hajek (1964) variance estimator for the Narain (1951); Horvitz-Thompson (1952) point estimator for a population mean.  }
\usage{VE.Hajek.Mean.NHT(VecY.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as that of \code{VecPk.s}. There must not be missing values.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{N}{the population size. It must be an integer or a double-precision scalar with zero-valued fractional part.}
}
\details{
For the population mean of the variable \eqn{y}:
\deqn{\bar{y} = \frac{1}{N}\sum_{k\in U} y_k}
the unbiased Narain (1951); Horvitz-Thompson (1952) estimator of \eqn{\bar{y}} is given by:
\deqn{\hat{\bar{y}}_{NHT} = \frac{1}{N}\sum_{k\in s} \frac{y_k}{\pi_k}}
where \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. For large-entropy sampling designs, the variance of \eqn{\hat{\bar{y}}_{NHT}} is approximated by the Hajek (1964) variance:
\deqn{V(\hat{\bar{y}}_{NHT}) = \frac{1}{N(N-1)}\left[\sum_{k\in U}\frac{y_k^2}{\pi_k}(1-\pi_k)-dG^2\right]}
with \eqn{d=\sum_{k\in U}\pi_k(1-\pi_k)} and \eqn{G=d^{-1}\sum_{k\in U}(1-\pi_k)y_k}.

The variance \eqn{V(\hat{t}_{NHT})} can be estimated by the variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{\bar{y}}_{NHT}) = \frac{n}{N^2(n-1)}\left[\sum_{k\in s}\left(\frac{y_k}{\pi_k}\right)^2(1-\pi_k)-\hat{d}\hat{G}^2\right]}
where \eqn{\hat{d}=\sum_{k\in s}(1-\pi_k)} and \eqn{\hat{G}=\hat{d}^{-1}\sum_{k\in s}(1-\pi)y_k/\pi_k}.

Note that the Hajek (1964) variance approximation is designed for large-entropy sampling designs, large samples, and large populations, i.e., care should be taken with highly-stratified samples, e.g. Berger (2005).
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Berger, Y. G. (2005) Variance estimation with highly stratified sampling designs with unequal probabilities. \emph{Australian & New Zealand Journal of Statistics}, \bold{47}, 365--373.

Hajek, J. (1964) Asymptotic theory of rejective sampling with varying probabilities from a finite population. \emph{The Annals of Mathematical Statistics}, \bold{35}, 4, 1491--1523.

Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.HT.Mean.NHT}}\cr\code{\link{VE.SYG.Mean.NHT}}
}
\examples{
data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$HOMES10                     #Defines the variable of interest y2
#Computes the (approximate) var. est. of the NHT point est. for y1
VE.Hajek.Mean.NHT(y1[s==1], pik.U[s==1], N)
#Computes the (approximate) var. est. of the NHT point est. for y2
VE.Hajek.Mean.NHT(y2[s==1], pik.U[s==1], N)
}
\keyword{variance estimation}
\keyword{mean}
