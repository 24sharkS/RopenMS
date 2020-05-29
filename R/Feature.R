#' Feature Interface
#'
#' @section Constructor: Feature$new()
#'
#' @section Methods:
#' \code{$getUniqueId()} Get Feature ID
#'
#' \code{$getMZ()} Get Mass to Charge(M/Z) value of feature.
#'
#' @name Feature
#' @include ropenms-global.R
NULL

#' @export
Feature <- R6::R6Class("Feature",cloneable = FALSE,
            private = list(
              py_obj = ropenms$Feature()
            ),

            public = list(

              #' @description Get Feature ID
              #'
              #' @return feature ID.
              getUniqueId = function(){
                private$py_obj$getUniqueId()
              },

              #' @description Get Mass to Charge(M/Z) value of feature.
              #'
              #' @return M/Z value.
              getMZ = function(){
                private$py_obj$getMZ()
              },

              #' @description Setter method for wrapped object.
              #' @details Sets the underlying python object of Feature.
              set_py_obj = function(Py_obj){
                private$py_obj <- Py_obj
                invisible(self)
              },

              #' @description Getter method for wrapped object.
              #' @details Returns the underlying python object of Feature.
              get_py_obj = function(){
                return(private$py_obj)
              }

            )
)
