#' MSSpectrum Interface
#'
#' @section Constructor: MSSpectrum$new()
#'
#' @section Methods:
#' \code{$getMSLevel()} Get Spectrum Level.
#'
#' \code{$setMSLevel()} Set Spectrum Level.
#'
#' \code{$getRT()} Get the retention time.
#'
#' \code{$setRT()} Set the retention time.
#'
#' \code{$get_peaks()} Get the peak values(m/z and intensity) as a list containing two lists, for m/z and intensity.
#'
#' \code{$set_peaks()} Set the peak values(m/z and intensity) as a list containing two lists, for m/z and intensity.
#'
#' \code{$size()} Get the count of peaks.
#'
#' @name MSSpectrum
#' @include package.r
NULL

#' @export
MSSpectrum <- R6::R6Class("MSSpectrum",cloneable = FALSE,

              private = list(
                py_obj = NULL
              ),


              public = list(

                initialize = function(){
                  private$py_obj = ropenms$MSSpectrum()
                },

                #' @description Get Spectrum Level
                #'
                #' @return Spectrum Level.
                getMSLevel = function(){
                  private$py_obj$getMSLevel()
                },

                #' @description Set Spectrum Level
                #'
                #' @param level level number.
                setMSLevel = function(level){
                  private$py_obj$setMSLevel(level)
                },

                #' @description Get Retention Time
                #'
                #' @return retention time
                getRT = function(){
                  private$py_obj$getRT()
                },

                #' @description Set Retention Time
                #'
                #' @param time RT for the spectrum
                setRT = function(time){
                  private$py_obj$setRT(time)
                },

                #' @description Get peak list from the Spectrum
                #'
                #' @return list of two lists, for m/z and intensity, corresponding to peaks.
                get_peaks = function(){
                  private$py_obj$get_peaks()
                },

                #' @description Set peak list for the Spectrum
                #'
                #' @param peaks list with two lists, for m/z and intensity, corresponding to peaks.
                set_peaks = function(peaks){
                  private$py_obj$set_peaks(peaks)
                  invisible(self)
                },

                #' @description Get the count of peaks.
                #'
                #' @return count of peaks.
                size = function(){
                 private$py_obj$size()
                },

                #' @description Setter method for wrapped object.
                #' @details Sets the underlying python object of MSSpectrum.
                set_py_obj = function(Py_obj){
                  private$py_obj <- Py_obj
                  invisible(self)
                },

                #' @description Getter method for wrapped object.
                #' @details Returns the underlying python object of MSSpectrum.
                get_py_obj = function(){
                  return(private$py_obj)
                }
              )
)
