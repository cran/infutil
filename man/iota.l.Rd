\name{iota.l}
\alias{iota.l}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Lindley Information (i.e., Information Utility) Lower Bound
}
\description{
This function calculates the lower bound to the Lindley information (i.e., information utility) given a Jeffreys prior normalizing constant or ltm object.
}
\usage{
iota.l(x)
}
\arguments{
  \item{x}{
Either an ltm object or a Jeffreys prior normalizing constant. \code{x} can be a scalar or vector. 
}
}
\details{
This function calculates the lower bound to the Lindley information (i.e., information utility) given a Jeffreys prior normalizing constant or ltm object.

\code{x} can be an object from the ltm package describing a set of IRT parameters (e.g., as returned by \code{ltm}, \code{grm}, or \code{gpcm}).

If \code{x} is a vector, the function will return a vector of lower bounds. 
}
\value{
A lower bound to the Lindley information, or a vector of lower bounds for different sets of items. 
}
\references{
Markon, K. E. (in press). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods.
}
\author{
Kristian E. Markon
}

\seealso{
\code{\link{Jeffreys}}, \code{\link{iota.c}}, \code{\link{nmru}}, \code{\link{iota}}, \code{\link{ltm}}, \code{\link{grm}}, \code{\link{gpcm}} 
}
\examples{
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

iota.l(ltm.lsat)
iota.l(Jeffreys(ltm.lsat, return="nc"))
}
\keyword{ models }

