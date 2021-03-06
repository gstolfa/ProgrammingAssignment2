## One function store the matrix and initialize the  inverse to null, the othe function 
## compute the inverse calling solve function only after checking if there is already.

## wrap a matrix and prvides get, set, getsolve and setsolve.
makeCacheMatrix <- function(x = matrix()) {
        
        s <- NULL
        
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        
        get <- function() x
        
        setsolve <- function(solve) s <<- solve
        
        getsolve <- function() s
        
        list(set = set, get = get,
             setsolve = setsolve, 
             getsolve = getsolve)
        
}


## Return a matrix that is the inverse of 'x', 
## but first check if there is already.
cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        
        data <- x$get()
        
        s <- solve(data, ...)
        
        x$setsolve(s)
        
        s
}
