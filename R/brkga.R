#' brkga
#' @title BRKGA Algorithm
#' @description This function applies brkga algorithm to solve a 
#' problem considering problem-dependent objective function and decoder
#' 
#' @references 
#' Gonçalves, J.F., Resende, M.G.C. Biased random-key genetic
#' algorithms for combinatorial optimization. J Heuristics 
#' 17, 487–525 (2011). <https://doi.org/10.1007/s10732-010-9143-1>
#'  
#' Gonçalves J.F., Resende M.G.C. (2018) Biased Random-Key 
#' Genetic Progamming. In: Martí R., Pardalos P., Resende M.
#' (eds) Handbook of Heuristics. Springer, Cham. 
#' <https://doi.org/10.1007/978-3-319-07124-4_25>
#'
#' @author Leandro Marino (rdev@leandromarino.com.br)
#' 
#' @param data Vector or Matrix (data to calculate objective function)
#' @param popSize Number of chromosomes (elements) in the population
#' @param Rcpp Use Rcpp code? (default = FALSE)
#' @param pelite Percentual of elite  chromosomes
#' @param pmutation Percentual of mutant chromosomes
#' @param pcrossover Crossover probability
#' 
#' @export
#' @examples
#' 
#' data(iris)
#' t_brkga <- BRKGApp::brkga(iris[, -5], Rcpp = TRUE)
#' t_brkga
#' genpop_R(t_brkga)
#' genpop_Rcpp(t_brkga)
#' genpop(t_brkga)
#' 
#' genmut(t_brkga)
#' genmut_R(t_brkga)
#' genmut_Rcpp(t_brkga)
#' 
'brkga'




setClass(Class = "brkga",
         representation(call = "language",
                        data = 'data.frame',
                        Rcpp = 'logical',
                        type = "character",
                        popSize = "numeric",
                        iter = "numeric",
                        run = "numeric",
                        maxiter = "numeric",
                        suggestions = "matrix",
                        population = "matrix",
                        nxtpop = 'matrix',
                        p = 'integer',
                        pelite = "numeric",
                        pcrossover = "numeric",
                        pmutation = "numeric",
                        nelite = 'numeric',
                        nnotelite = 'numeric',
                        nmutant = 'numeric',
                        ncrossover = 'numeric'),
         package = "BRKGApp")





brkga <- function(data, decoder, 
                  popSize = 500, 
                  Rcpp = FALSE, 
                  pelite = 0.2, pmutation = 0.1, pcrossover = 0.7){

  call <- match.call()
  
  ## defining general variables 
  # divide in elite and non-elite  
  nelite = round(popSize * pelite) 
  nnotelite = popSize - nelite
  
  # number of mutants and crossover in gen + 1
  nmutant = round(popSize * pmutation)
  ncrossover = popSize - nelite - nmutant
  
  
  object <- new('brkga',
                call          = call,
                data          = data,
                Rcpp          = Rcpp,
                popSize       = popSize,
                p             = ncol(data),
                pelite        = pelite,
                pmutation     = pmutation,
                pcrossover    = pcrossover,
                nelite     = nelite,
                nnotelite  = nnotelite,
                nmutant    = nmutant,
                ncrossover = ncrossover)
  
  
  object@population <- genpop(object)
  
  #generating next population
  object@nxtpop <- rbind(object@population[1:object@nelite, ],
                         crossover_R(object),
                         genmut(object))
  
  object
  
  

}


setMethod("print", "brkga", function(x, ...) str(x))
