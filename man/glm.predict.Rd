% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/downscale.predict.R
\name{glm.predict}
\alias{glm.predict}
\title{Donwscaling with a given generalized linear model (GLM).}
\usage{
glm.predict(x, weights)
}
\arguments{
\item{x}{The grid data. Class: matrix.}

\item{weights}{Object as returned from \code{\link[downscaleR]{glm.train}}}
}
\value{
The predicted matrix.
}
\description{
Donwscaling with a given generalized linear models (GLM) calculated in \code{\link[downscaleR]{downscale.predict}} via \code{\link[downscaleR]{glm.train}}.
}
\details{
Predicts by using the base function \code{\link[stats]{predict}}. This function is internal and should not be used by the user. The user should use \code{\link[downscaleR]{downscale.predict}}.
}
\author{
J. Bano-Medina
}
