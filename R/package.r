ropenms <- NULL

.onLoad <- function(libname, pkgname) {

  ropenms <<- reticulate::import("pyopenms", delay_load = TRUE)
  packageStartupMessage("you have loaded this package")

}

#' To get ropenms object
get_python_obj <- function(){
  return(ropenms)
}
