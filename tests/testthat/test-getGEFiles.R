context("ISCon$getGEFiles()")

# Connections --------------------------------------------------
sdy269 <- CreateConnection("SDY269", verbose = TRUE)
sdy67 <- suppressMessages(CreateConnection("SDY67"))
allsdy <- CreateConnection("")


# Helper Functions ---------------------------------------------
getFileList <- function(con) {
  gef <- con$getDataset("gene_expression_files")
  nms <- unique(gef$name)
  if (length(nms) > 5) {
    nms <- nms[1:5]
  }
  return(nms)
}

try_ggef <- function(con) {
  files <- getFileList(con)
  tryCatch(
    capture.output(con$getGEFiles(files = files[1:5]), destdir = destdir),
    warning = function(w) return(w),
    error = function(e) return(e)
  )
}
