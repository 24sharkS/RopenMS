ropenms <- reticulate::import("pyopenms")

.onLoad <- function(libname, pkgname) {

  ropenms <<- reticulate::import("pyopenms", delay_load = TRUE)
  packageStartupMessage("you have loaded this package")

}

#get_python_obj <- function(){
#  return(ropenms)
#}
