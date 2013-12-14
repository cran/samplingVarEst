\name{oaxaca}
\alias{oaxaca}
\docType{data}
\title{Municipalities of the state of Oaxaca in Mexico}
\description{Dataset with information about the free and sovereign state of Oaxaca which is 
located in the south part of Mexico. The dataset contains information of population, surface, 
indigenous language, agriculture and income from years ranging from 2000 to 2010. The information
was originally collected and processed by the Mexico's National Institute of Statistics and Geography (INEGI by its name in
Spanish, `Instituto Nacional de Estadistica, Geografia e Informatica', \href{http://www.inegi.org.mx/}{http://www.inegi.org.mx/}).}
\usage{data(oaxaca)}
\format{
A data frame with 570 observations on the following 41 variables:
\describe{
  \item{IDREGION}{region INEGI code.}
  \item{LBREGION}{region name (without accents and Spanish language characters).}
  \item{IDDISTRI}{district INEGI code.}
  \item{LBDISTRI}{district name (without accents and Spanish language characters).}
  \item{IDMUNICI}{municipality INEGI code.}
  \item{LBMUNICI}{municipality name (without accents and Spanish language characters).}
  \item{SURFAC05}{surface in squared kilometres 2005.}
  \item{POP00}{population 2000.}
  \item{POP10}{population 2010.}
  \item{HOMES00}{number of homes 2000.}
  \item{HOMES10}{number of homes 2010.}
  \item{POPMAL00}{male population 2000.}
  \item{POPMAL10}{male population 2010.}
  \item{POPFEM00}{female population 2000.}
  \item{POPFEM10}{female population 2010.}
  \item{INLANG00}{5 or more years old population which speaks indigenous language 2000.}
  \item{INLANG10}{5 or more years old population which speaks indigenous language 2010.}
  \item{INCOME00}{gross income in thousands of Mexican pesos 2000.}
  \item{INCOME01}{gross income in thousands of Mexican pesos 2001.}
  \item{INCOME02}{gross income in thousands of Mexican pesos 2002.}
  \item{INCOME03}{gross income in thousands of Mexican pesos 2003.}
  \item{PTREES00}{planted trees 2000.}
  \item{PTREES01}{planted trees 2001.}
  \item{PTREES02}{planted trees 2002.}
  \item{PTREES03}{planted trees 2003.}
  \item{MARRIA07}{marriages 2007.}
  \item{MARRIA08}{marriages 2008.}
  \item{MARRIA09}{marriages 2009.}
  \item{HARVBE07}{harvested bean surface in hectares 2007.}
  \item{HARVBE08}{harvested bean surface in hectares 2008.}
  \item{HARVBE09}{harvested bean surface in hectares 2009.}
  \item{VALUBE07}{value of bean production in thousands of Mexican pesos 2007.}
  \item{VALUBE08}{value of bean production in thousands of Mexican pesos 2008.}
  \item{VALUBE09}{value of bean production in thousands of Mexican pesos 2009.}
  \item{VOLUBE07}{volume of bean production in tons 2007.}
  \item{VOLUBE08}{volume of bean production in tons 2008.}
  \item{VOLUBE09}{volume of bean production in tons 2009.}
  \item{sHOMES00}{a sample (column vector of ones and zeros; 1 = selected, 0 = otherwise) of 373 municipalities drawn using the Hajek (1964) maximum-entropy sampling design with inclusion probabilities proportional to the variable HOMES00.}
  \item{sSURFAC}{a sample (column vector of ones and zeros; 1 = selected, 0 = otherwise) of 373 municipalities drawn using the Hajek (1964) maximum-entropy sampling design with inclusion probabilities proportional to the variable SURFAC05.}
  \item{SIZEDIST}{the size of the district, i.e. the number of municipalities in each district.}
  \item{sSW_10_3}{a sample (column vector of ones and zeros; 1 = selected, 0 = otherwise) of 30 municipalities drawn using a self-weighted two-stage sampling design. The first stage draws 10 districts using the Hajek (1964) maximum-entropy sampling design with clusters' inclusion probabilities proportional to the size of the clusters (variable SIZEDIST). The second stage draws 3 municipalities within the selected districts at the first stage, using equal-probability without-replacement sampling.}
  }
}
\source{Mexico's National Institute of Statistics and Geography (INEGI), `Instituto Nacional de Estadistica, Geografia e Informatica' \href{http://www3.inegi.org.mx/sistemas/descarga/}{http://www3.inegi.org.mx/sistemas/descarga/}
}
\examples{
data(oaxaca)                         #Loads the Oaxaca municipalities dataset
mean(oaxaca$INCOME00, na.rm= TRUE)   #Computes INCOME00 mean (note it has NA's)
median(oaxaca$INCOME00, na.rm= TRUE) #Computes INCOME00 median (note it has NA's)
}
\keyword{datasets}
