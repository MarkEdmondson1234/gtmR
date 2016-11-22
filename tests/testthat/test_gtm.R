context("Auth")

test_that("Can authenticate",{
  
  auth <- gtm_auth()
  
  expect_s3_class(auth, "Token2.0")
  
})

context("Accounts")

test_that("List accounts", {
  
  accounts <- gtm_list_accounts()
  
  expect_s3_class(accounts, "data.frame")
  
})

test_that("Get account", {
  
  account <- gtm_get_account(45903216)
  
  expect_equal(account$accountId, "45903216")
  
})

context("Containers")

test_that("List containers", {
  
  cons <- gtm_list_containers(45903216)
  
  expect_s3_class(cons$containers, "data.frame")
  
})

test_that("Get container", {
  
  con <- gtm_get_container(45903216, 1033363)
  
  expect_equal(con$accountId, "45903216")
})

context("Variables")

test_that("Get variables", {
  
  vars <- gtm_list_variables(accountId = 45903216,
                             containerId = 1033363)
  
  expect_equal(vars$variables$accountId[[1]], "45903216")
})

