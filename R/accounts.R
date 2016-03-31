#' List GTM accounts
#'
#' @return Dataframe of accountId, name
#'
#' @export
gtm_list_accounts <- function(){

  acc <- googleAuthR::gar_api_generator("https://www.googleapis.com/tagmanager/v1/accounts",
                                        "GET")

  acc()$content[[1]]

}

#' Get individual GTM account detail
#'
#' @param accountId accountId to request
#'
#' @return account data list of $accountId, $name, $shareDate, $fingerprint
#' @export
gtm_get_account <- function(accountId){

  acc <- googleAuthR::gar_api_generator("https://www.googleapis.com/tagmanager/v1/",
                                        "GET",
                                        path_args = list(accounts = accountId))

  acc()$content

}


#' Change GTM account detail
#'
#' Requires https://www.googleapis.com/auth/tagmanager.manage.accounts scope
#'
#' @param accountId accountId to request
#' @param name name to change, NULL to leave as is
#' @param shareData shareData to change, NULL to leave as is
#' @param fingerprint When provided, account fingerprint must match
#'
#' @return account data with modified fields
#' @export
gtm_change_account <- function(accountId,
                               name=NULL,
                               shareData=NULL,
                               fingerprint=NULL){

  body <- list(
    name = name,
    shareData = shareData
  )

  body <- rmNullObs(body)

  acc <- googleAuthR::gar_api_generator("https://www.googleapis.com/tagmanager/v1/",
                                        "PUT",
                                        path_args = list(accounts = accountId),
                                        pars_args = list(fingerprint = fingerprint))

  acc(the_body = body)$content[[1]]

}
