## example usage:
## m1 = matrix(c(1,2,3,4), nrow=2, ncol=2)
## m2 = makeCacheMatrix(m1)
## the above commands creates the CacheMatrix 
#  (inverse is still not cacluted)

## cacheSolve(m2)
# the above call results in the inverse being calculated and saved in cache
# any subsequent calls you will notice, the inverse matrix is returned from cache 
## cahceSolve(m2)
## 


## this function creates the object(ie along with functions)
##  for the given matrix, it can also save its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set = function(y) {
    x <<- y 
    m <<- NULL
  }
  get <- function() x
  setInvMatrix <- function(invm){ 
      m <<- invm
  }
  getInvMatrix <- function() m
  list(set = set, get = get,
       getInvMatrix = getInvMatrix,
       setInvMatrix = setInvMatrix)
}



# this function checks if the inverse exists,
# if so, it will retun it from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInvMatrix()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  # get the matrix and calculate its inverse
  matrix1 <- x$get()
  m <- solve(matrix1)
  x$setInvMatrix(m)
  m
}
