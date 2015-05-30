#include <RcppArmadillo.h>
//[[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//[[Rcpp::export]]
List My_Function(
    double my_double,
    int some_number,
    arma::vec a_vector,
    arma::mat example_matrix,
    NumericVector array,
    List some_vectors,
){
  IntegerVector dim = array.attr("dim"); 
  arma::cube my_array(array.begin(),dim[0], dim[1], dim[2], false);
  
  double new_double = 100*my_double;
  
  List to_return(1);
  to_return[0] = new_double;
  return to_return;
}