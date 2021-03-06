% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SetupProject.R
\name{SetupProjectFromOracle}
\alias{SetupProjectFromOracle}
\title{Function to set up a new DataRobot project using data from Oracle table}
\usage{
SetupProjectFromOracle(dbq, table, username, fetchBufferSize = NULL,
  projectName = NULL, password = NULL, encryptedPassword = NULL,
  maxWait = 60 * 60)
}
\arguments{
\item{dbq}{character. tnsnames.ora entry in host:port/sid format}

\item{table}{character. The name of the table to fetch.}

\item{username}{character. The username to use to access the database}

\item{fetchBufferSize}{integer. Optional. If specified, specifies the size of buffer
that will be used to stream data from the database. Otherwise will use DataRobot default value.}

\item{projectName}{character. Optional String specifying a project name.}

\item{password}{character. Optional. The plaintext password to be used to access MySQL
database. Will be first encrypted with DataRobot. Only use this or
\code{encryptedPassword}, not both.}

\item{encryptedPassword}{character. Optional. The encrypted password to be used to access
MySQL database. Only use this or \code{password}, not both.}

\item{maxWait}{integer. The maximum time to wait for each of two steps: (1) The initial project
creation request, and (2) data processing that occurs after receiving the response to this
initial request.}
}
\value{
This function returns a list with the following four components:
\describe{
  \item{projectName}{The name assigned to the DataRobot project}
  \item{projectId}{The unique alphanumeric project identifier for this DataRobot project}
  \item{fileName}{The name of the CSV modeling file uploaded for this project}
  \item{created}{Character string containing the time and date of project creation}
}
}
\description{
This function returns the projectName specified in the
calling sequence, the unique alphanumeric identifier projectId for the new
project, the name of the modeling dataset uploaded to create this project,
and the project creation time and date.
}
\examples{
\dontrun{
  SetupProjectFromOracle(dbq = 'localhost:4001/sid',
                         table = 'myTable',
                         user = 'oracleUser')
}
}
