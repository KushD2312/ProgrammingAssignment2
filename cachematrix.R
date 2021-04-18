## To write a couple of functions that cache the inverse of a matrix

## Creates a matrix to cache its inverse

makeCacheMatrix <- function(m = matrix()) {
  ## TO initialize the inverse
  k <- NULL
  
  ## Setting the matrix
  set <- function( matrix ) {
    m <<- matrix
    k <<- NULL
  }
  ## Getting the matrix
  get <- function() {
    ## Return the matrix
    m
  }
  ## Setting the inverse of the matrix
  setInverse <- function(inverse) {
    k <<- inverse
  }
  ## Gettingt the inverse of the matrix
  getInverse <- function() {
    ## To return the inverse
    k
  }
  ## Return a list
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## To retrieve inverse from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  ## Returning the inverse if it is already set
  if( !is.null(m) ) {
    message("Fetching cached data")
    return(m)
  }
  
  ## Getting the matrix
  data_mat <- x$get()
  
  ## Calculating the inverse of the given matrix
  m <- solve(data_mat) %*% data_mat
  
  ## Setting the inverse
  x$setInverse(m)
  
  ## Returning the matrix
  m
}

