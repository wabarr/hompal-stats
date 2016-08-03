#Be sure to run from the base directory of the project
lapply(list.files(pattern = "*.Rmd",recursive = TRUE), rmarkdown::render)
