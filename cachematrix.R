## Put comments here that give an overall description of what your
## functions do
# makeCacheMatrix takes a matrix as parameter and returns a list of function to get/set matrix and its inverse.
# cacheSolve uses the object returned by makeCacheMatrix to set the inverse and cache it. The cached inverse is
# returned if available, otherwise it is calculated.

## Write a short comment describing this function
# makeCacheMatrix function takes a optional matrix as arguments and returns a list which has following members
# get : A function which just returns the matrix
# set : A function to set the matrix to a new matrix
# setinverse: A function to set the matrix inverse
# getinverse: A function which returns the inverse of the current matrix
# if no matrix is given as argument, an empty matrix is passed.
#####

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    
    get <- function() x
    
    setinverse <- function(inv) invese <<- inv
    
    getinverse <- function() inverse
    
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function
# cacheSolve takes the matrix object constructed above as parameter and returns the inverse of the matrix.
# if the inverse is cached, then the cached inverse is returned otherwise it is calculated via solve function.
# The calculated inverse is then set in the matrix object and returned.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    mtx <- x$get()
    inv <- solve(mtx)
    x$setinverse(inv)
    
    inv
}
