#' FeatureMap Interface
#'
#' @section Constructor: FeatureMap$new()
#'
#' @section Methods:
#' \code{$getFeature()} Get specific feature by index.
#'
#' @name FeatureMap
#' @include ropenms-global.R
NULL

#' @export
FeatureMap <- R6::R6Class("FeatureMap",cloneable = FALSE,
               private = list(
                 py_obj = ropenms$FeatureMap()
               ),

               public = list(

                  #' @description Get specfic feature by index.
                  #'
                  #' @param index index of feature.
                  #'
                  #' @return Feature object.
                  getFeature = function(index){
                      # wrapping the python object.
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
