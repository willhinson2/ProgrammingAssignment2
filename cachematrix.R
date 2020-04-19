## Two functions that will combine to cache the inverse of a matrix

## This function will create an object that can be inversed if it has not done so already. 

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL 
    set <- function ( matrix ) {
      x <- matrix
      i <- NULL
    }
    
    get <- function () {
      x
    }
    
    set_inverse <- function(inverse) {
      i <- inverse
    }
    
    get_inverse <- function () {
      i
    }
   list (set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse) 
}


## Function will return either the inverse of the created matrix if the same or compute the inverse if different

cacheSolve <- function(x, ...) {
        
  m <- x$get_inverse()
  if( !is.null(m)) {
    message ("getting cached data")
    return (m)
  }
  
  raw_data <- x$get()
  
  m <- solve(raw_data) "%*%" raw_data
  
  x$set_inverse(m)
  m
}
