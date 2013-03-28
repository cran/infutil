\name{rJeffreys}
\alias{rJeffreys}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Randomly generate values distributed according to a Jeffreys prior
}
\description{
This function generates values distributed according to a Jeffreys prior, using the probability integral transform. 
}
\usage{
rJeffreys(n, prior, range.int = c(-Inf, Inf))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
The number of values to be generated.
}
  \item{prior}{
A prior density in the form of a function, such as that returned by \code{Jeffreys}.
}
  \item{range.int}{
The integration range used in generating random deviates. 
}
}
\details{
This function generates random values distributed according to a Jeffreys prior (e.g., as used to estimate the criterion information utility) using the generalized inverse transformation of random uniform (0,1) values.

The prior must be specified as a function taking a quantile and returning a density, such as is returned by \code{Jeffreys} (note that \option{prior} could be any density function, not just a Jeffreys prior, in which case it would return random deviates distributed according to that density). 

}
\value{
A vector of values distributed according to the density specified by the \option{prior} function.
}
\references{
Robert, C. P., & Casella, G. (1999). Monte Carlo statistical methods. New York: Springer.
	
Markon, K. E. (2013). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods, 18, 15-35. doi: 10.1037/a0030638..
}
\author{
Kristian E. Markon
}
\seealso{
\code{Jeffreys}, which can be used to create a prior density function; also, \code{iota.c}, which uses rJeffreys to estimate the criterion information utility.
}
\examples{
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)
rJeffreys(100, Jeffreys(ltm.lsat))
}
\keyword{ distributions }
\keyword{ models }
