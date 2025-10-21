library(plumber)
pr <- pr("api.R")
pr <- pr_filter(pr, "cors", function(req, res){
  res$setHeader("Access-Control-Allow-Origin", "*")
  res$setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
  res$setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization")
  if (req$REQUEST_METHOD == "OPTIONS") { res$status <- 200; return(list()) }
  forward()
})
pr_run(pr, host = "0.0.0.0", port = 8000)
