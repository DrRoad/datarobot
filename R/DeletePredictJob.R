#' Function to delete one predict job from the DataRobot queue
#'
#' This function deletes the predict job specified by predictJobId from
#' the DataRobot queue.
#'
#' @inheritParams DeleteProject
#' @inheritParams GetPredictions
#' @return Logical TRUE and displays a message to the user if the delete
#' request was successful; otherwise, execution halts and an error message
#' is displayed.
#' @examples
#' \dontrun{
#'   projectId <- "59a5af20c80891534e3c2bde"
#'   initialJobs <- GetPredictJobs(project)
#'   job <- initialJobs[[1]]
#'   predictJobId <- job$predictJobId
#'   DeletePredictJob(projectId, predictJobId)
#' }
#' @export
DeletePredictJob <- function(project, predictJobId) {
  projectId <- ValidateProject(project)
  routeString <- UrlJoin("projects", projectId, "predictJobs", predictJobId)
  response <- DataRobotDELETE(routeString, addUrl = TRUE)
  message(paste("Predict job", predictJobId, "deleted from project", projectId))
}
