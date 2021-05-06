myfun <- function(par1, a, b){
  a*par1 + b
} 

FUN1 <- myfun
FUN2 <- myfun
x <- 40:50
pf1 = list(par1 = 'x', a = 2, b = 0)
pf2 = list(par1 = 10:20, a = 2, b = 0)

# *pf1 named list with fun1 parameters. 
# *pf2 named list with fun2 parameters.

proc <- function(x, y, FUN1, decoder_par, FUN2, fitfun_par{
  
  args <- as.list(match.call(expand.dots=FALSE))
  args
  
  # retrieving the names of arguments which
  #  matches with names of parameter of decoder function
  param <- decoder_par
  aux <- lapply(param, function(x){
    sum(names(args) == x) == 1
  }) %>% 
    unlist() %>% 
    which() %>% 
    names()
  for(nam in aux){
    param[[nam]] <- get(param[[nam]])
  }
  decoder_par <- param 
  rm(param)
  
  
  
  # retrieving the names of arguments which
  #  matches with names of parameter of fitness function
  param <- fitfun_par
  aux <- lapply(param, function(x){
    sum(names(args) == x) == 1
  }) %>% 
    unlist() %>% 
    which() %>% 
    names()
  for(nam in aux){
    param[[nam]] <- get(param[[nam]])
  }
  fitfun_par <- param 
  rm(param)
  
}

# to avoid duplication of files the pf1 and pf2 accepts 
# a argument from the main function as text.
# 
args <- proc(x = 40:50, y = 100:110, 
             FUN1 = myfun, FUN2 = myfun,
             pf1 = list(par1 = c('x','y'), a = 2, b = 0),
             pf2 = list(par1 = 'y', a = 2, b = 0))
args

args <- proc(40:50, 100:110, 
             FUN1 = myfun, 
             FUN2 = myfun,
             pf1 = list(par1 = 'x', a = 2, b = 0),
             pf2 = list(par1 = 'y', a = 2, b = 0))
args

param <- pf1
aux <- lapply(param, function(x){
      sum(names(args) == x) == 1
  }) %>% 
    unlist() %>% 
    which() %>% 
    names()
aux
  for(nam in aux){
    param[[nam]] <- get(param[[nam]])
  }
  param 


named_parameters_conv(pf1)

for(aux in intersect(names(args), names(pf2))){
  pf2[aux] <- args[aux]
}




http://teachtogether.tech/es/index.html#s:models-formative-assessment
https://education.rstudio.com/trainers/
  https://win-vector.com/2019/04/02/standard-evaluation-versus-non-standard-evaluation-in-r/
  
  
  e <- quote(`foo bar`)
deparse(e)
deparse(e, backtick = TRUE)
e <- quote(`foo bar`+1)
deparse(e)
deparse(e, control = "all") # wraps it w/ quote( . )



myfun <- function(par1, a, b){
  a*par1 + b
} 

nl <- function(x = 1, ...) {
  dots <- pryr::named_dots(...)
  lapply(dots, eval, parent.frame())
}

temp <- nl(1, myfun, 'b', data = iris, a = 1, b = 5, par1 = 10:20)

temp

formalArgs(temp$myfun)

do.call(temp$myfun, temp[formalArgs(temp$myfun)])

myfun(a = 1, b = 5, par1 = 10:20)





library(magrittr)
eval(temp$myfun)
temp$myfun %>% str()



tmpfun <- function(leandro, decoder,...) {
  args <- as.list(match.call())
  lapply(args, eval, parent.frame())
}


temp <- tmpfun(leandro = 1, decoder = myfun, 'b',
               data = iris[1:5,],
               a = 1, b = 5, 
               par1 = 10:20)


do.call(temp$decoder, temp[formalArgs(temp$decoder)])
