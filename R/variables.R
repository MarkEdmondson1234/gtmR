#' List GTM variables
#' 
#' @param accountId GTM account ID
#' @param containerId GTM Container ID
#'
#' @return Dataframe of accountId, name
#' @export
gtm_list_variables <- function(accountId,
                               containerId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers/%s/variables",
                       accountId, containerId)
  
  vars <- googleAuthR::gar_api_generator(build_url,
                                         "GET",
                                         data_parse_function = function(x) x)
  
  vars()
  
  
}

#' Get GTM variables
#' 
#' @inheritParams gtm_list_variables
#' @param variableID The GTM variable ID
#'
#' @return Dataframe of accountId, name
#' 
#' @seealso \href{https://developers.google.com/tag-manager/api/v1/reference/accounts/containers/variables/get}{Google Docs}
#'
#' @export
gtm_get_variables <- function(accountId,
                              containerId,
                              variableId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers/%s/variables/%s",
                       accountId, containerId, variableId)
  
  vars <- googleAuthR::gar_api_generator(build_url,
                                        "GET",
                                        data_parse_function = function(x) x)
  
  vars()
  
}
