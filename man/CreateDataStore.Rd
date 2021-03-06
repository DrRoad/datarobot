% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataStores.R
\name{CreateDataStore}
\alias{CreateDataStore}
\title{Create a data store.}
\usage{
CreateDataStore(type, canonicalName, driverId, jdbcUrl)
}
\arguments{
\item{type}{character. The type of data store.}

\item{canonicalName}{character. The user-friendly name of the data store.}

\item{driverId}{character. The ID of the driver to use.}

\item{jdbcUrl}{character. The full JDBC url.}
}
\description{
Create a data store.
}
\examples{
\dontrun{
 CreateDataStore(type = "jdbc",
                 canonicalName = "Demo DB",
                 driverId = "57a7c978c808916f4a630f89",
                 jdbcUrl = "jdbc:postgresql://my.db.address.org:5432/my_db")
}
}
