\name{Jeffreys}
\alias{Jeffreys}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Jeffreys Prior and Normalizing Constant
}
\description{
This function returns the Jeffreys prior for an IRT model in the form of a density function, and optionally the normalizing constant of that prior.
}
\usage{
Jeffreys(ltm.obj = NULL, inf.mat = NULL, inf.func = NULL, return = "prior", spl.method = "natural", range.int = c(-Inf, Inf))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ltm.obj}{
An object representing an IRT model of a set of items, from the ltm package (e.g., using the \code{ltm}, \code{grm}, or \code{gpcm} functions). 
}
  \item{inf.mat}{
A two-column matrix representing the information function evaluated at a set of latent trait values, with the first column being the latent trait values and the second column the information at each value (e.g., as returned by the ltm \code{plot} function).
}
  \item{inf.func}{
An information function; a function taking a latent trait value and returning the information at that value. 
}
  \item{return}{
The value(s) to be returned. \option{"prior"} returns the prior as a function; \option{"nc"} returns the normalizing constant; \option{"both"} returns both as a list. 
}
  \item{spl.method}{
A \code{splinefun} method to use in constructing an information function; only used if \option{inf.mat} is supplied.
}
  \item{range.int}{
The range to integrate over in calculating the normalizing constant. 
}
}
\details{
Only one of \option{ltm.obj}, \option{inf.mat}, or \option{inf.function} should be supplied. An \option{inf.mat} matrix can be obtained using the plot function in the ltm package, with the options \option{type="IIC"}, \option{item=0}, and \option{plot=F}. As the information function must be interpolated when \option{inf.mat} is supplied (using \code{splinefun}), supplying an ltm object or information function directly will generally be more accurate. If \option{inf.mat} is supplied, the information should be evaluated at a large number of points over a wide range, to maintain accuracy.

Note that currently, \option{range.int} must be within (-10, 10) for \code{grm} and \code{gpcm} objects. If a \code{grm} or \code{gpcm} object is supplied and \option{range.int} is outside this range, the range will be reset.   

}	
\value{
If \option{return="prior"}, the default, a function taking a latent trait value and returning the Jeffreys prior density at that point. If \option{return="nc"}, the normalizing constant used to calculate the Jeffreys prior and also the lower bound to the Lindley information. If \option{return="both"}, a list having the following structure:

\item{prior}{The Jeffreys prior density as a function.}
\item{nc}{The normalizing constant.}

}
\references{
Markon, K. E. (in press). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods.
}
\author{
Kristian E. Markon
}
\seealso{
\code{\link{rJeffreys}}, which randomly generates latent trait values distributed asccording to a Jeffreys prior density, and \code{\link{iota}} and \code{\link{iota.c}}, which calculate Lindley information quantities, possibly using the Jeffreys prior. Also see \code{\link{splinefun}}, \code{\link{ltm}}, \code{\link{grm}}, and \code{\link{gpcm}}.
}
\examples{
# using an ltm object
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

jp.lsat <- Jeffreys(ltm.lsat)
jp.lsat(0)

# using inf.mat
inf.lsat <- plot(ltm.lsat, type="IIC", item=0, plot=FALSE, z=seq(-15, 15, length=10000))

jp.lsat <- Jeffreys(inf.mat=inf.lsat)
jp.lsat(0)

# returning normalizing constant
Jeffreys(ltm.lsat, return="nc")
Jeffreys(inf.mat=inf.lsat, return="nc")

}
\keyword{ distributions }
\keyword{ models }
