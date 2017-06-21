#' List GTM accounts
#'
#' @return Dataframe of accountId, name
#'
#' @export
gtm_list_containers <- function(accountId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers",
                       accountId)
  
  containers <- googleAuthR::gar_api_generator(build_url,
                                               "GET",
                                               data_parse_function = function(x) x)
  
  out <- try(containers())
  if(assertthat::is.error(out)){
    out <- NULL
  }
  
  out
  
}

#' Get individual GTM account detail
#'
#' @param accountId accountId to request
#' @param containerId GTM containerId
#'
#' @return container info
#' @export
gtm_get_container <- function(accountId,
                              containerId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers/%s",
                       accountId, containerId)
  
  container <- googleAuthR::gar_api_generator(build_url,
                                              "GET",
                                              data_parse_function = function(x) x)
  
  container()
  
}