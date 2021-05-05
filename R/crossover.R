#' crossover
#' 
#' @title Uniform Crossover Operator
#' 
#' @description This function performs the uniform crossover between two chromosomes
#' 
#' @references 
#' Spears, W.M., DeJong, K.A.(1991). On the virtues of parameterized
#' uniform crossover. In: Proceedings of the Fourth International
#' Conference on Genetic Algorithms, pp. 230b.
#'
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
'crossover_R'


crossover_R <- function(object){
  # set.seed(1)
  
  # ch_a - chromossome in elite population
  # ch_b - chrmossome in non-elite population
  xover <- cbind('ch_a' = sample(1:object@nelite, 
                                 size = object@ncrossover, 
                                 replace = TRUE),
                 'ch_b' = sample((object@nelite+1):object@popSize,
                                 size = object@ncrossover,
                                 replace = TRUE),
                 object@pcrossover > matrix(data = runif(n = object@ncrossover * object@p), ncol = object@p,
                                            dimnames = list(1:object@ncrossover, paste0('RK',1:object@p))))
  
  # uniform crossover
  apply(xover, 1, function(x){
    ifelse(x[3:length(x)], object@population[x[1], ], object@population[x[2], ])
  }
  ) %>% 
  t()
  
}


