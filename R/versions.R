#' GTM version list
#'
#' Downloads all GTM versions for a defined container ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_container_version <- function(accountId, containerId){
  gtm_list_environments(accountId, containerId) -> ge
  max(as.numeric(ge$environment.containerVersionId), na.rm = TRUE)
}