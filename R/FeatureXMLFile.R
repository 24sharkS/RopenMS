#' FeatureXMLFile Interface
#'
#' @section Constructor: FeatureXMLFile$new()
#'
#' @section Methods:
#' \code{$load()} Load details from MzML file.
#'
#' \code{$store()} Store details in MzML file.
#'
#' @name FeatureXMLFile
#' @include package.r
NULL

#' @export
FeatureXMLFile <- R6::R6Class("FeatureXMLFile",cloneable = FALSE,
                  private = list(
                    py_obj = NULL
                  ),

                  public = list(

                    initialize = function(){
                      private$py_obj <- get_python_obj()$FeatureXMLFile()
                    },

                    #' @description Load Features from FeatureXML file.
                    #'
                    #' @param filename name of file.
                    #' @param fmap FeatureMap object.
                    load = function(filename,fmap){
                      private$py_obj$load(filename,fmap$get_py_obj())
                    },

                    #' @description Store Features into a FeatureXML file.
                    #'
                    #' @param filename name of file.
                    #' @param fmap FeatureMap object.
                    store = function(filename,fmap){
                      private$py_obj$load(filename,fmap$get_py_obj())
                    }
    )
)
