#' Retrieve information about (model and predict) jobs
#'
#' This function requests information about the jobs that go through the
#' DataRobot queue (currently just model jobs and predict jobs).
#'
#' @inheritParams GetPredictJobs
#'
#' @return A list of lists with one element for each job. The named list for
#' each job contains:
#' \describe{
#'   \item{status}{job status ("inprogress", "queue", or "error")}
#'   \item{url}{URL to request more detail about the job (character)}
#'   \item{id}{job id (character).}
#'   \item{jobType}{Job type (JobTypes$Model or JobTypes$Predict)}
#'   \item{projectId}{the id of the project that contains the model (character).}
#' }
#' @export
#'
ListJobs <- function(project, status = NULL) {
  projectId <- ValidateProject(project)
  query <- if (is.null(status)) NULL else list(status = status)
  routeString <- UrlJoin("projects", projectId, "jobs")
  jobsResponse <- DataRobotGET(routeString, addUrl = TRUE, query = query, simplifyDataFrame = FALSE)
  jobs <- jobsResponse$jobs
  return(jobs)
}

#' Cancel a running job
#'
#' @param job The job you want to cancel (one of the items in the list returned from ListJobs)
#'
#' @export
#'
DeleteJob <- function(job) {
  if (!("url" %in% names(job))) {
    stop("The job has no `url` field. This function requires a job like from ListJobs.")
  }
  return(invisible(DataRobotDELETE(job$url, addUrl = FALSE)))
}