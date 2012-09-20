\name{VE.Jk.EB.SW2.Ratio}
\alias{VE.Jk.EB.SW2.Ratio}
\title{The self-weighted two-stage sampling Escobar-Berger (2013) jackknife variance estimator for the estimator of a ratio}
\description{Computes the self-weighted two-stage sampling Escobar-Berger (2013) jackknife variance estimator for the estimator of a ratio of two totals/means.  }
\usage{VE.Jk.EB.SW2.Ratio(VecY.s, VecX.s, VecPk.s, nII, VecPi.s,
                   VecCluLab.s, VecCluSize.s)}
\arguments{
\item{VecY.s}{vector of the numerator variable of interest; its length is equal to \eqn{n}, the total sample size. Its length has to be the same as the length of VecPk.s and VecX.s. There must not be any missing value.}
\item{VecX.s}{vector of the denominator variable of interest; its length is equal to \eqn{n}, the total sample size. Its length has to be the same as the length of VecPk.s and VecY.s. There must not be any missing value. All values of VecX.s must be greater than zero.}
\item{VecPk.s}{vector of the elements' first-order inclusion probabilities; its length is equal to \eqn{n}, the total sample size. Values in VecPk.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{nII}{the second stage sample size, i.e. the fixed number of ultimate sampling units that were selected within each cluster. Its size must be less than or equal to the minimum cluster size in the sample.}
\item{VecPi.s}{vector of the clusters' first-order inclusion probabilities; its length is equal to \eqn{n}, the total sample size. Hence values are expected to be repeated in the utilised sample dataset. Values in VecPi.s must be greater than zero and less than or equal to one. There must not be any missing value.}
\item{VecCluLab.s}{vector of the clusters' labels for the elements; its length is equal to \eqn{n}, the total sample size. The labels must be integer numbers.}
\item{VecCluSize.s}{vector of the clusters' sizes; its length is equal to \eqn{n}, the total sample size. Hence values are expected to be repeated in the utilised sample dataset. None of the sizes must be smaller than \eqn{nII}.}
}
\details{
For the population ratio of two totals/means of the variables \eqn{y} and \eqn{x}:
\deqn{R = \frac{\sum_{k\in U} y_k/N}{\sum_{k\in U} x_k/N} = \frac{\sum_{k\in U} y_k}{\sum_{k\in U} x_k}}
the ratio estimator of \eqn{R} is given by:
\deqn{\hat{R} = \frac{\sum_{k\in s} w_k y_k}{\sum_{k\in s} w_k x_k}}
where \eqn{w_k=1/\pi_k} and \eqn{\pi_k} denotes the inclusion probability of the \eqn{k}-th element in the sample \eqn{s}. If \eqn{s} is a self-weighted two-stage sample, the variance of \eqn{\hat{R}} can be estimated by the Escobar-Berger (2013) jackknife variance estimator (implemented by the current function):
\deqn{\hat{V}(\hat{R}) = v_{clu} + v_{obs}}
\deqn{v_{clu} = \sum_{i\in s} (1-\pi_{Ii}^{*}) \varsigma_{(Ii)}^{2} - \frac{1}{\hat{d}}\left(\sum_{i\in s} (1-\pi_{Ii}) \varsigma_{(Ii)}\right)^{2}}
\deqn{v_{obs} = \sum_{k\in s} \phi_{k} \varepsilon_{(k)}^{2}}
where \eqn{\hat{d}={\sum}_{i\in s}{(1-\pi_{Ii})}}, \eqn{\phi_{k} = I\{k\in s_{i}\}\pi_{Ii}^{*}(M_{i}-n_{II})/(M_{i}-1)}, \eqn{\pi_{Ii}^{*} = \pi_{Ii}n_{II}(M_{i}-1)/(n_{II}-1)M_{i}}, with \eqn{s_{i}} denoting the sample elements from the \eqn{i}-th cluster, \eqn{I\{k\in s_{i}\}} is an indicator that takes the value \eqn{1} if the \eqn{k}-th observation is within the \eqn{i}-th cluster and \eqn{0} otherwise, \eqn{\pi_{Ii}} is the inclusion probability of the \eqn{i}-th cluster in the sample \eqn{s}, \eqn{M_{i}} is the size of the \eqn{i}-th cluster, \eqn{n_{II}} is the sample size within each cluster, \eqn{n_{I}} is the number of sampled clusters, and where
\deqn{\varsigma_{(Ii)}=\frac{n_{I}-1}{n_{I}} (\hat{R}-\hat{R}_{(Ii)})}
\deqn{\varepsilon_{(k)}=\frac{n-1}{n} (\hat{R}-\hat{R}_{(k)})}
where  \eqn{\hat{R}_{(Ii)}} and \eqn{\hat{R}_{(k)}} have the same functional form as \eqn{\hat{R}} but omitting the \eqn{i}-th cluster and the \eqn{k}-th element, respectively, from the sample \eqn{s}.
Note that this variance estimator utilises implicitly the Hajek (1964) approximations that are designed for large-entropy sampling designs, large samples and large populations, i.e. care should be taken with highly-stratified samples, e.g. Berger (2005).
  }
\value{
The function returns a value for the estimated variance.
}
\references{
Berger, Y. G. (2005) Variance estimation with highly stratified sampling designs with unequal probabilities. \emph{Australian & New Zealand Journal of Statistics}, \bold{47}, 365--373.

Escobar, E. L. and Berger, Y. G. (2013) A jackknife variance estimator for self-weighted two-stage samples. \emph{Statistica Sinica} (to appear).

Hajek, J. (1964) Asymptotic theory of rejective sampling with varying probabilities from a finite population. \emph{The Annals of Mathematical Statistics}, \bold{35}, 4, 1491--1523.
}
\seealso{
\code{\link{VE.Jk.Tukey.Ratio}}\cr\code{\link{VE.Jk.CBS.HT.Ratio}}\cr\code{\link{VE.Jk.CBS.SYG.Ratio}}\cr\code{\link{VE.Jk.B.Ratio}}
}
\examples{
data(oaxaca) #Loads the Oaxaca municipalities dataset
s         <- oaxaca$sSW_10_3 #Defines the sample to be used
SampData  <- oaxaca[s==1, ]  #Defines the sample dataset
nII       <- 3               #Defines the 2nd stage fixed sample size
#Defines the clusters' labels in the sample dataset
CluLab.s  <- SampData$IDDISTRI 
#Defines the clusters' sizes in the sample dataset
CluSize.s <- SampData$SIZEDIST
#Reconstructs clusters' 1st order incl. probs. in the sample dataset
piIi.s    <- (10 * CluSize.s / 570)
#Reconstructs elements' 1st order incl. probs. in the sample dataset
pik.s     <- piIi.s * (nII/CluSize.s)
y1.s      <- SampData$POP10    #Defines the numerator variable y1
y2.s      <- SampData$POPMAL10 #Defines the numerator variable y2
x.s       <- SampData$HOMES10  #Defines the denominator variable x
#Computes the var. est. of the ratio point estimator using y1
VE.Jk.EB.SW2.Ratio(y1.s, x.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s)
#Computes the var. est. of the ratio point estimator using y2
VE.Jk.EB.SW2.Ratio(y2.s, x.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s)
}
\keyword{variance estimation}
\keyword{ratio}
