#' genmut
#' 
#' @title Mutant Population Generation
#' 
#' @description This generate the mutant population
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
#' @param obejct brkga object
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
#' 
#' 



genmut <- function(object, ..)
{
  if(object@Rcpp){
    genmut_Rcpp(object)    
  } 
  else{
    genmut_R(object)
  }
    
}




genmut_R <- function(object)
{
  nvars <- object@p
  population <- matrix(as.double(NA), nrow = object@nmutant, ncol = object@p)
  for(j in 1:object@p)
  {
    population[,j] <- runif(object@nmutant)
    
  }
  return(population)
}


