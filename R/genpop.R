#' genpop
#' 
#' @title Population Generation
#' 
#' @description This generate the chromossome population
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
#' genpop(t_brkga)
#' genpop_R(t_brkga)
#' genpop_Rcpp(t_brkga)
#' 
#' 
#' 



# Generate a random population ----
genpop <- function(object, ..)
{
  if(object@Rcpp){
    population <- genpop_Rcpp(object)    
  } 
  else{
    population <- genpop_R(object)
  }
  
  dimnames(population) <- list(c(1:nrow(population)),
                               paste0('RK', 1:ncol(population)))
  
  population
}

genpop_R <- function(object)
{
  nvars <- object@p
  population <- matrix(as.double(NA), nrow = object@popSize, ncol = object@p)
  for(j in 1:object@p)
  {
    population[,j] <- runif(object@popSize)
    
  }
  return(population)
}


