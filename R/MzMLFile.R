#' MzMLFile Interface
#'
#' @section Constructor: MzMLFile$new()
#'
#' @section Methods:
#' \code{$load()} Load details from MzML file.
#'
#' \code{$store()} Store details in MzML file.
#'
#' @name MzMLFile
#' @include package.r
NULL

#' @export
MzMLFile <- R6::R6Class("MzMLFile",cloneable = FALSE,
            private = list(
              py_obj = ropenms$MzMLFile()
            ),

            public = list(

              #' @description Load details from MzML file.
              #'
              #' @param filename name of the MzML file.
              #' @param exp MSExperiment object.
              load = function(filename,exp){
                private$py_obj$load(filename,exp$get_py_obj())
              },

              #' @description Store details in MzML file.
              #'
              #' @param filename name of the MzML file.
              #' @param exp MSExperiment object.
              store = function(filename,exp){
                private$py_obj$store(filename,exp$get_py_obj())
              }


            )
)
