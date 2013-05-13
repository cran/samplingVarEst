\name{VE.Jk.B.Total.Hajek}
\alias{VE.Jk.B.Total.Hajek}
\title{The Berger (2007) unequal probability jackknife variance estimator for the Hajek estimator of a total}
\description{Computes the Berger (2007) unequal probability jackknife variance estimator for the Hajek (1971) estimator of a total.  }
\usage{VE.Jk.B.Total.Hajek(VecY.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population total of the variable \eqn{y}:
\deqn{t = \sum_{k\in U} y_k}
the approximately unbiased Hajek (1971) estimator of \eqn{t} is given by:
\deqn{\hat{t}_{Hajek} = N \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{t}_{Hajek}} can be estimated by the Berger (2007) unequal probability jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{t}_{Hajek}) = \sum_{k\in s} \frac{n}{n-1}(1-\pi_k) \left(\varepsilon_k - \hat{B}\right)^{2}}
where
\deqn{\hat{B} = \frac{\sum_{k\in s}(1-\pi_k) \varepsilon_k}{\sum_{k\in s}(1-\pi_k)}}
and
\deqn{\varepsilon_k = \left(1-\tilde{w}_k\right) \left(\hat{t}_{Hajek}-\hat{t}_{Hajek(k)}\right)}
with
\deqn{\tilde{w}_k = \frac{w_k}{\sum_{l\in s} w_l}}
and
\deqn{\hat{t}_{Hajek(k)} = N \frac{\sum_{l\in s, l\neq k} w_l y_l}{\sum_{l\in s, l\neq k} w_l}}
Note that this variance estimator utilises implicitly the Hajek (1964) approximations that are designed for large-entropy sampling designs, large samples and large populations, i.e. care should be taken with highly-stratified samples, e.g. Berger (2005).
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Berger, Y. G. (2005) Variance estimation with highly stratified sampling designs with unequal probabilities. \emph{Australian & New Zealand Journal of Statistics}, \bold{47}, 365--373.

Berger, Y. G. (2007) A jackknife variance estimator for unistage stratified samples with unequal probabilities. \emph{Biometrika} \bold{94}, 953--964.

Hajek, J. (1964) Asymptotic theory of rejective sampling with varying probabilities from a finite population. \emph{The Annals of Mathematical Statistics}, \bold{35}, 4, 1491--1523.

Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.
}
\seealso{
\code{\link{VE.Jk.Tukey.Total.Hajek}}\cr\code{\link{VE.Jk.CBS.HT.Total.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Total.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Total.Hajek}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s      <- oaxaca$sHOMES00 #Defines the sample to be used for the example
N      <- dim(oaxaca)[1]  #Defines the population size
y1     <- oaxaca$POP10    #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10 #Defines the variable of interest y2
#Computes the var. est. of the Hajek total point estimator using y1
VE.Jk.B.Total.Hajek(y1[s==1], pik.U[s==1], N)
#Computes the var. est. of the Hajek total point estimator using y2
VE.Jk.B.Total.Hajek(y2[s==1], pik.U[s==1], N)
}
\keyword{variance estimation}
\keyword{total}
