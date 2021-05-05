//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//                         BRGKA Rcpp functions              \              //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////

#include <RcppArmadillo.h>
#include <RcppArmadilloExtensions/sample.h>
// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;

//
// Miscellaneous functions
//

// [[Rcpp::export]]

NumericMatrix genpop_Rcpp(RObject object)
{
  int popSize = object.slot("popSize");
  int nvars = object.slot("p");
  NumericMatrix pop(popSize, nvars);
  std::fill(pop.begin(), pop.end(), NumericVector::get_na() );

  for(int j=0; j < nvars; j++)
  {
    pop(_,j) = Rcpp::runif(popSize);
  }

  return pop;
}



/***R
# t_brkga <- BRKGApp::brkga(iris[, -5], Rcpp = TRUE)
# #genpop_R(t_brkga)
# genpop_Rcpp(t_brkga)
# #genpop(t_brkga)
*/
