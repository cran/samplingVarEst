\name{Est.EmpDistFunc.NHT}
\alias{Est.EmpDistFunc.NHT}
\title{The Narain-Horvitz-Thompson estimator for the empirical cumulative distribution function}
\description{Computes the Narain (1951); Horvitz-Thompson (1952) estimator for the empirical cumulative distribution function (ECDF).  }
\usage{Est.EmpDistFunc.NHT(VecY.s, VecPk.s, N, t)}
\arguments{
\item{VecY.s}{vector of the variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as that of \code{VecPk.s}. There must not be missing values.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{N}{the population size. It must be an integer or a double-precision scalar with zero-valued fractional part. }
\item{t}{value to be evaluated for the empirical cumulative distribution function. It must be an integer or a double-precision scalar. }
}
\details{
For the population empirical cumulative distribution function (ECDF) of the variable \eqn{y} at the value \eqn{t}:
\deqn{Fn(t) = \frac{\#(k\in U:y_k \leq t)}{N} = \frac{1}{N} \sum_{k\in U} I(y_k \leq t)}
the unbiased Narain (1951); Horvitz-Thompson (1952) estimator of \eqn{Fn(t)} (implemented by the current function) is given by:
\deqn{\hat{F}n_{NHT}(t) = \frac{1}{N} \sum_{k\in s} \frac{I(y_k \leq t)}{\pi_k}}
where \eqn{I(y_k \leq t)} denotes the indicator function that takes the value \eqn{1} if \eqn{y_k \leq t} and the value \eqn{0} otherwise, and where \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
  }
\value{
The function returns a value for the empirical cumulative distribution function evaluated at \eqn{t}.
}
\references{
Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.
}
\author{Emilio Lopez Escobar [aut, cre], Juan Francisco Munoz Rosas [ctb].}
\seealso{
\code{\link{Est.EmpDistFunc.Hajek}}
}
\examples{
data(oaxaca)                                       #Loads Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)        #Reconstructs the inclusion probs.
s     <- oaxaca$sHOMES00                           #Defines the sample to be used
N     <- dim(oaxaca)[1]                            #Defines the population size
y1    <- oaxaca$POP10                              #Defines the variable of interest y1
Est.EmpDistFunc.NHT(y1[s==1], pik.U[s==1], N, 950) #NHT est. of ECDF for y1 at t=950
}
\keyword{point estimation}
\keyword{empirical cumulative distribution function}
