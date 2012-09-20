\name{Est.Mean.Hajek}
\alias{Est.Mean.Hajek}
\title{The Hajek estimator for a mean}
\description{Computes the Hajek (1971) estimator for a population mean.  }
\usage{Est.Mean.Hajek(VecY.s, VecPk.s)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of VecPk.s. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
For the population mean of the variable \eqn{y}:
\deqn{\bar{y} = \frac{1}{N} \sum_{k\in U} y_k}
the approximately unbiased Hajek (1971) estimator of \eqn{\bar{y}} (implemented by the current function) is given by:
\deqn{\hat{\bar{y}}_{Hajek} = \frac{\sum_{k\in s} w_k~y_k}{\sum_{k\in s} w_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.
}
\seealso{
\code{\link{Est.Mean.NHT}}\cr\code{\link{VE.Jk.Tukey.Mean.Hajek}}\cr\code{\link{VE.Jk.CBS.HT.Mean.Hajek}}\cr\code{\link{VE.Jk.CBS.SYG.Mean.Hajek}}\cr\code{\link{VE.Jk.B.Mean.Hajek}}\cr\code{\link{VE.Jk.EB.SW2.Mean.Hajek}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
#Reconstructs the 1st order incl. probs. for the example
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s     <- oaxaca$sHOMES00 #Defines the sample to be used for the example
y1    <- oaxaca$POP10    #Defines the variable of interest y1
y2    <- oaxaca$HOMES10  #Defines the variable of interest y2
Est.Mean.Hajek(y1[s==1], pik.U[s==1]) #Computes the Hajek est. for y1
Est.Mean.Hajek(y2[s==1], pik.U[s==1]) #Computes the Hajek est. for y2
}
\keyword{point estimation}
\keyword{mean}
