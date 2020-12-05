#' GTM workspace list
#'
#' Downloads all GTM workspaces for a defined container ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_list_workspaces <- function(accountId, containerId) {
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  env_url <- paste(cont_url,"/",containerId, "/workspaces", sep = "")
  f_env <- gar_api_generator(env_url, "GET")
  env <- f_env()
  as.data.frame(env$content)
}

#' GTM current workspace ID
#'
#' Downloads current workspace ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_workspace_id <- function(accountId, containerId){
  gtm_list_workspaces(accountId, containerId) -> ge
  max(as.numeric(ge$workspace.workspaceId), na.rm = TRUE)
}