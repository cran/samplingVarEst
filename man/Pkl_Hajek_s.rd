\name{Pkl.Hajek.s}
\alias{Pkl.Hajek.s}
\title{The Hajek approximation for the 2nd order (joint) inclusion probabilities (sample based)}
\description{Computes the Hajek (1964) approximation for the 2nd order (joint) inclusion probabilities utilising only sample-based quantities.  }
\usage{Pkl.Hajek.s(VecPk.s)}
\arguments{
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
Let \eqn{\pi_k} denote the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}, and let \eqn{\pi_{kl}} denote the joint-inclusion probabilities of the \eqn{k}-th and \eqn{l}-th elements in the sample \eqn{s}. If the joint-inclusion probabilities \eqn{\pi_{kl}} are not available, the Hajek (1964) approximation can be used. Note that this approximation is designed for large-entropy sampling designs, large samples and large populations, i.e. care should be taken with highly-stratified samples, e.g. Berger (2005).

The sample based version of the Hajek (1964) approximation for the joint-inclusion probabilities \eqn{\pi_{kl}} (implemented by the current function) is:
\deqn{\pi_{kl} ~\doteq~ \pi_{k}~\pi_{l}~\{1~-~\hat{d}^{-1}(1-\pi_{k})(1-\pi_{l})\}}
where \eqn{\hat{d} =\sum_{k\in s}(1-\pi_{k})}.

The approximation was originally developed for \eqn{d\rightarrow\infty}, under the maximum-entropy sampling design (see Hajek 1981, Theorem 3.3, Ch. 3 and 6), the Rejective Sampling design. It requires that the utilised sampling design be of large entropy. An overview can be found in Berger and Tille (2009). An account of different sampling designs, \eqn{\pi_{kl}} approximations, and approximate variances under large-entropy designs can be found in Tille (2006), Brewer and Donadio (2003), and Haziza, Mecatti, and Rao (2008). Recently, Berger (2011) gave sufficient conditions under which Hajek's results still hold for large-entropy sampling designs that are not the maximum-entropy one.
  }
\references{
Berger, Y. G. (2005) Variance estimation with highly stratified sampling designs with unequal probabilities. \emph{Australian & New Zealand Journal of Statistics}, \bold{47}, 365--373.

Berger, Y. G. (2011) Asymptotic consistency under large entropy sampling designs with unequal probabilities. \emph{Pakistan Journal of Statististics}, \bold{27}, 407--426.

Berger, Y. G. and Tille, Y. (2009) Sampling with unequal probabilities. In \emph{Sample Surveys: Design, Methods and Applications} (eds. D. Pfeffermann and C. R. Rao), 39--54. Elsevier, Amsterdam.

Brewer, K. R. W. and Donadio, M. E. (2003) The large entropy variance of the Horvitz-Thompson estimator. \emph{Survey Methodology} \bold{29}, 189--196.

Hajek, J. (1964) Asymptotic theory of rejective sampling with varying probabilities from a finite population. \emph{The Annals of Mathematical Statistics}, \bold{35}, 4, 1491--1523.

Hajek, J. (1981) \emph{Sampling From a Finite Population.} Dekker, New York.

Haziza, D., Mecatti, F. and Rao, J. N. K. (2008) Evaluation of some approximate variance estimators under the Rao-Sampford unequal probability sampling design. \emph{Metron}, \bold{LXVI}, 91--108.

Tille, Y. (2006) \emph{Sampling Algorithms.} Springer, New York.
}
\seealso{
\code{\link{Pkl.Hajek.U}}\cr\code{\link{Pk.PropNorm.U}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s      <- oaxaca$sHOMES00 #Defines the sample to be used for the example
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1]) #Approx. 2nd order incl. probs. from s
#First 5 rows/cols of (sample based) 2nd order incl. probs. matrix
pikl.s[1:5,1:5]
}
\keyword{inclusion probabilities}
