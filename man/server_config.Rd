% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/static.R
\name{server_config}
\alias{server_config}
\title{Server configurations}
\usage{
server_config(
  dir = ".",
  host = getOption("servr.host", "127.0.0.1"),
  port,
  browser,
  daemon,
  interval = getOption("servr.interval", 1),
  baseurl = "",
  initpath = "",
  hosturl = identity,
  auth = getOption("servr.auth"),
  verbose = TRUE
)
}
\arguments{
\item{dir}{The root directory to serve.}

\item{host}{A string that is a valid IPv4 address that is owned by this
server, or \code{"0.0.0.0"} to listen on all IP addresses.}

\item{port}{The TCP port number. If it is not explicitly set, the default
value will be looked up in this order: First, the command line argument of
the form \code{-pNNNN} (N is a digit from 0 to 9). If it was passed to R
when R was started, \code{NNNN} will be used as the port number. Second,
the environment variable \code{R_SERVR_PORT}. Third, the global option
\code{servr.port} (e.g., \code{options(servr.port = 4322)}). If none of
these command-line arguments, variables, or options were set, the default
port will be \code{4321}. If this port is not available, a random available
port will be used.}

\item{browser}{Whether to launch the default web browser. By default, it is
\code{TRUE} if the R session is \code{\link{interactive}()}, or when a
command line argument \code{-b} was passed to R (see
\code{\link{commandArgs}()}). N.B. the RStudio viewer is used as the web
browser if available.}

\item{daemon}{Whether to launch a daemonized server (the server does not
block the current R session) or a blocking server. By default, it is the
global option \code{getOption('servr.daemon')} (e.g., you can set
\code{options(servr.daemon = TRUE)}); if this option was not set,
\code{daemon = TRUE} if a command line argument \code{-d} was passed to R
(through \command{Rscript}), or the server is running in an interactive R
session.}

\item{interval}{The time interval used to check if an HTML page needs to be
rebuilt (by default, it is checked every second).}

\item{baseurl}{The base URL (the full URL will be
\code{http://host:port/baseurl}).}

\item{initpath}{The initial path in the URL (e.g. you can open a specific
HTML file initially).}

\item{hosturl}{A function that takes the host address and returns a character
string to be used in the URL, e.g., \code{function(host) { if (host ==
'127.0.0.1') 'localhost' else host}} to convert \code{127.0.0.1} to
\code{localhost} in the URL.}

\item{auth}{A list of the form \code{list(scheme, creds)} containing the
authentication scheme and credentials. See
\url{https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication} for
more info. Please note that this argument is \emph{by no means} intended
for serious HTTP applications and there is \emph{no warranty} on security.
You should use other dedicated software packages or services if security is
important. You have been warned.}

\item{verbose}{Whether to print messages when launching the server.}
}
\value{
A list of configuration information of the form \code{list(host,
  port, start_server = function(app) {}, ...)}.
}
\description{
The server functions in this package are configured through this function.
}
\examples{\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# an example of authentication
servr::httd(auth = list(scheme = "Basic", creds = servr::auth_basic("john", "pa$s!")))
\dontshow{\}) # examplesIf}
}
