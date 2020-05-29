#' MSExperiment Interface
#'
#' @section Constructor: MSExperiment$new()
#'
#' @section Methods:
#' \code{$getMSLevels()} Get Spectrum Levels.
#'
#' \code{$getNrSpectra()} Get number of Spectrums.
#'
#' \code{$getSpectra()} Get list of Spectrums.
#'
#' \code{$getSpectrum()} Get a specific Spectrum by position.
#'
#' \code{$setSpectra()} Set the spectrums for experiment.
#'
#' \code{$size()} Get total number of experiments.
#'
#' @name MSExperiment
#' @include package.r
NULL

#' @export
MSExperiment <- R6::R6Class("MSExperiment",cloneable = FALSE,
                private = list(
                  py_obj = NULL
                ),

                public = list(

                  initialize = function(){
                    private$py_obj <- ropenms$MSExperiment()
                  },

                  #' @description Get Spectrum Levels.
                  #'
                  #' @return list of spectrum levels.
                  getMSLevels = function(){
                    private$py_obj$getMSLevels()
                  },

                  #' @description Get number of Spectrums
                  #'
                  #' @return total number of spectrums.
                  getNrSpectra = function(){
                    private$py_obj$getNrSpectra()
                  },

                  #' @description Get list of Spectrums.
                  #'
                  #' @return list of spectrums.
                  getSpectra = function(){

                    # To return the list of "MSSpectrum" class objects wrapping the underlying python object.
                    lapply(private$py_obj$getSpectra(), function(x) MSSpectrum$new()$set_py_obj(x))
                  },

                  #' @description Get a specific Spectrum.
                  #'
                  #' @param id spectrum number.
                  #'
                  #' @return spectrum.
                  getSpectrum = function(id){
                    # wrapping
                    mssp <- MSSpectrum$new()
                    mssp$set_py_obj(private$py_obj$getSpectrum(as.integer(id-1)))
                    return(mssp)
                  },

                  #' @description Set the spectrums for experiment.
                  #'
                  #' @param spectra list of MSSpectrum objects.
                  setSpectra = function(spectra){

                    # To set the spectra for the underlying python object of "MSSpectrum"
                    new_spectra <- lapply(spectra, function(x) x$get_py_obj())
                    private$py_obj$setSpectra(new_spectra)
                  },

                  #' @description Get total number of experiment entities.
                  #'
                  #' @return total number of experiments.
                  size = function(){
                    private$py_obj$size()
                  },

                  #' @description Setter method for wrapped object.
                  #' @details Sets the underlying python object of MSExperiment.
                  set_py_obj = function(Py_obj){
                    private$py_obj <- Py_obj
                    invisible(self)
                  },

                  #' @description Getter method for wrapped object.
                  #' @details Returns the underlying python object of MSExperiment.
                  get_py_obj = function(){
                    return(private$py_obj)
                  }


        )

)
