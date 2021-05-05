

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




//' Multiplies two doubles
//'
//' @param v1 First value
//' @param v2 Second value
//' @return Product of v1 and v2
//' @noRd
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



/***
# t_brkga <- BRKGApp::brkga(iris[, -5], Rcpp = TRUE)
# #genpop_R(t_brkga)
# genpop_Rcpp(t_brkga)
# #genpop(t_brkga)
*/



//' Multiplies two doubles
//'
//' @param v1 First value
//' @param v2 Second value
//' @return Product of v1 and v2
//' @noRd
// [[Rcpp::export]]
NumericMatrix genmut_Rcpp(RObject object)
{
  int mutSize = object.slot("ncrossover");
  int nvars = object.slot("p");
  NumericMatrix mut(mutSize, nvars);
  
  std::fill(mut.begin(), mut.end(), NumericVector::get_na() );
  
  for(int j=0; j < nvars; j++)
  {
    mut(_,j) = Rcpp::runif(mutSize);
  }
  
  return mut;
}



/***
# t_brkga <- BRKGApp::brkga(iris[, -5], Rcpp = TRUE)
# #genmut_R(t_brkga)
# genmut_Rcpp(t_brkga)
# #genmut(t_brkga)
*/
