## Put comments here that give an overall description of what your
## functions do
makeCacheMatrix takes a matrix as input. It basically provides list of the setter and getter functions for the 'x' matrix and inverse of the 'x' matrix.
cacheSolve is a function that takes a list as input. It first gets the inverse of the 'x' matrix and then checks if the inverse of matrix 'x' is already available in cache. If it is available, then it gets it from cache. Else, if not available then it itself calculates the reverse matrix and returns it.

## Write a short comment describing this function
makeCacheMatrix has 4 functions defined inside it. 
	set: It sets the 'x' matrix and also its inverse. It is assumed that 'x' is invertible.
	get: It returns 'x'
	setInverse: It sets the inverse of 'x'
	getInverse: It returns the inverse of 'x'
makeCacheMatrix returns a list of functions. Within that return statement, it calls the set() function by passing 'x' as argument so that the inverse of 'x' is calculated and stored in the variable 'inv'

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- solve(y)
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set(x), get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
cacheSolve function firstly retrieves the inverse of 'x' matrix and finds whether the inverse is really avaialable or not in the cache by using the if block. If the inverse is available that means it has retrieved from cache and will return it. If the inverse is not available then it will itself calculate the inverse and return it.

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  m <- solve(data)
  x$setInverse(m)
  m
}
