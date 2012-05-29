\name{infutil-package}
\alias{infutil-package}
\docType{package}
\title{
Information Utility for Item Response Models
}
\description{
This package contains functions for calculating information utility (i.e., Lindley information) quantities for item response models. It requires the ltm package.

Functions are available for calculating the Jeffreys prior for IRT models, calculating the information utility for individual response vectors, calculating the expected information utility for a set of response vectors, and estimating the criterion information utility.    
}
\details{
\code{Jeffreys} calculates the Jeffreys prior for IRT models, and optionally returns the normalizing constant used in calculating the prior.

\code{iota} returns the expected information utility for a set of response vectors, together with the individual information utilities, and optionally tests for a change from the prior to posterior probability of a latent trait value.

\code{iota.c} returns an estimate of the criterion information utility and its standard error.

\code{rJeffreys} randomly generates latent trait values from a Jeffreys prior distribution.
	
}
\author{
Kristian E. Markon
}
\references{
Markon, K. E. (in press). Information utility: Quantifying the total psychometric information provided by a measure. Psychological Methods.
}
\keyword{ distributions }
\keyword{ models }
