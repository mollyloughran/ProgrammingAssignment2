## Functions create store a matrix in cache and tests to see if 
## cached matrix exists before calculating inverse.


## Function that generates a list of functions to be set, and get a matrix
## and set and get cache. Lists functions to be called by cacheSolve

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y,...) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, setinverse = setinverse, 
             getinverse = getinverse)
}


## Checks if there is already a cached inverted matrix, if yes, returns 
## cache and inverse. If not, calculates inverted matrix and sets cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get ()
        m <- solve(data,...)
        x$setinverse(m)
        m
}
