#' List GTM accounts
#'
#' @export
gtm_list_accounts <- function(){

  acc <- googleAuthR::gar_api_generator("https://www.googleapis.com/tagmanager/v1/accounts",
                                        "GET")

  acc()$content

}
