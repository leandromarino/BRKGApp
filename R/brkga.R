setClass(Class = "brkga",
         representation(call = "language",
                        data = 'data.frame',
                        type = "character",
                        popSize = "numeric",
                        iter = "numeric",
                        run = "numeric",
                        maxiter = "numeric",
                        suggestions = "matrix",
                        population = "matrix",
                        p = 'integer',
                        elitism = "numeric",
                        pcrossover = "numeric",
                        pmutation = "numeric"),
         package = "BRKGApp")


brkga <- function(data, popSize = 500){
  call <- match.call()

  object <- new('brkga',
                call = call,
                data = data,
                popSize = popSize,
                p = ncol(data))

  object

}


setMethod("print", "brkga", function(x, ...) str(x))
# 
# brkga(iris[, -5])
