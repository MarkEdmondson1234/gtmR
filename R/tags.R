#' List Tags for an account
#'
#' @return Dataframe of accountId, name, ...
#'
#' @param accountId The GTM Account ID
#' @param containerId The GTM Container ID
#' @export

gtm_list_tags <- function(accountId,containerId) {
  url <- paste0("https://www.googleapis.com/tagmanager/v1/accounts/",accountId,"/containers/",containerId,"/tags")
  # tagmanager.tags.list
  tags <- googleAuthR::gar_api_generator(url, "GET", data_parse_function = function(x) x)
  tags()
}
