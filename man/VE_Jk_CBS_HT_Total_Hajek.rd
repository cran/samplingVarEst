\name{VE.Jk.CBS.HT.Total.Hajek}
\alias{VE.Jk.CBS.HT.Total.Hajek}
\title{The Campbell-Berger-Skinner unequal probability jackknife variance estimator for the Hajek (1971) estimator of a total (Horvitz-Thompson form)}
\description{Computes the Campbell(1980); Berger-Skinner(2005) unequal probability jackknife variance estimator for the Hajek estimator of a total. It uses the Horvitz-Thompson (1952) variance form.  }
\usage{VE.Jk.CBS.HT.Total.Hajek(VecY.s, VecPk.s, MatPkl.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{MatPkl.s}{matrix of the second-order inclusion probabilities; its number of rows and columns is equal to \eqn{n}, the sample size. Values in MatPkl.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population total of the variable \eqn{y}:
\deqn{t = \sum_{k\in U} y_k}
the approximately unbiased Hajek (1971) estimator of \eqn{t} (implemented by the current function) is given by:
\deqn{\hat{t}_{Hajek} = N~\frac{\sum_{k\in s} w_k~y_k}{\sum_{k\in s} w_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{t}_{Hajek}} can be estimated by the Campbell(1980); Berger-Skinner(2005) unequal probability jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{t}_{Hajek}) = \sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}}~\varepsilon_k~\varepsilon_l}
where
\deqn{\varepsilon_k = \left(1-\tilde{w}_k\right)~\left(\hat{t}_{Hajek}-\hat{t}_{Hajek(k)}\right)}
with
\deqn{\tilde{w}_k = \frac{w_k}{\sum_{l\in s} w_l}}
and
\deqn{\hat{t}_{Hajek(k)} = N~\frac{\sum_{l\in s, l\neq k} w_l~y_l}{\sum_{l\in s, l\neq k} w_l}}
  }
\references{
Campbell, C. (1980) A different view of finite population estimation. \emph{Proceedings of the Survey Research Methods Section of the American Statistical Association}, 319--324.

Berger, Y. G. and Skinner, C. J. (2005) A jackknife variance estimator for unequal probability sampling. \emph{Journal of the Royal Statistical Society B}, \bold{67}, 79--89.

Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.
}
\seealso{
\code{\link{VE.Jk.Tukey.Total.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Total.Hajek}}\cr\code{\link{VE.Jk.B.Total.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Total.Hajek}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s      <- oaxaca$sHOMES00 #Defines the sample to be used for the example
N      <- dim(oaxaca)[1]  #Defines the population size
y1     <- oaxaca$POP10    #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10 #Defines the variable of interest y2
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1]) #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the Hajek total point estimator using y1
VE.Jk.CBS.HT.Total.Hajek(y1[s==1], pik.U[s==1], pikl.s, N)
#Computes the var. est. of the Hajek total point estimator using y2
VE.Jk.CBS.HT.Total.Hajek(y2[s==1], pik.U[s==1], pikl.s, N)
}
\keyword{variance estimation}
\keyword{total}
