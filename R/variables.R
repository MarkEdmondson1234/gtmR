#' List GTM variables
#' 
#' @param accountId GTM account ID
#' @param containerId GTM Container ID
#'
#' @return Dataframe of accountId, name
#' @export
gtm_list_variables <- function(accountId,
                               containerId){
  
  # build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers/%s/variables",
  #                      accountId, containerId)
  # 
  # vars <- googleAuthR::gar_api_generator(build_url,
  #                                        "GET",
  #                                        data_parse_function = function(x) x)
  # 
  # vars()
  
  gtm_workspace_id(accountId, containerId) -> ws
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  var_url <- paste(cont_url,"/",containerId, "/workspaces/",  ws, "/variables", sep = "")
  f_var <- gar_api_generator(var_url,
                             "GET")
  variable_list <- f_var()
  as.data.frame(variable_list$content)
  
}

#' Get GTM variables
#' 
#' @inheritParams gtm_list_variables
#' @param variableId The GTM variable ID
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

#' GTM builtin Variables list
#'
#' Downloads all GTM Builtin Variables (name and type) that are enabled in the current workspace, container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_list_builtin <- function(accountId,containerId){
  gtm_workspace_id(accountId,containerId) -> v
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  ver_url <- paste(cont_url,"/",containerId, "/workspaces/",v, "/built_in_variables", sep = "")
  f_ver <- googleAuthR::gar_api_generator(ver_url,
                                          "GET")
  ver_list <- f_ver()
  ver_list$content$builtInVariable[,c("name", "type")]
  
}
