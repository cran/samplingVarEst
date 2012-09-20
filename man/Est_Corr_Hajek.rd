\name{Est.Corr.Hajek}
\alias{Est.Corr.Hajek}
\title{Estimator of a correlation coefficient using the Hajek point estimator}
\description{Estimates a population correlation coefficient of two variables using the Hajek (1971) point estimator.  }
\usage{Est.Corr.Hajek(VecY.s, VecX.s, VecPk.s)}
\arguments{
\item{VecY.s}{vector of the variable of interest Y; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecX.s. There must not be any missing value.}
\item{VecX.s}{vector of the variable of interest X; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s and VecY.s. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
For the population correlation coefficient of two variables \eqn{y} and \eqn{x}:
\deqn{C = \frac{\sum_{k\in U} (y_k - \bar{y})(x_k - \bar{x})}{\sqrt{\sum_{k\in U} (y_k - \bar{y})^2}\sqrt{\sum_{k\in U} (x_k - \bar{x})^2}}}
the point estimator of \eqn{C}, assuming that \eqn{N} is unknown (see Sarndal et al., 1992, Sec. 5.9) (implemented by the current function), is:
\deqn{\hat{C}_{Hajek} = \frac{\sum_{k\in s} w_k~(y_k - \hat{\bar{y}}_{Hajek})(x_k - \hat{\bar{x}}_{Hajek})}{\sqrt{\sum_{k\in s} w_k~(y_k - \hat{\bar{y}}_{Hajek})^2}\sqrt{\sum_{k\in s} w_k~(x_k - \hat{\bar{x}}_{Hajek})^2}}}
where \eqn{\hat{\bar{y}}_{Hajek}} is the Hajek (1971) point estimator of the population mean \eqn{\bar{y} = N^{-1} \sum_{k\in U} y_k},
\deqn{\hat{\bar{y}}_{Hajek} = \frac{\sum_{k\in s} w_k~y_k}{\sum_{k\in s} w_k}}
and \eqn{w_k=1/\pi_k} with \eqn{\pi_k} denoting the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Sarndal, C.-E. and Swensson, B. and Wretman, J. (1992) \emph{Model Assisted Survey Sampling}. Springer-Verlag, Inc.
}
\seealso{
\code{\link{Est.Corr.NHT}}\cr\code{\link{VE.Jk.Tukey.Corr.Hajek}}\cr\code{\link{VE.Jk.CBS.HT.Corr.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Corr.Hajek}}\cr\code{\link{VE.Jk.B.Corr.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Corr.Hajek}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s     <- oaxaca$sHOMES00 #Defines the sample to be used for the example
y1    <- oaxaca$POP10    #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10 #Defines the variable of interest y2
x     <- oaxaca$HOMES10  #Defines the variable of interest x
#Computes the correlation coefficient estimator for y1 and x
Est.Corr.Hajek(y1[s==1], x[s==1], pik.U[s==1])
#Computes the correlation coefficient estimator for y2 and x
Est.Corr.Hajek(y2[s==1], x[s==1], pik.U[s==1])
}
\keyword{point estimation}
\keyword{correlation coefficient}
