\name{Est.RegCo.Hajek}
\alias{Est.RegCo.Hajek}
\title{Estimator of the regression coefficient using the Hajek point estimator}
\description{Estimates the population regression coefficient using the Hajek (1971) point estimator.  }
\usage{Est.RegCo.Hajek(VecY.s, VecX.s, VecPk.s)}
\arguments{
\item{VecY.s}{vector of the variable of interest Y; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be missing values.}
\item{VecX.s}{vector of the variable of interest X; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be missing values.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be missing values.}
}
\details{
From Linear Regression Analysis, for an imposed population model
\deqn{y=\alpha + \beta x}
the population regression coefficient \eqn{\beta}, assuming that the population size \eqn{N} is unknown (see Sarndal et al., 1992, Sec. 5.10), can be estimated by:
\deqn{\hat{\beta}_{Hajek} = \frac{\sum_{k\in s} w_k (y_k - \hat{\bar{y}}_{Hajek})(x_k - \hat{\bar{x}}_{Hajek})}{\sum_{k\in s} w_k (x_k - \hat{\bar{x}}_{Hajek})^2}}
where \eqn{\hat{\bar{y}}_{Hajek}} and \eqn{\hat{\bar{x}}_{Hajek}} are the Hajek (1971) point estimators of the population means \eqn{\bar{y} = N^{-1} \sum_{k\in U} y_k} and \eqn{\bar{x} = N^{-1} \sum_{k\in U} x_k}, respectively,
\deqn{\hat{\bar{y}}_{Hajek} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k}}
\deqn{\hat{\bar{x}}_{Hajek} = \frac{\sum_{k\in s} w_k x_k}{\sum_{k\in s} w_k}}
and \eqn{w_k=1/\pi_k} with \eqn{\pi_k} denoting the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\value{
The function returns a value for the regression coefficient point estimator.
}
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Sarndal, C.-E. and Swensson, B. and Wretman, J. (1992) \emph{Model Assisted Survey Sampling}. Springer-Verlag, Inc.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{Est.RegCoI.Hajek}}\cr\code{\link{VE.Jk.Tukey.RegCo.Hajek}}\cr\code{\link{VE.Jk.CBS.HT.RegCo.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.RegCo.Hajek}}\cr\code{\link{VE.Jk.B.RegCo.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.RegCo.Hajek}}
}
\examples{
data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x     <- oaxaca$HOMES10                     #Defines the variable of interest x
#Computes the regression coefficient estimator for y1 and x
Est.RegCo.Hajek(y1[s==1], x[s==1], pik.U[s==1])
#Computes the regression coefficient estimator for y2 and x
Est.RegCo.Hajek(y2[s==1], x[s==1], pik.U[s==1])
}
\keyword{point estimation}
\keyword{regression coefficient}
