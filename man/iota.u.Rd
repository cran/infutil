\name{iota.u}
\alias{iota.u}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Lindley Information (i.e., Information Utility) Upper Bound
}
\description{
This function calculates the upper bound to the Lindley information (i.e., information utility) given a prior.
}
\usage{
iota.u(prior, range.int = c(-Inf, Inf))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{prior}{
a prior in the form of a function.
}
  \item{range.int}{
the range of integration; defaults to c(-Inf, Inf).
}
}
\details{
This function calculates the upper bound to the Lindley information (i.e., information utility) given a prior. It is identical to the entropy of the prior.

Note that the range of integration may have to be changed; the integration function sometimes throws an error with infinite limits. 

}
\value{
The upper bound to the Lindley information; the entropy of the prior. 
}
\references{
Markon, K. E. (2013). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods, 18, 15-35. doi: 10.1037/a0030638..
}
\author{
Kristian E. Markon
}

\seealso{
\code{\link{Jeffreys}}, \code{\link{nmru}}, \code{\link{iota.l}}
}
\examples{
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

iota.u(Jeffreys(ltm.lsat))
iota.u(Jeffreys(ltm.lsat), range.int=c(-20,20))
}
\keyword{ models }
