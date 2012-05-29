\name{nmru}
\alias{nmru}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Normalized Minimum Reduction in Uncertainty
}
\description{
This function calculates the normalized minimum reduction in uncertainty (NMRU) for a test, given an item response model. 
}
\usage{
nmru(ltm.obj, range.int = c(-Inf, Inf))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ltm.obj}{
An object representing an IRT model of a set of items, from the ltm package (e.g., using the \code{ltm}, \code{grm}, or \code{gpcm} functions).
}
  \item{range.int}{
the range of integration; defaults to c(-Inf, Inf).
}
}
\details{
This function calculates the normalized minimum reduction in uncertainty (NMRU) for a test, given an item response model. It is equal to the information utility lower bound divided by the upper bound (which are returned by \code{iota.l} and \code{iota.u}, respectively. The NMRU is a normalized mutual information index, where the mutual information between the data and trait estimate is normalized by the entropy of the prior. 

Note that the range of integration may have to be changed; the integration function sometimes throws an error with infinite limits.
}
\value{
\item{val}{the NMRU value.}
\item{iota.l}{the information utility lower bound.}
\item{iota.u}{the information utility upper bound.}
}
\references{
Markon, K. E. (in press). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods.
}
\author{
Kristian E. Markon
}

\seealso{
\code{\link{iota.l}}, \code{\link{iota.u}}, \code{\link{ltm}}, \code{\link{grm}}, \code{\link{gpcm}}
}
\examples{
# five items
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

nmru(ltm.lsat)
nmru(ltm.lsat, range.int=c(-20,20))

# seven items
ltm.lsat <- ltm(cbind(LSAT, LSAT[,1:2])~z1, IRT=FALSE)

nmru(ltm.lsat)

# ten items
ltm.lsat <- ltm(cbind(LSAT, LSAT)~z1, IRT=FALSE)

nmru(ltm.lsat)


}
\keyword{ models }
