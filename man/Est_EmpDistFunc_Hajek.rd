\name{Est.EmpDistFunc.Hajek}
\alias{Est.EmpDistFunc.Hajek}
\title{The Hajek estimator for the empirical cumulative distribution function}
\description{Computes the Hajek (1971) estimator for the empirical cumulative distribution function (ECDF).  }
\usage{Est.EmpDistFunc.Hajek(VecY.s, VecPk.s, t)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s}. There must not be any missing value.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{t}{value to be evaluated for the empirical cumulative distribution function. It must be an integer or a double-precision scalar. }
}
\details{
For the population empirical cumulative distribution function (ECDF) of the variable \eqn{y} at the value \eqn{t}:
\deqn{Fn(t) = \frac{\#(k\in U:y_k \leq t)}{N} = \frac{1}{N} \sum_{k\in U} I(y_k \leq t)}
the approximately unbiased Hajek (1971) estimator of \eqn{Fn(t)} (implemented by the current function) is given by:
\deqn{\hat{F}n_{Hajek}(t) = \frac{\sum_{k\in s} w_k I(y_k \leq t)}{\sum_{k\in s} w_k}}
where \eqn{I(y_k \leq t)} denotes the indicator function that takes the value \eqn{1} if \eqn{y_k \leq t} and the value \eqn{0} otherwise, and where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\value{
The function returns a value for the empirical cumulative distribution function evaluated at \eqn{t}.
}
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.
}
\author{Emilio Lopez Escobar [aut, cre], Juan Francisco Munoz Rosas [ctb].}
\seealso{
\code{\link{Est.EmpDistFunc.NHT}}
}
\examples{
data(oaxaca)                                      #Loads Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)       #Reconstructs the inclusion probs.
s     <- oaxaca$sHOMES00                          #Defines the sample to be used
y1    <- oaxaca$POP10                             #Defines the variable of interest y1
Est.EmpDistFunc.Hajek(y1[s==1], pik.U[s==1], 950) #Hajek est. of ECDF for y1 at t=950
}
\keyword{point estimation}
\keyword{empirical cumulative distribution function}
