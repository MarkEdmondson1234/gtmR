#' GTM users list
#'
#' Downloads all users that have access to the account
#'
#' @param accountId Add your GTM account ID
#' @export
#'
gtm_list_users <- function(accountId){
  acc_url <- "https://www.googleapis.com/tagmanager/v2/accounts"
  user_url <- paste(acc_url, "/",accountId,"/user_permissions", sep = "")
  f_perm <- gar_api_generator(user_url,
                              "GET")
  permissions_list <- f_perm()
  permissions_list$content$userAccess$accountAccess$permission <- unlist(permissions_list$content$userAccess$accountAccess$permission)
  permissions_list$content$userAccess$accountAccess <- permissions_list$content$userAccess$accountAccess$permission
  as.data.frame(permissions_list$content)
}