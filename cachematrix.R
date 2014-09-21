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
    
    #constructor
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
    
}


## This function computes the inverse of of the matrix object

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverseM <- x$getInverse()
    #if the value of inverseM is not null then pull the value from cache
    if(!is.null(inverseM)){
        message('getting cached data')
        return(inverseM)
    }
    #calculate the inverse if it hasnt been cached already
    inverseM <- solve(x$get())
    #set the value of the inverse in cache
    x$setInverse(inverseM)
    #return the inverse of x.
    inverseM
    
}
