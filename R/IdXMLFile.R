#' IdXMLFile Interface
#'
#' @section Constructor: IdXMLFile$new()
#'
#' @section Methods:
#' \code{$load()} Load details from IdXML file.
#'
#' \code{$store()} Store details in IdXML file.
#'
#' @name IdXMLFile
#' @importFrom reticulate r_to_py
#' @importFrom reticulate py_to_r
#' @include package.r
NULL

#' @export
IdXMLFile <- R6::R6Class("IdXMLFile",cloneable = FALSE,
              private = list(
                py_obj = NULL
              ),

              public = list(

                initialize = function(){
                  private$py_obj <- get_python_obj()$IdXMLFile()
                },

                #' @description Load details from IdXML file
                #'
                #' @param filename name of the idXML file.
                #' @param protein_ids list of ProteinIdentification objects.
                #' @param peptide_ids list of PeptideIdentification objects.
                load = function(filename,protein_ids,peptide_ids){

                  # We can pass the argument lists directly without `r_to_py` as, as this conversion is automated,
                  # but we need to save the reference for conversion later.
                  prot = r_to_py(protein_ids)
                  pep = r_to_py(peptide_ids)
                  private$py_obj$load(filename,prot,pep)

                  # This allows the change to reflect in actual lists passed as arguments,
                  # since R uses pass-by-value semantics.
                  eval.parent(substitute(protein_ids<-py_to_r(prot)))
                  eval.parent(substitute(peptide_ids<-py_to_r(pep)))
                },


                #' @description Store details in IdXML file.
                #'
                #' @param filename name of the idXML file.
                #' @param protein_ids list of ProteinIdentification objects.
                #' @param peptide_ids list of PeptideIdentification objects.
                store = function(filename,protein_ids,peptide_ids){

                  private$py_obj$load(filename,protein_ids,peptide_ids)
                }

              )
)
