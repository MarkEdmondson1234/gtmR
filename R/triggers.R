#' GTM triggers list
#'
#' Downloads all GTM triggers that are enabled in the current workspace, container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_list_triggers <- function(accountId, containerId){
  gtm_workspace_id(accountId, containerId) -> ws
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  tri_url <- paste(cont_url,"/",containerId, "/workspaces/",  ws, "/triggers", sep = "")
  f_tri <- gar_api_generator(tri_url,
                             "GET")
  t <- f_tri()
  as.data.frame(t$content) -> t
  t[c("trigger.parentFolderId", "trigger.notes")[!(c("trigger.parentFolderId", "trigger.notes") %in% colnames(t))]] = FALSE
  t[,c("trigger.triggerId", "trigger.name", "trigger.type", "trigger.parentFolderId","trigger.notes")] -> t
}