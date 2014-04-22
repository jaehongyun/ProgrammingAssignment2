## Put comments here that give an overall description of what your
## functions do

## a wrapper function to set and get inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  ix <- NULL ## inverse matrix of x
  set <- function(y) {
    x <<- y
    ix <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) ix <<- inverse
  getinverse <- function() ix
  list (set = set, get = get, 
        setinverse = setinverse,
        getinverse = getinverse)
}


## if the inverse matrix of x is cached, return it or solve and return it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    ix <- x$getinverse()
    if (!is.null(ix)) {
      message("getting cached data")
      return(ix)
    }
    mat <- x$get()
    ix <- solve(mat)
    x$setinverse(ix)
    ix
}
