\name{Est.Ratio}
\alias{Est.Ratio}
\title{Estimator of a ratio}
\description{Estimates a population ratio of two totals/means.  }
\usage{Est.Ratio(VecY.s, VecX.s, VecPk.s)}
\arguments{
\item{VecY.s}{vector of the numerator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be any missing value.}
\item{VecX.s}{vector of the denominator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be any missing value. All values of \code{VecX.s} should be greater than zero. A warning is displayed if this does not hold and computations continue if mathematical expressions allow these kind of values for the denominator variable.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be any missing value.}
}
\details{
For the population ratio of two totals/means of the variables \eqn{y} and \eqn{x}: 
\deqn{R = \frac{\sum_{k\in U} y_k/N}{\sum_{k\in U} x_k/N} = \frac{\sum_{k\in U} y_k}{\sum_{k\in U} x_k}}
the ratio estimator of \eqn{R} (implemented by the current function) is given by:
\deqn{\hat{R} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k x_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}.
}
\value{
The function returns a value for the ratio point estimator.
}
\references{
Hajek, J. (1971) Comment on \emph{An essay on the logical foundations of survey sampling} by Basu, D. in \emph{Foundations of Statistical Inference} (Godambe, V.P. and Sprott, D.A. eds.), p. 236. Holt, Rinehart and Winston.

Horvitz, D. G. and Thompson, D. J. (1952) A generalization of sampling without replacement from a finite universe. \emph{Journal of the American Statistical Association}, \bold{47}, 663--685.

Narain, R. D. (1951) On sampling without replacement with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{3}, 169--175.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.Jk.Tukey.Ratio}}\cr\code{\link{VE.Jk.CBS.HT.Ratio}}\cr\code{\link{VE.Jk.CBS.SYG.Ratio}}\cr\code{\link{VE.Jk.B.Ratio}}\cr\code{\link{VE.Jk.EB.SW2.Ratio}}
}
\examples{
data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
y1    <- oaxaca$POP10                       #Defines the numerator variable y1
y2    <- oaxaca$POPMAL10                    #Defines the numerator variable y2
x     <- oaxaca$HOMES10                     #Defines the denominator variable x
Est.Ratio(y1[s==1], x[s==1], pik.U[s==1])   #Ratio estimator for y1 and x
Est.Ratio(y2[s==1], x[s==1], pik.U[s==1])   #Ratio estimator for y2 and x
}
\keyword{point estimation}
\keyword{ratio}
