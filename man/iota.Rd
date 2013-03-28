\name{iota}
\alias{iota}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Lindley Information (i.e., Information Utility) of Item Response Patterns
}
\description{
This function calculates Lindley information (i.e., information utility) quantities for item response patterns, including the Lindley information for individual response patterns and the expected information for a set of response patterns.
}
\usage{
iota(ltm.obj, logL.fun, fscore.obj = NULL, data = NULL, prior = NULL, theta0 = NULL, range.int = c(-Inf, Inf), range.theta = c(-10, 10))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ltm.obj}{
An object representing an IRT model of a set of items, from the ltm package (e.g., using the \code{ltm}, \code{grm}, or \code{gpcm} functions).
}
  \item{logL.fun}{
A function returning the log-likelihood for a response vector (see details).
}
  \item{fscore.obj}{
A \code{factor.scores} from the ltm package.
}
  \item{data}{
A matrix of response patterns.
}
  \item{prior}{
A prior density function, taking a quantile and returning its density.
}
  \item{theta0}{
Optional. A latent trait value, vector of values, \option{"max.prior"} (see details), or \option{NULL}. \option{theta0 = NULL} by default.
}
  \item{range.int}{
The range to integrate over in calculating the marginal likelihood and Lindley information.
}
  \item{range.theta}{
The range of the latent variable to search over if \option{theta0="max.prior"} is specified. 
}
}
\details{
This function will calculate Lindley information values for each response pattern in a set, and return the expected Lindley information for the set as a whole. It will also optionally return the log-likelihood value for a hypothesized latent trait value of interest, together with the significance of the change from prior to posterior probability of that trait value. 

A set of response patterns must be supplied, using either a \code{factor.scores} object or a data matrix. A prior density function must also be supplied. 

Additionally, either \option{ltm.obj} or \option{logL.fun} must be supplied. If a log-likelihood function is supplied directly, it must take three arguments: \option{z}, a vector of latent trait values, \option{dat}, a data matrix, and \option{i}, a row index. \option{logL.fun} must return the vector of log-likelihoods for the vector of latent trait values, for a single response pattern (i.e., the function must return the vector of log-likelihoods for the trait vector \option{z}, for the response pattern in row \option{i} of data matrix \option{dat}). 

\code{iota} will also optionally return a p-value for the null hypothesis of no change from the prior to posterior probability of a specific latent trait value. \option{theta0} specifies the latent trait value. If \option{theta0} is a scalar, it is assumed to be the latent trait value of interest. If \option{theta0} is a vector, it must be equal in length to the number of unique response patterns in \option{fscore.obj} or \option{data}, where each value in the vector is assumed to correspond to each response pattern. Finally, the latent trait with the greatest prior density (over the range \option{range.theta}) can be specified with \option{theta0="max prior"}. By default, \option{theta0=NULL}, specifying that no log-likelihods or p-values should be returned.

Note that currently, \option{range.int} must be within [-10, 10] for \code{grm} and \code{gpcm} objects. If a \code{grm} or \code{gpcm} object is supplied and \option{range.int} is outside this range, the range will be reset to [-10, 10].   

}
\value{
A list with the following elements:

\item{I}{The expected Lindley information over the set of response patterns.}
\item{I.x}{The vector of Lindley information values for each response pattern.}
\item{p.x}{The marginal probabilities for each response pattern.}

Additionally, if \option{theta0} is not \option{NULL}:

\item{logL0}{The vector of log-likelihoods for the latent trait values specified by \option{theta0}.}
\item{logNL0.pval}{The p-values for the null hypothesis test of no change from prior to posterior probability of the latent trait values specified by \option{theta0}.}
}
\references{
Markon, K. E. (2013). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods, 18, 15-35. doi: 10.1037/a0030638..
}
\author{
Kristian E. Markon
}

\seealso{
\code{\link{Jeffreys}}, \code{\link{ltm}}, \code{\link{grm}}, \code{\link{gpcm}}, \code{\link{factor.scores}}
}
\examples{
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)
Nu.lsat = nrow(unique(LSAT))
	
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat))
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat), theta0=c("max.prior"))
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat), theta0=0)
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat), theta0=rnorm(Nu.lsat))
	
}

\keyword{ models }
