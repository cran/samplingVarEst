\name{VE.EB.SYG.Ratio}
\alias{VE.EB.SYG.Ratio}
\title{The Escobar-Berger unequal probability replicate variance estimator for the estimator of a ratio (Sen-Yates-Grundy form)}
\description{Computes the Escobar-Berger (2013) unequal probability replicate variance estimator for the estimator of a ratio of two totals/means. It uses the Sen (1953); Yates-Grundy(1953) variance form.  }
\usage{
VE.EB.SYG.Ratio(VecY.s, VecX.s, VecPk.s, MatPkl.s,
                VecAlpha.s = rep(1, times=length(VecPk.s)))
}
\arguments{
\item{VecY.s}{vector of the numerator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecX.s}. There must not be missing values.}
\item{VecX.s}{vector of the denominator variable of interest; its length is equal to \eqn{n}, the sample size. Its length has to be the same as the length of \code{VecPk.s} and \code{VecY.s}. There must not be missing values. All values of \code{VecX.s} should be greater than zero. A warning is displayed if this does not hold and computations continue if mathematical expressions allow this kind of values for the denominator variable.}
\item{VecPk.s}{vector of the first-order inclusion probabilities; its length is equal to \eqn{n}, the sample size. Values in \code{VecPk.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{MatPkl.s}{matrix of the second-order inclusion probabilities; its number of rows and columns is equal to \eqn{n}, the sample size. Values in \code{MatPkl.s} must be greater than zero and less than or equal to one. There must not be missing values.}
\item{VecAlpha.s}{vector of the \eqn{\alpha_k} values; its length is equal to \eqn{n}, the sample size. Values in \code{VecAlpha.s} can be different for each unit and they must be greater or equal to zero. Escobar-Berger (2013) showed that this replicate variance estimator is valid for \eqn{\alpha_k\geq 0}. In particular, they suggest using \eqn{\alpha_k=1} for all units in the sample (the default for \code{VecAlpha.s} if omitted in the function call). Using \eqn{\alpha_k>1} results in approximating the Demnati-Rao (2004) linearisation variance estimators. There must not be missing values.}
}
\details{
For the population ratio of two totals/means of the variables \eqn{y} and \eqn{x}:
\deqn{R = \frac{\sum_{k\in U} y_k/N}{\sum_{k\in U} x_k/N} = \frac{\sum_{k\in U} y_k}{\sum_{k\in U} x_k}}
the ratio estimator of \eqn{R} is given by:
\deqn{\hat{R} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k x_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. The variance of \eqn{\hat{R}} can be estimated by the Escobar-Berger (2013) unequal probability replicate variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{R}) = \frac{-1}{2}\sum_{k\in s}\sum_{l\in s} \frac{\pi_{kl}-\pi_k\pi_l}{\pi_{kl}} (\breve{\nu}_k - \breve{\nu}_l)^{2}}
where
\deqn{\breve{\nu}_k = w_k^{\alpha_k} \left(\hat{R}-\hat{R}_k^{*}\right)}
for some \eqn{\alpha_k\geq0} (suggested to be 1, see below comments) and with
\deqn{\hat{R}_k^{*} = \frac{\left(\sum_{l\in s} w_l y_l - w_k^{1-\alpha_k} y_k\right)/\left(\sum_{l\in s} w_l - w_k^{1-\alpha_k} \right)}{\left(\sum_{l\in s} w_l x_l - w_k^{1-\alpha_k} x_k\right)/\left(\sum_{l\in s} w_l - w_k^{1-\alpha_k} \right)} = \frac{\sum_{l\in s} w_l y_l - w_k^{1-\alpha_k} y_k}{\sum_{l\in s} w_l x_l - w_k^{1-\alpha_k} x_k}}
Regarding the value of \eqn{\alpha_k}, Escobar-Berger (2013) show that \eqn{\hat{V}(\hat{R})} is valid for
\eqn{\alpha_k\geq0} but conclude that \eqn{\alpha_k>0} should be used as \eqn{\alpha_k=0} corresponds to a naive biased and unstable jackknife. They recommend \eqn{\alpha_k=1} or \eqn{\alpha_k>1}.  If \eqn{\alpha_k=1}, \eqn{\hat{V}(\hat{R})} reduces to the Escobar-Berger (2011) jackknife. Using \eqn{\alpha_k>1} results in approximating the empirical influence function, i.e. the Gateaux (1919) derivative, or Demnati-Rao (2004) linearisation variance estimators. The larger the \eqn{\alpha_k}, the closer the approximation. Further, Escobar-Berger (2013) give an intuitive explanation of the replication method from a jackknife and bootstrap perspective.
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Demnati, A. and Rao, J. N. K. (2004) Linearization variance estimators for survey data. \emph{Survey Methodology}, \bold{30}, 17--26.

Escobar, E. L. and Berger, Y. G. (2011) Jackknife variance estimation for functions of Horvitz-Thompson estimators under unequal probability sampling without replacement. In Proceeding of the \emph{58th World Statistics Congress}. Dublin, Ireland: International Statistical Institute.

Escobar, E. L. and Berger, Y. G. (2013) A new replicate variance estimator for unequal probability sampling without replacement. \emph{Canadian Journal of Statistics} \bold{41}, 3, 508--524.

Gateaux, R. (1919) Fonctions d'une infinite de variables indeependantes. \emph{Bulletin de la Societe Mathematique de France}, \bold{47}, 70--96.

Sen, A. R. (1953) On the estimate of the variance in sampling with varying probabilities. \emph{Journal of the Indian Society of Agricultural Statistics}, \bold{5}, 119--127.

Yates, F. and Grundy, P. M. (1953) Selection without replacement from within strata with probability proportional to size. \emph{Journal of the Royal Statistical Society B}, \bold{15}, 253--261.
}
\author{Emilio Lopez Escobar.}
\seealso{
\code{\link{VE.Lin.HT.Ratio}}\cr\code{\link{VE.Lin.SYG.Ratio}}\cr\code{\link{VE.Jk.Tukey.Ratio}}\cr\code{\link{VE.Jk.CBS.HT.Ratio}}\cr\code{\link{VE.Jk.CBS.SYG.Ratio}}\cr\code{\link{VE.Jk.B.Ratio}}\cr\code{\link{VE.Jk.EB.SW2.Ratio}}\cr\code{\link{VE.EB.HT.Ratio}}
}
\examples{
data(oaxaca)                                  #Loads the Oaxaca municipalities dataset
pik.U   <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s       <- oaxaca$sHOMES00                    #Defines the sample to be used
y1      <- oaxaca$POP10                       #Defines the numerator variable y1
y2      <- oaxaca$POPMAL10                    #Defines the numerator variable y2
x       <- oaxaca$HOMES10                     #Defines the denominator variable x
Alpha.s <- rep(2, times=373)                  #Defines the vector with Alpha values
#This approximation is only suitable for large-entropy sampling designs
pikl.s  <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the ratio point estimator using y1
VE.EB.SYG.Ratio(y1[s==1], x[s==1], pik.U[s==1], pikl.s) #Using default VecAlpha.s
#Computes the var. est. of the ratio point estimator using y2
VE.EB.SYG.Ratio(y2[s==1], x[s==1], pik.U[s==1], pikl.s, Alpha.s)
}
\keyword{variance estimation}
\keyword{ratio}
