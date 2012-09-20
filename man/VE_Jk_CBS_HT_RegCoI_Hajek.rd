\name{VE.Jk.CBS.HT.RegCoI.Hajek}
\alias{VE.Jk.CBS.HT.RegCoI.Hajek}
\title{The Campbell-Berger-Skinner unequal probability jackknife variance estimator for the estimator of the intercept regression coefficient using the Hajek point estimator (Horvitz-Thompson form)}
\description{Computes the Campbell(1980); Berger-Skinner(2005) unequal probability jackknife variance estimator for the estimator of the intercept regression coefficient using the Hajek (1971) point estimator. It uses the Horvitz-Thompson (1952) variance form.  }
\usage{VE.Jk.CBS.HT.RegCoI.Hajek(VecY.s, VecX.s, VecPk.s, MatPkl.s)}
\arguments{
\item{VecY.s}{vector of the variable of interest Y; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be any missing value.}
\item{VecX.s}{vector of the variable of interest X; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{MatPkl.s}{matrix of the second-order inclusion probabilities; its number of rows and columns is equal to \eqn{n}, the sample size. Values in \code{MatPkl.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
From Linear Regression Analysis, for an imposed population model
\deqn{y=\alpha + \beta x}
the population intercept regression coefficient \eqn{\alpha}, assuming that the population size \eqn{N} is unknown (see Sarndal et al., 1992, Sec. 5.10), can be estimated by:
\deqn{\hat{\alpha}_{Hajek} = \hat{\bar{y}}_{Hajek} - \frac{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{Hajek})(x_k - \hat{\bar{x}}_{Hajek})}{\sum_{k\in s} w_k (x_k - \hat{\bar{x}}_{Hajek})^2} \hat{\bar{x}}_{Hajek}}
where \eqn{\hat{\bar{y}}_{Hajek}} and \eqn{\hat{\bar{x}}_{Hajek}} are the Hajek (1971) point estimators of the population means \eqn{\bar{y} = N^{-1} \sum_{k\in U} y_k} and \eqn{\bar{x} = N^{-1} \sum_{k\in U} x_k}, respectively,
\deqn{\hat{\bar{y}}_{Hajek} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k}}
\deqn{\hat{\bar{x}}_{Hajek} = \frac{\sum_{k\in s} w_k x_k}{\sum_{k\in s} w_k}}
and \eqn{w_k=1/\pi_k} with \eqn{\pi_k} denoting the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{\alpha}_{Hajek}} can be estimated by the Campbell(1980); Berger-Skinner(2005) unequal probability jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{\alpha}_{Hajek}) = \sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}} \varepsilon_k \varepsilon_l}
where
\deqn{\varepsilon_k = \left(1-\tilde{w}_k\right) \left(\hat{\alpha}_{Hajek}-\hat{\alpha}_{Hajek(k)}\right)}
with
\deqn{\tilde{w}_k = \frac{w_k}{\sum_{l\in s} w_l}}
and where \eqn{\hat{\alpha}_{Hajek(k)}} has the same functional form as \eqn{\hat{\alpha}_{Hajek}} but omitting the \eqn{k}-th element from the sample \eqn{s}.
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Campbell, C. (1980) A different view of finite population estimation. \emph{Proceedings of the Survey Research Methods Section of the American Statistical Association}, 319--324.

Berger, Y. G. and Skinner, C. J. (2005) A jackknife variance estimator for unequal probability sampling. \emph{Journal of the Royal Statistical Society B}, \bold{67}, 79--89.

Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Sarndal, C.-E. and Swensson, B. and Wretman, J. (1992) \emph{Model Assisted Survey Sampling}. Springer-Verlag, Inc.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.Jk.CBS.HT.RegCo.Hajek}}\cr\code{\link{VE.Jk.Tukey.RegCoI.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.RegCoI.Hajek}}\cr\code{\link{VE.Jk.B.RegCoI.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.RegCoI.Hajek}}
}
\examples{
data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x      <- oaxaca$HOMES10                     #Defines the variable of interest x
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the intercept reg.  coeff. point estimator using y1
VE.Jk.CBS.HT.RegCoI.Hajek(y1[s==1], x[s==1], pik.U[s==1], pikl.s)
#Computes the var. est. of the intercept reg. coeff. point estimator using y2
VE.Jk.CBS.HT.RegCoI.Hajek(y2[s==1], x[s==1], pik.U[s==1], pikl.s)
}
\keyword{variance estimation}
\keyword{regression coefficient}
