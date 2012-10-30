\name{Est.Total.Hajek}
\alias{Est.Total.Hajek}
\title{The Hajek estimator for a total}
\description{Computes the Hajek (1971) estimator for a population total.  }
\usage{Est.Total.Hajek(VecY.s, VecPk.s, N)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{N}{the population size.}
}
\details{
For the population total of the variable \eqn{y}:
\deqn{t = \sum_{k\in U} y_k}
the approximately unbiased Hajek (1971) estimator of \eqn{t} (implemented by the current function) is given by:
\deqn{\hat{t}_{Hajek} = N~\frac{\sum_{k\in s} w_k~y_k}{\sum_{k\in s} w_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.
}
\seealso{
\code{\link{Est.Total.NHT}}\cr\code{\link{VE.Jk.Tukey.Total.Hajek}}\cr\code{\link{VE.Jk.CBS.HT.Total.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Total.Hajek}}\cr\code{\link{VE.Jk.B.Total.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Total.Hajek}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s     <- oaxaca$sHOMES00 #Defines the sample to be used for the example
N     <- dim(oaxaca)[1]  #Defines the population size
y1    <- oaxaca$POP10    #Defines the variable of interest y1
y2    <- oaxaca$HOMES10  #Defines the variable of interest y2
Est.Total.Hajek(y1[s==1], pik.U[s==1], N) #The Hajek estimator for y1
Est.Total.Hajek(y2[s==1], pik.U[s==1], N) #The Hajek estimator for y2
}
\keyword{point estimation}
\keyword{total}
