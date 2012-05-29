\name{iota.c}
\alias{iota.c}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimate the Criterion Information Utility
}
\description{
This function provides Monte Carlo estimates of the criterion information utility.
}
\usage{
iota.c(ltm.obj, M = NULL, prior = NULL, logL.fun = NULL, rirm = NULL, range.int = c(-Inf, Inf))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ltm.obj}{
An object representing an IRT model of a set of items, from the ltm package (e.g., using the \code{ltm}, \code{grm}, or \code{gpcm} functions).
}
  \item{M}{
The number of Monte Carlo replications. 
}
  \item{prior}{
A reference prior density function, taking a quantile and returning its density under the reference prior.
}
  \item{logL.fun}{
A function returning the log-likelihood for a response vector (see details).
}
  \item{rirm}{
A function that randomly generates a matrix of response patterns under the item response model (see details).
}
  \item{range.int}{
The range to integrate over in calculating the marginal likelihood.
}
}
\details{
This function will estimate the criterion information utility for a set of items under an IRT model, using Monte Carlo simulation. It will also return the standard error of the estimate, as well as the individual information utilities and marginal likelihoods for each simulated response pattern.

Either \option{ltm.obj} or \option{logL.fun} must be supplied. If a log-likelihood function is supplied directly, it must take three arguments: \option{z}, a vector of latent trait values, \option{dat}, a data matrix, and \option{i}, a row index. \option{logL.fun} must return the vector of log-likelihoods for the vector of latent trait values, for a single response pattern (i.e., the function must return the vector of log-likelihoods for the trait vector \option{z}, for the response pattern in row \option{i} of data matrix \option{dat}).

The number of Monte Carlo replications \option{M} must be supplied.

If an \option{ltm.obj} object is not specified, the reference prior in the form of a density function must also be supplied. In that situation, a function that randomly generates a matrix of response patterns must also be supplied to \option{rirm}. The \option{rirm} function must take as its first argument a number of response patterns \option{M}, and as the second argument a vector of latent trait values \option{m.theta}, returning a matrix of response patterns.   

If an \option{ltm.obj} object is specified, the reference prior is assumed to be the Jeffreys prior, and \option{rirm} is assumed to be the IRT model used to create \option{ltm.obj}. 

Note that currently, \option{range.int} must be within [-10, 10] for \code{grm} and \code{gpcm} objects. If a \code{grm} or \code{gpcm} object is supplied and \option{range.int} is outside this range, the range will be reset to [-10, 10]. 

}
\value{
A list with the following components:	
	
\item{I}{The estimated criterion information utility.}
\item{se.I}{The standard error of the estimated criterion information utility.}
\item{I.x}{The vector of Lindley information values for each simulated response pattern.}
\item{p.x}{The marginal probabilities for each simulated response pattern.}

}
\references{
Markon, K. E. (in press). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods.
}
\author{
Kristian E. Markon
}

\seealso{
\code{\link{iota}}, \code{\link{rJeffreys}}, \code{\link{Jeffreys}}, \code{\link{ltm}}, \code{\link{grm}}, \code{\link{gpcm}}
}
\examples{
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)	
iota.c.lsat <- iota.c(ltm.lsat, M=500)
iota.c.lsat

}

\keyword{ models }
