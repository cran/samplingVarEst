\name{Pk.PropNorm.U}
\alias{Pk.PropNorm.U}
\title{Inclusion probabilities proportional to a specified variable.}
\description{Creates and normalises the 1st order inclusion probabilities proportional to a specified variable. In the current context, normalisation means that the inclusion probabilities are less than or equal to 1. Ideally, they should sum up to \eqn{n}, the sample size.  }
\usage{Pk.PropNorm.U(n, VecMOS.U)}
\arguments{
\item{n}{the sample size.}
\item{VecMOS.U}{vector of the variable called measure of size (MOS) to which the first-order inclusion probabilities are to be proportional; its length is equal to the population size. Values in VecMOS.U should be greater than zero (a warning message appears if this does not hold). There must not be any missing value.}
}
\details{Although the normalisation procedure is well-known in the survey sampling literature, we follow the procedure described in Chao (1982, p. 654). Hence, we obtain a unique set of inclusion probabilities that are proportional to the MOS variable.  
}
\value{
The function returns a vector of length \eqn{n} with the inclusion probabilities.
}
\references{
Chao, M. T. (1982) A general purpose unequal probability sampling plan. \emph{Biometrika} \bold{69}, 653--656.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{Pkl.Hajek.s}}\cr\code{\link{Pkl.Hajek.U}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
             #Creates the normalised 1st order incl. probs. proportional
             #to the variable oaxaca$HOMES00 and with sample size 373
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
sum(pik.U)   #Shows the sum is equal to the sample size 373
any(pik.U>1) #Shows there isn't any probability greater than 1
any(pik.U<0) #Shows there isn't any probability less than 0
}
\keyword{inclusion probabilities}
