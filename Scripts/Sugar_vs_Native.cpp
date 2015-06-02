// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::depends(BH)]]

#include <RcppArmadillo.h>
#include <boost/random.hpp>
#include <boost/random/uniform_real_distribution.hpp>
#include <boost/random/gamma_distribution.hpp>
#include <math.h>
#include <cmath>

using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix gibbs_cpp(int N, int thin) {
  NumericMatrix mat(N, 2);
  double x = 0, y = 0;
  
  for(int i = 0; i < N; i++) {
    for(int j = 0; j < thin; j++) {
      x = rgamma(1, 3, 1 / (y * y + 4))[0];
      y = rnorm(1, 1 / (x + 1), 1 / sqrt(2 * (x + 1)))[0];
    }
    mat(i, 0) = x;
    mat(i, 1) = y;
  }
  
  return(mat);
}

namespace mjd{
    double rgamma( double shape, double scale, boost::mt19937& rng ) {
      boost::gamma_distribution<> gd( shape );
      boost::variate_generator<boost::mt19937&,boost::gamma_distribution<> > var_gamma( rng, gd );
      return scale*var_gamma();
    }

  }

// [[Rcpp::export]]
arma::mat gibbs_cpp2(int N, int thin) {
  boost::random::mt19937 generator; 
  arma::mat mymat = arma::zeros(N, 2);
  double x = 0, y = 0;
  
  for(int i = 0; i < N; i++) {
    for(int j = 0; j < thin; j++) {
      x = mjd::rgamma( 3, 1/(y * y + 4),generator);
      boost::normal_distribution<double> normdist(1 / (x + 1),1 / sqrt(2 * (x + 1)));
      y = normdist(generator);
    }
    mymat(i, 0) = x;
    mymat(i, 1) = y;
  }
  return(mymat);
}




/*** R
cat("Rcpp Sugar")
system.time({
  result1 <- gibbs_cpp(1000000,10)
})
#  user  system elapsed 
# 6.435   0.072   6.640 

cat("Native C++")
system.time({
  result2 <- gibbs_cpp2(1000000,10)[[1]]
})
#  user  system elapsed 
# 3.080   0.031   3.156

*/