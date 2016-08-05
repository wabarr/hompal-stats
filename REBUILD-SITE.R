#Be sure to run from the base directory of the project

tryRender <- function(x){
  tryCatch(
  rmarkdown::render(x)
  , error = function(e) print("Error rendering markdown")
  )
}
lapply(list.files(pattern = "*.Rmd",recursive = TRUE), tryRender)
