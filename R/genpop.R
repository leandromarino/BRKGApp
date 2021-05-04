
# Generate a random population ----
genpop <- function(object, ...)
{
  if(brkgaControl("useRcpp"))
    genpop_Rcpp(object)
  else
    genpop_R(object)
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


