#' yield_while
#'
#' @description Keep yielding the next element of an `Iterator` while a condition is met.
#' A condition is some function involving any variable(s) in the `Iterator` environment
#' @param iter An `Iterator` object
#' @param cond A quoted logical expression involving some variable(s) in `iter$initial`, so that `yield_next()`
#' continues being called while the expression returns TRUE
#'
#' @examples
#' expr <- "if (n %% 2 == 0) n <- n / 2 else n <- n*3 + 1"
#' collatz <- Iterator(result = expr,
#'                     initial = c(n = 50),
#'                     yield = n)
#'yield_while(collatz, "n != 1L")
#'
#' @export
#'

yield_while <- function(iter, cond) {
  ret <- vector()
  cond <- rlang::parse_expr(cond)
  while (rlang::eval_bare(cond, env = iter$initial)) {
    ret <- c(ret, yield_next(iter))
  }
  ret
}