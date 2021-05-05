myfun <- function(par1, a, b){
  a*par1 + b
} 

FUN1 <- myfun
FUN2 <- myfun
x <- 40:50
pf1 = list(x = 'x', a = 2, b = 0)
pf2 = list(x = 10:20, a = 2, b = 0)

# *pf1 named list with fun1 parameters. 
# *pf2 named list with fun2 parameters.

proc <- function(x, y, FUN1, pf1, FUN2, pf2){
  
  args <- as.list(match.call(expand.dots=FALSE))
  
  args
               
  for(aux in intersect(names(args), names(pf1))){
    pf1[aux] <- args[aux]
  }
  
  for(aux in intersect(names(args), names(pf2))){
    pf2[aux] <- args[aux]
  }
  
  rf1 <- base::do.call(FUN1, pf1)
  
  rf2 <- base::do.call(FUN2, pf2)
   
  list(rf1, rf2)
}


args <- proc(x = 40:50, y = 100:110, 
             FUN1 = myfun, FUN2 = myfun,
             pf1 = list(par1 = c('x','y'), a = 2, b = 0),
             pf2 = list(par1 = 'y', a = 2, b = 0))

lapply(pf1, function(x){
  sum(names(args) == x) == 1
}



)

get(pf1$par1)

is.character(pf1)

iris[1,]

library(magrittr)
iris %$% 
  c(mean(Sepal.Width), table(Species))
  
pf1
args



names(pf2)

base::do.call(FUN1, pf1)


base::do.call(FUN2, pf2)


pf2
