.onLoad <- function(libname, pkgname) {

  reticulate::configure_environment("ropenms")

  packageStartupMessage("You have successfully loaded ropenms!!")
}
