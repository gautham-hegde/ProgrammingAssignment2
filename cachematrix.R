## The following pair of functions cache the inverse of a matrix


##This function creates a special cache matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    invMatrix <- NULL
    #setter function for matrix
    set <-function(y){
        x <<- y
        invMatrix <<- NULL
    }
    #getter function for matrix
    get <- function() x
    
    #setter function for inverse of matrix
    setInverse <- function(inv) invMatrix <<- inv
    
    #getter function for inverse of matrix
    getInverse <- function() invMatrix
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
    
}


## This function computes the inverse of of the matrix object

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverseM <- x$getInverse()
    if(!is.null(inverseM)){
        message('getting cached data')
        return(inverseM)
    }
    inverseM <- solve(x$get())
    x$setInverse(inverseM)
    inverseM
    
    
}
