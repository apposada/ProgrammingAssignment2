## Put comments here that give an overall description of what your
## functions do

## this function creates a list of functions with access to the value in the
## formal argument; i. e. a numeric matrix. These functions are able to 
## access and mutate the matrix value as well as its inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
 s=NULL
 setmatrix <- function(y){
   x <<- y
   s <<- NULL
 }
 getmatrix <- function() x
 setsolve <- function(y){
   s <<- y
 }
 getsolve <- function() s
 list(setmatrix = setmatrix, getmatrix = getmatrix, 
      setsolve = setsolve, getsolve = getsolve)
}


## This function retrieves the value of the inverse matrix stored in its
## formal argument, if any, and either prints it out or calculates it
## using the formal argument's functions. Finally it stores it in the formal
## argument's values.

cacheSolve <- function(x, ...) {
  solv <- x$getsolve()
  if (!is.null(solv)){
    print("getting solve from cache")
    solv
  } else {
    data <- x$getmatrix()
    solv <- solve(data, ...)
    x$setsolve(solv)
    solv
  }
  ## Return a matrix that is the inverse of 'x'
}
