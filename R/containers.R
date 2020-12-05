#' GTM container list
#'
#' Downloads all GTM containers for a defined account ID
#'
#' @param accountId Add your GTM account ID to get the list of containers
#' @export
#'
gtm_list_containers <- function(accountId){
  acc_url <- "https://www.googleapis.com/tagmanager/v2/accounts"
  f_con <- gar_api_generator(paste(acc_url, "/",accountId,"/containers", sep = ""),
                             "GET")
  c<- f_con()
  as.data.frame(c$content)
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