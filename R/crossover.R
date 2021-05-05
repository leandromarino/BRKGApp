# setClass(Class = "brkga_crossover",
#          representation(call = "language",
#                         data = 'data.frame',
#                         Rcpp = 'logical',
#                         type = "character",
#                         popSize = "numeric",
#                         iter = "numeric",
#                         run = "numeric",
#                         maxiter = "numeric",
#                         suggestions = "matrix",
#                         population = "matrix",
#                         p = 'integer',
#                         pelite     = "numeric",
#                         pcrossover = "numeric",
#                         pmutation  = "numeric"),
#          package = "BRKGApp")
# 

Pop = BRKGApp::brkga(data = iris[, -5])
Pop@population = genpop_R(Pop)

crossover <- function(Pop){
  # call <- match.call()
  # 
  # object <- new('brkga',
  #               call = call,
  #               data = data,
  #               Rcpp = Rcpp,
  #               popSize = popSize,
  #               p = ncol(data))
  
  population = Pop@population
  popSize    = Pop@popSize
  pelite     = Pop@pelite
  pmutation  = Pop@pmutation
  pcrossover = Pop@pcrossover
  nvars      = Pop@p

  # divide in elite and non-elite  
  num_elite = round(popSize * pelite)
  num_notelite = popSize - num_elite
  
  # number of mutants and crossover in gen + 1
  num_mutant = round(popSize * pmutation)
  num_crossover = popSize - num_elite - num_mutant
  
  set.seed(1)
  pcrossover > matrix(data = runif(n = num_crossover * nvars) , ncol = nvars)
  
  ch_a <- sample(1:num_elite, size = num_crossover, replace = TRUE)
  ch_b <- sample(num_elite+1:popSize, size = num_crossover, replace = TRUE)

  
  
  
}
