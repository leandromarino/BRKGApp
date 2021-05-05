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
                        p = 'integer',
                        pelite = "numeric",
                        pcrossover = "numeric",
                        pmutation = "numeric"),
         package = "BRKGApp")


brkga <- function(data, popSize = 500, Rcpp = FALSE, 
                  pelite = 0.2, pmutation = 0.1, pcrossover = 0.7){
  call <- match.call()

  object <- new('brkga',
                call = call,
                data = data,
                Rcpp = Rcpp,
                popSize = popSize,
                p = ncol(data),
                pelite = pelite,
                pmutation = pmutation,
                pcrossover = pcrossover)

  object

}


setMethod("print", "brkga", function(x, ...) str(x))

# 
# brkga(iris[, -5])
# 
# 
# t_brkga <- BRKGApp::brkga(iris[, -5], Rcpp = TRUE)
# t_brkga
# genpop_R(t_brkga)
# genpop_Rcpp(t_brkga)
# genpop(t_brkga)

