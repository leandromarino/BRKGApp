t_brkga <- BRKGApp::brkga(iris[, -5], Rcpp = TRUE)
t_brkga
genpop_R(t_brkga)
genpop_Rcpp(t_brkga)
genpop(t_brkga)

genpop(t_brkga)
genpop_R(t_brkga)
genpop_Rcpp(t_brkga)


t_brkga@population[1:4,]
t_brkga@nxtpop[1:4,]
