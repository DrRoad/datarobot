#' Request an approximation of a model using DataRobot Prime
#'
#' This function wll create several rulesets that approximate the specified model.
#' The code used in the approximation can be downloaded to be run locally.
#' Currenly only Python and Java downloadable code is available
#'
#' General workflow of creating and downloading Prime code may look like following:
#' RequestApproximation - create several rulestes that approximate the specified model
#' GetRulesets - list all rulesests created for the parent model
#' RequestPrimeModel - create Prime model for specified ruleset (use one of rulesets return by
#'   GetRulests)
#' GetPrimeModelFromJobId - get PrimeModelId using JobId returned by RequestPrimeModel
#' CreatePrimeCode - create code for one of available Prime models
#' GetPrimeFileFromJobId - get PrimeFilelId using JobId returned by CreatePrimeCode
#' DownloadPrimeCode - download specified Prime code file
#'
#' @inheritParams DeleteProject
#' @param modelId character. Unique alphanumeric identifier for the model of interest.
#' @return job Id
#' @examples
#' \dontrun{
#'   projectId <- "59a5af20c80891534e3c2bde"
#'   modelId <- "5996f820af07fc605e81ead4"
#'   RequestApproximation(projectId, modelId)
#' }
#' @export
RequestApproximation <- function(project, modelId) {
  projectId <- ValidateProject(project)
  routeString <- UrlJoin("projects", projectId, "models", modelId, "primeRulesets")
  rawResponse <- DataRobotPOST(routeString, addUrl = TRUE, returnRawResponse = TRUE)
  routeString <- UrlJoin("projects", projectId, "jobs", JobIdFromResponse(rawResponse))
  jobsResponse <- DataRobotGET(routeString, addUrl = TRUE, query = NULL, simplifyDataFrame = FALSE)
  return(jobsResponse$id)
}
