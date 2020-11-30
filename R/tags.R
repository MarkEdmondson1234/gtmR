#' GTM tags list
#'
#' Downloads all GTM tags that are enabled in the current workspace, container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_list_tags <- function(accountId, containerId){
  gtm_workspace_id(accountId, containerId) -> ws
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  f_tag <- gar_api_generator(paste(cont_url,"/",containerId, "/workspaces/",  ws,"/tags/", sep = "") ,
                             "GET")
  tag_list <- f_tag()
  as.data.frame(tag_list$content) -> df_tags
  df_tags[c("tag.paused", "tag.notes")[!(c("tag.paused", "tag.notes") %in% colnames(df_tags))]] = FALSE
  df_tags[,c("tag.tagId", "tag.name", "tag.type", "tag.parentFolderId", "tag.paused", "tag.notes")] -> df_tags
}