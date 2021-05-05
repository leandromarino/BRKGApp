// [[Rcpp::depends(RcppArmadillo)]]

#include <RcppArmadilloExtensions/sample.h>

using namespace Rcpp ;

// [[Rcpp::export]]
CharacterVector csample_char( CharacterVector x, 
                              int size,
                              bool replace, 
                              NumericVector prob = NumericVector::create()
) {
  CharacterVector ret = RcppArmadillo::sample(x, size, replace, prob) ;
  return ret ;
}



/***R

N <- 10
set.seed(7)
sample.r <- sample(letters, N, replace=T)
  
set.seed(7)
sample.c <- csample_char(1:5, N, replace=T)
  
print(identical(sample.r, sample.c))

*/



