% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quickDiagnostics.R
\name{quickDiagnostics}
\alias{quickDiagnostics}
\title{Plots daily/annual series and the annual correlation map of different grid objects}
\usage{
quickDiagnostics(obs, raw, downscaled = NULL, location = NULL,
  type = c("daily", "interannual"), members = NULL, na.tolerance = 0.3,
  ylim = NULL, main = NULL)
}
\arguments{
\item{obs}{grid of observations.}

\item{raw}{grid of model data.}

\item{downscaled}{Optional. grid of the downscaling output.}

\item{location}{Coordinates of a location in the geographic domain of 'obs'. 
If NULL it is randomly chosen from coordinates in 'obs'.}

\item{type}{Character value, either \code{"daily"} or \code{"interannual"}, indicating is the assessment is to
be performed on a daily or interannual basis.}

\item{members}{An integer vector indicating \strong{the position} of the members to be subset. 
If NULL all members are considered when type = "interannual" and one member is randomly chosen when type = "daily".}

\item{na.tolerance}{proportion of NAs in a grid cell (location) that are allowed to calculate correlation.}

\item{ylim}{'ylim' argument passed to the time series plot.}

\item{main}{'main' argument passed to the plot.}
}
\value{
Two diagnostic plots with observed, simulated and (possibly) downscaled time series, and a QQ-plot by percentlies.
}
\description{
Plots daily/annual series and the annual correlation map of different grid objects
}
\examples{
{
data("VALUE_Iberia_pr")
data("NCEP_Iberia_pr")
y <- VALUE_Iberia_pr
x <- NCEP_Iberia_pr
x$Data <- x$Data*86400
quickDiagnostics(obs = y, raw = x, location = c(-2, 43), type = "daily")
quickDiagnostics(obs = y, raw = x, location = c(-2, 43), type = "interannual")
eqm1win <- biasCorrection(y = y, x = x, 
                          method = "eqm",
                          extrapolation = "none",
                          window = c(31, 1))
quickDiagnostics(y, x, eqm1win)
quickDiagnostics(y, x, eqm1win, location = c(-2, 43))
quickDiagnostics(obs = y, raw = x, downscaled = eqm1win, location = c(-2, 43), type = "interannual")
}
}
\author{
M. Iturbide
}
