#' Python-style range function
#'
#' Wrapper around \code{base::seq()} that replaces the maximal end value with the supremum
#' and returns an empty vector if b <= a, in the style of Python's \code{range()}.
#' Note that \code{peruse::range} views end as a supremum, not a maximum, thus range(a,b)
#' is equivalent to the set `[`a,b) when a < b or `{}` when b >= a.
#'
#' @param a minimum
#' @param b supremum
#' @param ... other params passed to `base::seq()`
#' @seealso [base::seq()]
#' @examples
#' range(1,5)
#' range(9,10)
#' range(1,6, by = 2)
#' @export

range <- function(a,b, ...) {
  if (a < b) return(seq(a, b-1,...)) else return(numeric())
}
