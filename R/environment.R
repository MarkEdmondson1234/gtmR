#' GTM Environment list
#'
#' Downloads all GTM environments for a defined container ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_environment_list <- function(accountId, containerId) {
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  env_url <- paste(cont_url,"/",containerId, "/environments", sep = "")
  f_env <- gar_api_generator(env_url, "GET")
  env <- f_env()
  as.data.frame(env$content)
}