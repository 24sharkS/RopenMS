#' FeatureMap Interface
#'
#' @section Constructor: FeatureMap$new()
#'
#' @section Methods:
#' \code{$getFeature()} Get specific feature by index.
#'
#' @name FeatureMap
#' @include package.r
NULL

#' @export
FeatureMap <- R6::R6Class("FeatureMap",cloneable = FALSE,
               private = list(
                 py_obj = NULL
               ),

               public = list(

                 initialize = function(){
                   private$py_obj <- get_python_obj()$FeatureMap()
                 },

                  #' @description Get specfic feature by index.
                  #'
                  #' @param index index of feature.
                  #'
                  #' @return Feature object.
                  getFeature = function(index){
                      # wrapping the python object.
                      if(as.integer(index) <= 0) stop("index must be > 0")
                      feat <- Feature$new()
                      feat$set_py_obj(private$py_obj[index-1])
                      return(feat)
                  },

                  #' @description
                  #' Setter method for wrapped object.
                  #' @details
                  #' Sets the underlying python object of FeatureMap.
                  set_py_obj = function(Py_obj){
                     private$py_obj <- Py_obj
                     invisible(self)
                  },

                  #' @description
                  #' Getter method for wrapped object.
                  #' @details
                  #' Returns the underlying python object of FeatureMap.
                  get_py_obj = function(){
                   return(private$py_obj)
                  }


               )
)
